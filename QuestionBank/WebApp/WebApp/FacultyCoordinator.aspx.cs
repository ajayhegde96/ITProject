using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        string str = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=QuestionBank;Integrated Security=True;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Sid"] == null)
                Response.Redirect("Login.aspx");
            string user = Request.QueryString["Username"];
            Label l1 = Master.FindControl("Welcome") as Label;
            l1.Text = "Welcome " + user;
            Button logout = Master.FindControl("Button0") as Button;
            logout.Click += new EventHandler(Logout_Onclick);

             if (!IsPostBack)
             {
                /*GridView1.Visible = true;
                GridView1.DataSource = null;
                GridView2.Visible = false;
                GridView2.DataSource = null;*/
                BindData();
             }

        }
        private void BindData()

        {

            DataTable table = new DataTable();

            // get the connection

            using (SqlConnection conn = new SqlConnection(str))

            {

                // write the sql statement to execute

                string sql = "SELECT [id], [question_details], [type], [marks], [subject] FROM [Questions] WHERE ([is_selected] = 0)";

                // instantiate the command object to fire

                using (SqlCommand cmd = new SqlCommand(sql, conn))

                {

                    // get the adapter object and attach the command object to it

                    using (SqlDataAdapter ad = new SqlDataAdapter(cmd))

                    {

                        // fire Fill method to fetch the data and fill into DataTable

                        ad.Fill(table);

                    }

                }

            }

            GridView1.DataSource = table;

            GridView1.DataBind();

        }

        protected void PaginateTheData(object sender, GridViewPageEventArgs e)

        {

            GridView1.PageIndex = e.NewPageIndex;

            this.BindData();

        }

        protected void GetSelectedRecord(object sender, EventArgs e)

        {

            var autoId = GridView1.SelectedDataKey.Value;

            Response.Write("Selected record: " + autoId);

        }

        private void Logout_Onclick(object sender, EventArgs e)
        {
            Session["Sid"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void ChooseQuestions(object sender, EventArgs e)
        {
            GridView1.AllowPaging = true;
            GridView1.PageSize = 5;
            GridView2.Visible = false;
            GridView1.Visible = true;
            GridView1.EnablePersistedSelection = true;
        }
        protected void GenerateQuestionPaper(object sender, EventArgs e)
        {
            Label1.Text = "Reached";
            SqlConnection con = new SqlConnection(str);
            con.Open();
            foreach (GridViewRow item in GridView1.Rows)
            {
                if ((item.Cells[0].FindControl("cbSelect") as CheckBox).Checked)
                {
                    SqlCommand com = new SqlCommand("Update Questions set is_selected=1 where id=@id", con);
                    com.Parameters.AddWithValue("@id", item.Cells[0].Text);
                    com.ExecuteNonQuery();
                }
            }
            //Label1.Text = (GridView1.Rows[0].Cells[0].Text);
            con.Close();
        }

        protected void ViewQuestionPaper(object sender, EventArgs e)
        {
            GridView2.AllowPaging = true;
            GridView2.PageSize = 5;
            GridView1.Visible = false;
            GridView2.Visible = true;
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
             GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

    }
}