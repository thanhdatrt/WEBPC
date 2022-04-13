using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Timers;
using System.Threading;

namespace WebPC.Admin
{
    public partial class ChangePass : System.Web.UI.Page
    {
        PublicAdmin ad = new PublicAdmin();
        Connect cn = new Connect();

        protected void Page_Load(object sender, EventArgs e)
        {
            lbUsername.Text = Session["username"].ToString();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string username = Session["username"].ToString();
            string oldpass = txtOldPass.Text;
            string newpass = txtnewpass.Text;
            string retypepass = txtre_enter_pass.Text;
            if (cn.encode(oldpass) != Session["pass"].ToString())
            {
                lbmessage.Text = "PassWord cũ không khớp !";
            }
            else
            {
                switch (ad.ChangePass(username, oldpass, newpass, retypepass))
                {
                    case 1:
                        lbmessage.Text = "PassWord cũ và mới không được trùng nhau !";
                        break;
                    case 2:
                        lbmessage.Text = "PassWord không khớp !";
                        break;
                    case 3:
                        Session["pass"] = newpass;
                        lbmessage.Text = "Cập nhật thành công!!!";

                        Thread.Sleep(5000);
                        Response.Redirect("LogoutAdmin.aspx");
                        break;
                }
            }
        }
    }
}