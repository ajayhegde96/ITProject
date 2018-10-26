using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;

namespace WebApp
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Sid"] == null)
                Response.Redirect("Login.aspx");

            Button b1 = Master.FindControl("Button1") as Button;
            b1.Click += new EventHandler(B1_Click);

            Button b2 = Master.FindControl("Button2") as Button;
            b2.Click += new EventHandler(B2_Click);

            Button b3 = Master.FindControl("Button3") as Button;
            b3.Click += new EventHandler(B3_Click);

            Button b4 = Master.FindControl("Button4") as Button;
            b4.Click += new EventHandler(B4_Click);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLlocalDB;Initial Catalog=QuestionBank;Integrated Security=True;Pooling=False;MultipleActiveResultSets=true;");
            string sql = "Select *from [User] where Username ='" + TextBox1.Text + "' and Password ='" + TextBox2.Text + "'";
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.CommandType = System.Data.CommandType.Text;
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                //string role = reader["Role"].ToString();
                //Response.Redirect(string.Format("{0}.aspx", role));
                Label1.Text = "User Already Exists";
            }
            else
            {
                string sql1 = "insert into [User](UserName,Password,Subject,Role) values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + DropDownList2.SelectedValue + "','" + DropDownList1.SelectedValue + "')";
                cmd = new SqlCommand(sql1, con);
                cmd.CommandType = System.Data.CommandType.Text;
                try
                {
                    cmd.ExecuteNonQuery();
                    Label1.Text = "Data inserted successfully";
                }
                catch (Exception ex)
                {
                    Label1.Text = ex.Message;
                }
                finally
                {
                    con.Close();
                }
            }
            con.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = TextBox2.Text = "";
        }

        private void B4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Deleteuser.aspx");
        }

        private void B3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Subcoord.aspx");
        }

        private void B2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewQuestionpaper.aspx");
        }

        private void B1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Newlogin.aspx");
        }
    }
}