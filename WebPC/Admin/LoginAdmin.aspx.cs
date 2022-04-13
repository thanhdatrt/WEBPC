using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlTypes;
using System.Data.SqlClient;
namespace WebPC.Admin
{
    public partial class LoginAdmin : System.Web.UI.Page
    {
        PublicAdmin ad = new PublicAdmin();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["allow"] != null)
            {
                if (!IsPostBack)
                {
                    Response.Redirect("DashboardAdmin.aspx");
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtusername.Value.ToString();
            string pass = pwd.Value.ToString();

            switch (ad.LoginAdmin(username, pass))
            {
                case 0:
                    errorMessage.Text = "UserName hoặc PassWord không chính xác!!!";
                    break;
                case 1:
                    Session["allow"] = true;
                    Session["username"] = ad.public_username;
                    Session["email"] = ad.public_email;
                    Session["pass"] = ad.public_pass;
                    Session["status"] = ad.public_status;
                    Session["avatar"] = ad.public_avatar;

                    Response.Redirect("DashboardAdmin.aspx");
                    break;
            }
        }



        protected void btnSignup_Click1(object sender, EventArgs e)
        {
            Response.Redirect("SignUpAdmin.aspx");
        }

        protected void btnLogin_Click1(object sender, EventArgs e)
        {

        }
    }
}