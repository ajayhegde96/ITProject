using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class WebForm3 : System.Web.UI.Page
    {
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