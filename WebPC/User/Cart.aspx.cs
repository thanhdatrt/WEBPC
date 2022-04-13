using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using WebPC;

namespace WebPC.User
{
    public partial class Cart : System.Web.UI.Page
    {
        Connect cn = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack) 
            {
                DataTable dt = new DataTable();
                DataRow dr;
                dt.Columns.Add("sno");
                dt.Columns.Add("ID");
                dt.Columns.Add("Name");
                dt.Columns.Add("Price");
                dt.Columns.Add("Image_link");
                dt.Columns.Add("cost");
                dt.Columns.Add("totalcost");

                if (Request.QueryString["ID"] != null)
                {
                    if (Session["buyitems"] == null)
                    {
                        dr = dt.NewRow();
                        string sql = "select * from tblProduct where id=" + Request.QueryString["id"];
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = sql;
                        cmd.Connection = cn.con;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["sno"] = 1;
                        dr["ID"] = ds.Tables[0].Rows[0]["ID"].ToString();
                        dr["Name"] = ds.Tables[0].Rows[0]["Name"].ToString();
                        dr["Image_link"] = ds.Tables[0].Rows[0]["Image_link"].ToString();
                        dr["price"] = ds.Tables[0].Rows[0]["Price"].ToString();
                        dt.Rows.Add(dr);
                        rptDS.DataSource = dt;
                        rptDS.DataBind();
                        Session["buyitems"] = dt;
                    }
                    else
                    {
                        dt = (DataTable)Session["buyitems"];
                        int sr;
                        sr = dt.Rows.Count;
                        dr = dt.NewRow();
                        string sql = "select * from tblProduct where id=" + Request.QueryString["id"];
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = sql;
                        cmd.Connection = cn.con;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["sno"] = sr + 1;
                        dr["ID"] = ds.Tables[0].Rows[0]["ID"].ToString();
                        dr["Name"] = ds.Tables[0].Rows[0]["Name"].ToString();
                        dr["Image_link"] = ds.Tables[0].Rows[0]["Image_link"].ToString();
                        dr["price"] = ds.Tables[0].Rows[0]["Price"].ToString();
                        dt.Rows.Add(dr);
                        rptDS.DataSource = dt;
                        rptDS.DataBind();
                        Session["buyitems"] = dt;
                    }
                }
                else
                {
                    dt = (DataTable)Session["buyitems"];
                    rptDS.DataSource = dt;
                    rptDS.DataBind();
                }
            }
        }

        

        protected void rptDS_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}