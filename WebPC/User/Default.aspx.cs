using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;


namespace WebPC.User
{
    public partial class Default : System.Web.UI.Page
    {
        Connect cn = new Connect();
        PublicUser user = new PublicUser();

        static int currentposition = 0;
        static int totalrows = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadProduct();
                Session["search"] = null;
                loadbuyitem();
                
            }
        }

        public void loadbuyitem()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
            if(dt != null)
            {
                Session["CountCart"] = dt.Rows.Count.ToString();
            }
            else
            {
                Session["CountCart"] = "0";
            }
        }

        public void loadProduct()
        {
            if(Session["search"] == null)
            {
                string sql = "select * from tblProduct";
                SqlDataAdapter adapter = new SqlDataAdapter(sql, cn.con);
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                totalrows = ds.Tables[0].Rows.Count;
                DataTable dt = ds.Tables[0];
                PagedDataSource pg = new PagedDataSource();
                pg.DataSource = dt.DefaultView;
                pg.AllowPaging = true;
                pg.CurrentPageIndex = currentposition;
                pg.PageSize = 10;
                Button1.Enabled = !pg.IsFirstPage;
                Button1.Enabled = !pg.IsFirstPage;
                Button3.Enabled = !pg.IsLastPage;
                Button4.Enabled = !pg.IsLastPage;
                ListProduct.DataSource = pg;
                ListProduct.DataBind();
            }
            else
            {
                string search = Session["search"].ToString();
                string sql = "select * from tblProduct where Name LIKE '%"+search+"%' ";
                SqlDataAdapter adapter = new SqlDataAdapter(sql, cn.con);
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                totalrows = ds.Tables[0].Rows.Count;
                DataTable dt = ds.Tables[0];
                PagedDataSource pg = new PagedDataSource();
                pg.DataSource = dt.DefaultView;
                pg.AllowPaging = true;
                pg.CurrentPageIndex = currentposition;
                pg.PageSize = 10;
                Button1.Enabled = !pg.IsFirstPage;
                Button1.Enabled = !pg.IsFirstPage;
                Button3.Enabled = !pg.IsLastPage;
                Button4.Enabled = !pg.IsLastPage;
                ListProduct.DataSource = pg;
                ListProduct.DataBind();
            }
            
            cn.con.Close();
        }

        

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            currentposition = 0;
            loadProduct();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (currentposition == 0)
            {

            }
            else
            {
                currentposition = currentposition - 1;
                loadProduct();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (currentposition == totalrows - 1)
            {

            }
            else
            {
                currentposition = currentposition + 1;
                loadProduct();
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            currentposition = totalrows - 1;
            loadProduct();
        }

        protected void btnDetail_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnAddToCard_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Session["search"] = search1.Value.ToString();
            loadProduct();
        }

        protected void ListProduct_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if(e.CommandName == "AddToCart")
            {
                Response.Redirect("Cart.aspx?id" + e.CommandArgument.ToString());
                loadbuyitem();
            }
            if(e.CommandName == "Detail")
            {
                int id = int.Parse( e.CommandArgument.ToString());
                int view = user.ShowViewProduct(id);
                int viewcount = view + 1;
                user.CountView(id, viewcount);
            }
        }
    }
}