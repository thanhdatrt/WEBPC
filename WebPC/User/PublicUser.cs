using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Text.RegularExpressions;
using System.Timers;
using WebPC.Admin;

namespace WebPC.User
{
    public class PublicUser
    {
        Connect cn = new Connect();
        PublicAdmin ad = new PublicAdmin();
        public string public_email;
        public string public_username;
        public string public_pass;


        public void CountView(int id, int viewup)
        {
            string sql = "update tblProduct Set [view] = '" + viewup + "' where ID = '" + id + "'";
            SqlCommand cmd = new SqlCommand(sql, cn.con);
            cn.con.Open();
            cmd.ExecuteNonQuery();
            cn.con.Close();
        }

        public int ShowViewProduct(int id)
        {
            string sql = "select * from tblProduct where ID='"+ id +"' ";
            SqlDataAdapter adapter = new SqlDataAdapter(sql, cn.con);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            string viewstring = dt.Rows[0][10].ToString();
            if(viewstring == "")
            {
                return 0;
            }
            else
            {
                int view = int.Parse(viewstring);
                return view;
            }
        }

        public int Signup(string username, string email, string pass, string re_enter_pass)
        {
            SqlDataAdapter da1 = new SqlDataAdapter("select * from tblUser where name='" + username + "' ", cn.con);
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                return 0;
            }
            else if (username == "" || pass == "")
            {
                return 1;
            }
            else if (ad.CheckMail(email) == 0)
            {
                return 5;
            }
            else if (pass != re_enter_pass)
            {
                return 2;
            }
            else if (pass.Length < 8)
            {
                return 4;
            }
            else
            {
                string encode = cn.encode(pass);

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = cn.con;
                cmd.CommandText = "insert into tblUser( email, name, password) values ('" + email + "', '" + username + "', '" + encode + "')";
                cmd.CommandType = CommandType.Text;
                cn.con.Open();
                cmd.ExecuteNonQuery();
                cn.con.Close();
                return 3;
            }
        }
        public int Login(string username, string pass)
        {
            cn.con.Open();
            string encode = cn.encode(pass);
            SqlDataAdapter da = new SqlDataAdapter("select * from tblUser where Name='" + username + "' and password='" + encode + "' ", cn.con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                public_email = dt.Rows[0]["Email"].ToString();
                public_username = dt.Rows[0]["Name"].ToString();
                public_pass = dt.Rows[0]["Password"].ToString();
                return 1;
            }
            else
            {
                return 0;
            }
        }

        public int CountProduct()
        {
            string sql = "select * from tblProduct";
            SqlDataAdapter adapter = new SqlDataAdapter(sql, cn.con);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            return dt.Rows.Count;
        }
        
    }
}