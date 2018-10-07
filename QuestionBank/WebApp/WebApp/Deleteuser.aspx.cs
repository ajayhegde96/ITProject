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
    public partial class WebForm2 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLlocalDB;Initial Catalog=QuestionBank;Integrated Security=True;Pooling=False;MultipleActiveResultSets=true;");
        protected void Page_Load(object sender, EventArgs e)
        {
            string sql = "Select *from [User] where Username !='Admin'";
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.CommandType = System.Data.CommandType.Text;
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                DropDownList1.Items.Add(new ListItem(reader["Username"].ToString()));
            }
            con.Close();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            con.Open();
            string user = DropDownList1.Items[DropDownList1.SelectedIndex].Value.ToString();
            string sql = "Delete from [User] where Username='" + user + "'";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.CommandType = System.Data.CommandType.Text;
            try
            {
                cmd.ExecuteNonQuery();
                Label1.Text = "User Successfully Deleted";
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message;
            }
            con.Close();
        }
    }
}