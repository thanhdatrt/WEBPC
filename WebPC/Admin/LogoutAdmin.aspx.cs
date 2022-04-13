using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPC.Admin
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["allow"] = null;
            Session["username"] = null;
            Session["email"] = null;
            Session["pass"] = null;
            Session["status"] = null;
            Session["avatar"] = null;
            Response.Redirect("LoginAdmin.aspx");
        }
    }
}