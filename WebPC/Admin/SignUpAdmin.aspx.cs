using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPC.Admin
{
    public partial class SignUpAdmin : System.Web.UI.Page
    {
        PublicAdmin ad = new PublicAdmin();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["allow"] != null)
            {
                if (!IsPostBack)
                {
                    Response.Redirect("Default.apsx");
                }
            }
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            string email = txtemail.Value.ToString();
            string username = txtusername.Value.ToString();
            string pw = pwd.Value.ToString();
            string re_pw = pwd1.Value.ToString();

            switch(ad.SignupAdmin(username, email, pw, re_pw))
            {
                case 0:
                    lbwaining.Text = "UserName đã tồn tại!!!";
                    break;
                case 1:
                    lbwaining.Text = "UserName và PassWord không được trống!!";
                    break;
                case 2:
                    lbwaining.Text = "nhập lại PassWord không khớp!!!";
                    break;
                case 4:
                    lbwaining.Text = "Password phải từ 8 kí tự!!!";
                    break;
                case 5:
                    lbwaining.Text = "Email không hợp lệ!!!";
                    break;
                case 3:
                    Response.Redirect("LoginAdmin.aspx");
                    break;
            }
        }
    }
}