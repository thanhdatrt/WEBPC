using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPC.Admin
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["allow"] == null)
            {
                if (!IsPostBack)
                {
                    Response.Redirect("LoginAdmin.aspx");
                }
            }
        }
    }
}