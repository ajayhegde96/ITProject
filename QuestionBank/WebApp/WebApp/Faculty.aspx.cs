using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class Faculty : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLlocalDB;Initial Catalog=QuestionBank;Integrated Security=True;Pooling=False;MultipleActiveResultSets=true;");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Sid"] == null)
                Response.Redirect("Login.aspx");

            Panel1.Visible = false;
            Panel2.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Panel2.Visible = true;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            con.Open();
            string sql = "insert into Questions([question_details], [type], [marks], [subject], [is_selected]) values(@ques,@type,@marks,@subject,@is_selected)";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@ques", TextBox1.Text);
            cmd.Parameters.AddWithValue("@type", DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("@marks", TextBox2.Text);
            cmd.Parameters.AddWithValue("@subject", Session["Sub"].ToString());
            cmd.Parameters.AddWithValue("@is_selected", "0");
            int res=cmd.ExecuteNonQuery();
            if (res != 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Successfully Inserted')", true);
                con.Close();
                //Response.Redirect(Request.FilePath);
               // Label1.Text = ViewState["msg"].ToString();
            }
            GridView1.DataBind();
        }

    }
}