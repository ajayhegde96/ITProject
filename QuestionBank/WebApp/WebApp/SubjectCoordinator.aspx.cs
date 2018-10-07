using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
        }
    }
}