using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPC.User;

namespace WebPC.User
{
    public partial class Login : System.Web.UI.Page
    {
        PublicUser user = new PublicUser();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["allow"] != null)
            {
                if (!IsPostBack)
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtusername.Value.ToString();
            string pass = pwd.Value.ToString();

            switch (user.Login(username, pass))
            {
                case 0:
                    errorMessage.Text = "UserName hoặc PassWord không chính xác!!!";
                    break;
                case 1:
                    Session["allow"] = true;
                    Session["username"] = user.public_username;
                    Session["email"] = user.public_email;
                    Session["pass"] = user.public_pass;
                    Response.Redirect("Default.aspx");
                    break;
            }
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }
    }
}