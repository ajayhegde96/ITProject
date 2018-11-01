using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLlocalDB;Initial Catalog=QuestionBank;Integrated Security=True;Pooling=False;MultipleActiveResultSets=true;");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Sid"] == null)
                Response.Redirect("Login.aspx");
            string user = Request.QueryString["Username"];
            HttpCookie cookie = Request.Cookies[user];
            //Label3.Text = cookie.Value;
            if(cookie==null)
            {
                Label2.Text = "Reached";
                cookie = new HttpCookie(user);
                cookie.Expires = DateTime.Now.AddYears(1);
                cookie["Questions"] = "0";
                Response.Cookies.Add(cookie);
            }
            Label l1 = Master.FindControl("Welcome") as Label;
            l1.Text = "Welcome " + user;
            //Label2.Text = cookie["Questions"];
            Button logout = Master.FindControl("Button0") as Button;
            logout.Click += new EventHandler(Logout_Onclick);
            Label3.Text = "You have written " + cookie["Questions"] + " questions!";
        }

        private void Logout_Onclick(object sender, EventArgs e)
        {
            Session["Sid"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Panel2.Visible = true;
            Panel3.Visible = false;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            con.Open();
            string sql = "insert into Questions([question_details], [type], [marks], [subject], [Faculty], [is_selected]) values(@ques,@type,@marks,@subject,@faculty,@is_selected)";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@ques", TextBox1.Text);
            cmd.Parameters.AddWithValue("@type", DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("@marks", TextBox2.Text);
            cmd.Parameters.AddWithValue("@subject", Session["Sub"].ToString());
            cmd.Parameters.AddWithValue("@is_selected", "0");
            cmd.Parameters.AddWithValue("@faculty",Session["Sid"].ToString());
            int res = cmd.ExecuteNonQuery();
            if (res != 0)
            {
                HttpCookie cookie = Request.Cookies[Session["Sid"].ToString()];
                int q = Convert.ToInt32(cookie["Questions"].ToString());
                q++;
                cookie["Questions"] = q.ToString();
                Response.Cookies.Add(cookie);
                con.Close();
                TextBox1.Text = TextBox2.Text = "";
                //Label3.Text = "You have written " + q.ToString() + "questions!";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Successfully Inserted')", true);
            }
            GridView1.DataBind();
            Server.Transfer(Request.FilePath);
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Panel3.Visible = true;
            Panel1.Visible = false;
            Panel2.Visible = false;
            Button4.CausesValidation = false;
        }
    }
}