using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPC.Admin
{
    public partial class Category : System.Web.UI.Page
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
                loadcategory();
            }
        }

        public void loadcategory()
        {
            rptDS.DataSource = ad.loadCategory();
            rptDS.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string name = txtTendanhmuc.Text;
            int parentId = int.Parse(txtCapdanhmuc.Text);
            int sortOrder = int.Parse(txtSort.Text);

            int result = ad.AddCategory(name, parentId, sortOrder);
            if(result == 0)
            {
                Response.Write("<script> alert('Danh mục đã tồn tại!!!')</script>");
                txtTendanhmuc.Text = "";
                txtCapdanhmuc.Text = "";
                txtSort.Text = "";
            }
            else if(result == 2)
            {
                Response.Write("<script> alert('Tên danh mục không được trống!!!')</script>");
            }
            else
            {
                Response.Write("<script> alert('Thêm thành công!!!')</script>");
                loadcategory();
                txtTendanhmuc.Text = "";
                txtCapdanhmuc.Text = "";
                txtSort.Text = "";
            }
        }

        protected void rptDS_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string name = txtTendanhmuc.Text;
            int parentId = int.Parse(txtCapdanhmuc.Text);
            int sortOrder = int.Parse(txtSort.Text);
            int idInt = int.Parse( Session["IDCategory"].ToString());
            int result = ad.UpdateCategory( idInt,name, parentId, sortOrder);
            if (result == 0)
            {
                Response.Write("<script> alert('Tên danh mục không được trống!!!')</script>");
            }
            else
            {
                Response.Write("<script> alert('Cập nhật thành công!!!')</script>");
                loadcategory();
                txtTendanhmuc.Text = "";
                txtCapdanhmuc.Text = "";
                txtSort.Text = "";
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            Label id = (Label)item.FindControl("lbID");
            int idInt = int.Parse(id.Text);
            Session["IDCategory"] = int.Parse(id.Text);
            Tuple<string, int, int> temp = ad.LoadCategoryInTextbox(idInt);
            txtTendanhmuc.Text = temp.Item1;
            txtCapdanhmuc.Text = temp.Item2.ToString();
            txtSort.Text = temp.Item3.ToString();
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            Label id = (Label)item.FindControl("lbID");
            int idInt = int.Parse(id.Text);

            ad.deleteCategory(idInt);
            loadcategory();
        }
    }
}