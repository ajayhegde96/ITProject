using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Linq;
using System.Web;
using System.Web.UI;


namespace WebApp
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLlocalDB;Initial Catalog=QuestionBank;Integrated Security=True;Pooling=False;MultipleActiveResultSets=true;");

        protected void Page_Load(object sender, EventArgs e)
        {
            
            Button b1 = Master.FindControl("Button1") as Button;
            b1.Click += new EventHandler(B1_Click);

            Button b2 = Master.FindControl("Button2") as Button;
            b2.Click += new EventHandler(B2_Click);

            Button b3 = Master.FindControl("Button3") as Button;
            b3.Click += new EventHandler(B3_Click);

            Button b4 = Master.FindControl("Button4") as Button;
            b4.Click += new EventHandler(B4_Click);

            string sql1 = "select distinct Subject from [Subjects] where Coordinator='NULL'";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql1, con);
                cmd.CommandType = System.Data.CommandType.Text;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    DropDownList3.Items.Add(reader[0].ToString());
                }
                con.Close();
            }
            catch (Exception E)
            {
                Label1.Text = E.Message.ToString();
            }
            finally
            {
                con.Close();
            }
            string sql2 = "select * from [User] where Subject='" + DropDownList3.SelectedValue + "'";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql1, con);
                cmd.CommandType = System.Data.CommandType.Text;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    DropDownList2.Items.Add(reader["Username"].ToString());
                }
                con.Close();
            }
            catch (Exception E)
            {
                Label1.Text = E.Message.ToString();
            }
            finally
            {
                con.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sql = "Update [User] set role='FacultyCoordinator' where Username ='" + DropDownList2.SelectedValue + "'";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.ExecuteNonQuery();
                con.Close();
                Label1.Text = DropDownList2.SelectedValue + "Assigned as Faculty Coordinator for " + DropDownList3.SelectedValue;
            }
            catch (Exception E)
            {
                Label1.Text = E.Message.ToString();
            }
        }
        private void B4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Deleteuser.aspx");
        }

        private void B3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Assignsubcord.aspx");
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