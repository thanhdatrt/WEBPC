using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPC.Admin
{
    public partial class SetUser : System.Web.UI.Page
    {
        PublicAdmin ad = new PublicAdmin();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["allow"] == null)
            {
                if (!IsPostBack)
                {
                    Response.Redirect("LoginAdmin.aspx");
                }
            }
            if (!IsPostBack)
            {
                rptDS.DataSource = ad.LoadUser();
                rptDS.DataBind();
            }
        }

        protected void rptDS_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}