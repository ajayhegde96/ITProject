using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["Sid"] == null)
            //Response.Redirect("Login.aspx");
            if(IsPostBack)
            {
                DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
                int datacount = dv.Count;
                Label1.Text = datacount.ToString();
                if (datacount > 0)
                {
                    GridView1.DataSource = SqlDataSource2;
                    GridView1.Visible = true;
                    GridView1.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('No Question Paper Found');</script>");
                    GridView1.DataSource = null;
                    GridView1.Visible = false;
                }
            }
        }

    }
}