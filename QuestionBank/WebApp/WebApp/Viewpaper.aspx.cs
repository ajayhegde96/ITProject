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
    public partial class WebForm4 : System.Web.UI.Page
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

            string sql="Select * from Questions where is_selected='1'";
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.CommandType = System.Data.CommandType.Text;
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Label1.Text += reader["question_details"].ToString() + " -- ";
            }
            con.Close();
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
            Response.Redirect("Viewpaper.aspx");
        }

        private void B1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Newlogin.aspx");
        }
    }
}