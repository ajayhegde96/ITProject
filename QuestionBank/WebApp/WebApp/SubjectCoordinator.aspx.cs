using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlTypes;
using System.Data.SqlClient;

namespace WebApp
{
    public partial class SubjectCoordinator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Func(object sender, CommandEventArgs e)
        {
            Label1.Text += " " + "ssadas";
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
    }
}