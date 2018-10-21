using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlTypes;
using System.Data.SqlClient;
using System.Drawing;

namespace WebApp
{
    public partial class SubjectCoordinator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["Sid"] == null)
                //Response.Redirect("Login.aspx");

            if (!IsPostBack)
            {
                GridView1.Visible = false;
                GridView1.DataSource = null;
                GridView2.Visible = false;
                GridView2.DataSource = null;
            }

        }


        protected void ChooseQuestions(object sender, EventArgs e)
        {
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
            GridView1.Visible = true;
        }

        protected void GenerateQuestionPaper(object sender, EventArgs e)
        {
            Label1.Text = "Reached";
            string str = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=QuestionBank;Integrated Security=True;";
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
            GridView2.DataSource = SqlDataSource2;
            GridView2.DataBind();
            GridView2.Visible = true;
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            /* if (e.Row.RowType == DataControlRowType.DataRow)
             {
                 //Change the id of checkbox here
                 CheckBox chk = (CheckBox)e.Row.FindControl("cbSelect");
                 //If checkbox checked then change color of row
                 if (chk.Checked == true)
                 {
                     e.Row.BackColor = System.Drawing.Color.Red;
                 }
                 else
                 {
                     e.Row.BackColor = System.Drawing.Color.Green;
                 }
             }*/
        }

        /* protected void cbSelect_CheckedChanged(object sender, EventArgs e)
         {
             Label1.Text += "CheckBOxxx!!!" + " ";
             CheckBox chk = (sender as CheckBox);
             if(chk!=null)
             {
                 if (chk.ID == "cbSelect")
                 {
                     foreach (GridViewRow row in GridView1.Rows)
                     {
                         if (row.RowType == DataControlRowType.DataRow)
                         {
                             // row.Cells[0].Controls.OfType<CheckBox>().FirstOrDefault().Checked = chk.Checked;
                             Label1.Text = row.Cells[5].GetType().Attributes.CompareTo(chk.Attributes).ToString();
                             if (chk.Checked)
                             {
                                 row.BackColor = Color.YellowGreen;
                                 row.Font.Bold = true;
                             }
                         }
                         else
                         {
                             row.BackColor = System.Drawing.Color.White;
                             row.ForeColor = Color.Black;

                         }
                     }
                 }
             }
         }*/
    }
}