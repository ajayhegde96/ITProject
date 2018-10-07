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
                string sql1 = "insert into [User](UserName,Password,Subject,Role) values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "')";
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
            }
            con.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = TextBox2.Text = TextBox3.Text = TextBox4.Text = "";
        }
    }
}