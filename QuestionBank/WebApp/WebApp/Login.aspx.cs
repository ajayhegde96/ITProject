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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con=new SqlConnection("Data Source=(localdb)\\MSSQLlocalDB;Initial Catalog=QuestionBank;Integrated Security=True;Pooling=False;MultipleActiveResultSets=true;");
            string sql="Select *from [User] where Username ='"+TextBox1.Text+"' and Password ='"+TextBox2.Text+"'";
            con.Open();
            SqlCommand cmd =new SqlCommand(sql, con);
            cmd.CommandType = System.Data.CommandType.Text;
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                string role = reader["Role"].ToString();
                string subject = reader["Subject"].ToString();
                Session["Sub"] = subject;
                Session["Sid"] = TextBox1.Text;
                con.Close();
                Response.Redirect(string.Format("{0}.aspx?Username="+TextBox1.Text,role));

            }
            con.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = TextBox2.Text = "";
        }
    }
}