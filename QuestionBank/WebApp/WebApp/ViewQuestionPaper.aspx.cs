using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["Sid"] == null)
            //Response.Redirect("Login.aspx");
            if(IsPostBack)
            {
                GridView1.DataSource = SqlDataSource2;
                GridView1.Visible = true;
                GridView1.DataBind();
            }
        }

    }
}