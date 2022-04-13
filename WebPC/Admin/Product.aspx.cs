using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace WebPC.Admin
{
    public partial class Product : System.Web.UI.Page
    {
        PublicAdmin ad = new PublicAdmin();
        Connect cn = new Connect();
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
                loadProduct();
                loadDDL();
            }
        }

        public void loadDDL()
        {
            string sql = "select * from tblCategory";
            SqlDataAdapter adapter = new SqlDataAdapter(sql, cn.con);
            cn.con.Open();
            DataSet ds = new DataSet();
            adapter.Fill(ds);

            ddlCategory.DataSource = ds;
            ddlCategory.DataTextField = "Name";
            ddlCategory.DataValueField = "Name";
            ddlCategory.DataBind();
            cn.con.Close();
        }

        public void loadProduct()
        {
            rptDS.DataSource = ad.LoadProduct();
            rptDS.DataBind();

        }

        protected void rptDS_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            // edit
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            Label id = (Label)item.FindControl("lbID");
            int idInt = int.Parse(id.Text);
            Session["IDProduct"] = int.Parse(id.Text);
            Tuple<string, string, int, string, string, int, string> temp = ad.LoadProductInTextbox(idInt);
            // category, name, price, parameter, content, discount, image
            ddlCategory.Text = temp.Item1;
            txtName.Text = temp.Item2;
            txtPrice.Text = temp.Item3.ToString();
            txtParameter.Text = temp.Item4;
            txtContent.Text = temp.Item5;
            txtDiscount.Text = temp.Item6.ToString();
            txtImage.Text = temp.Item7.ToString();

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            // delete
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            Label id = (Label)item.FindControl("lbID");
            int idInt = int.Parse(id.Text);
            ad.deleteProduct(idInt);
            loadProduct();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string category = ddlCategory.Text;
            string name = txtName.Text;
            int price = int.Parse(txtPrice.Text);
            string parameter = txtParameter.Text;
            string content = txtContent.Text;
            string image = txtImage.Text;
            int discount = int.Parse(txtDiscount.Text);

            int result = ad.AddProduct(category, name, price, parameter, content, discount, image);
            switch(result)
            {
                case 0:
                    Response.Write("<script> alert('Sản phẩm đã tồn tại!!!')</script>");
                    break;
                case 1:
                    Response.Write("<script> alert('Các trường không được để trống!!!')</script>");
                    break;
                case 2:
                    Response.Write("<script> alert('Link hình ảnh quá dài!!!')</script>");
                    txtImage.Text = "";
                    break;
                case 3:
                    Response.Write("<script> alert('Thêm thành công!!!')</script>");
                    loadProduct();
                    txtContent.Text = "";
                    txtDiscount.Text = "0";
                    txtImage.Text = "";
                    txtName.Text = "";
                    txtParameter.Text = "";
                    txtPrice.Text = "0";
                    break;
            }

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string category = ddlCategory.Text;
            string name = txtName.Text;
            int price = int.Parse(txtPrice.Text);
            string parameter = txtParameter.Text;
            string content = txtContent.Text;
            string image = txtImage.Text;
            int discount = int.Parse(txtDiscount.Text);
            int idInt = int.Parse(Session["IDProduct"].ToString());
            //int id, string category, string name, int price, string parameter, string content, int discount, string image
            int result = ad.UpdateProduct(idInt, category, name, price, parameter, content, discount, image);
            switch (result)
            {
                case 1:
                    Response.Write("<script> alert('Các trường không được để trống!!!')</script>");
                    break;
                case 2:
                    Response.Write("<script> alert('Link hình ảnh quá dài!!!')</script>");
                    txtImage.Text = "";
                    break;
                case 3:
                    Response.Write("<script> alert('Cập nhật thành công!!!')</script>");
                    loadProduct();
                    txtContent.Text = "";
                    txtDiscount.Text = "0";
                    txtImage.Text = "";
                    txtName.Text = "";
                    txtParameter.Text = "";
                    txtPrice.Text = "0";
                    break;
            }
        }
    }
}