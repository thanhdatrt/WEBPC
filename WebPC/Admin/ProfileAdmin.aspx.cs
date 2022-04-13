using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebPC.Admin
{
    public partial class Profile : System.Web.UI.Page
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
                load();
            }
        }

        public void load()
        {
            Tuple<string, string, int, string> temp = ad.LoadProFile(Session["username"].ToString());

            lbUsername.Text = temp.Item2;
            txtEmail.Text = temp.Item1;
            int status = temp.Item3;
            txtAvatar.Text = temp.Item4;
            switch (status)
            {
                case 0:
                    txtAuthor.Text = "None";
                    break;
                case 1:
                    txtAuthor.Text = "Admin";
                    break;
                case 2:
                    txtAuthor.Text = "Super Admin";
                    break;
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string username = Session["username"].ToString();
            string email = txtEmail.Text;
            string avatar = txtAvatar.Text;

            int result = ad.SaveProfile(username, email, avatar);
            switch (result)
            {
                case 0:
                    lbmessage.Text = "Email không hợp lệ!!";
                    break;
                case 2:
                    lbmessage.Text = "link hình ảnh quá dài!!";
                    break;
                case 1:
                    Session["avatar"] = txtAvatar.Text;
                    lbmessage.Text = "Cập nhật thành công!!!";
                    load();
                    break;
            }

        }
    }
}