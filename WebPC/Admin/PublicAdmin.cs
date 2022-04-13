using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Text.RegularExpressions;
using System.Timers;
using System.Media;


namespace WebPC.Admin
{
    public class PublicAdmin
    {
        Connect cn = new Connect();

        public string public_email;
        public string public_username;
        public string public_status;
        public string public_avatar;
        public string public_pass;

        public DataTable TableThongKe()
        {
            DataTable dt = new DataTable();
            cn.con.Open();
            DataSet ds = new DataSet();
            string sql = "spThongKe_Edit";
            SqlCommand cmd = new SqlCommand(sql, cn.con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            dt = ds.Tables[0];
            return dt;
        }

        public DataSet LoadUser()
        {
            string sql = "select * from tblAdmin";
            SqlDataAdapter adapter = new SqlDataAdapter(sql, cn.con);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            return ds;
        }

        public DataSet LoadProduct()
        {
            string sql = "select * from tblProduct";
            SqlDataAdapter adapter = new SqlDataAdapter(sql, cn.con);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            return ds;
        }

        public void deleteCategory(int id)
        {
            string sql = "Delete from tblCategory where id='"+ id +"' ";
            SqlCommand cmd = new SqlCommand(sql, cn.con);
            cn.con.Open();
            cmd.ExecuteNonQuery();
            cn.con.Close();
        }

        public void deleteProduct(int id)
        {
            string sql = "Delete from tblProduct where id='" + id + "' ";
            SqlCommand cmd = new SqlCommand(sql, cn.con);
            cn.con.Open();
            cmd.ExecuteNonQuery();
            cn.con.Close();
        }

        public Tuple<string, int, int> LoadCategoryInTextbox(int id)
        {
            SqlDataAdapter da = new SqlDataAdapter("select * from tblCategory where ID='" + id + "'", cn.con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            string name = dt.Rows[0]["Name"].ToString();
            int parentid = int.Parse(dt.Rows[0]["Parent_id"].ToString());
            int SortOrder = int.Parse(dt.Rows[0]["Sort_order"].ToString());

            return new Tuple<string, int, int>(name, parentid, SortOrder);
        }

        public Tuple<string, string, int, string, string, int, string> LoadProductInTextbox(int id)
        {
            SqlDataAdapter da = new SqlDataAdapter("select * from tblProduct where ID='" + id + "'", cn.con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            string category_id = dt.Rows[0]["Category_id"].ToString();
            string name = dt.Rows[0]["Name"].ToString();
            int price = int.Parse(dt.Rows[0]["Price"].ToString());
            string parameter = dt.Rows[0]["Parameter"].ToString();
            string content = dt.Rows[0]["Content"].ToString();
            int discount = int.Parse(dt.Rows[0]["Discount"].ToString());
            string image = dt.Rows[0]["Image_link"].ToString();
            SqlDataAdapter da1 = new SqlDataAdapter("select * from tblCategory where ID='" + category_id + "'", cn.con);
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);
            string category = dt1.Rows[0]["Name"].ToString();

            return new Tuple<string, string, int, string, string, int, string>(category, name, price, parameter, content, discount, image);
        }

        public int UpdateCategory(int id, string name, int parentid, int sortorder)
        {
            if (name == "")
            {
                return 0;
            }
            else
            {
                string sql = "update tblCategory Set Name = '" + name + "', Parent_id='" + parentid + "', Sort_Order='" + sortorder + "' where ID = '" + id + "'";
                SqlCommand cmd = new SqlCommand(sql, cn.con);
                cn.con.Open();
                cmd.ExecuteNonQuery();
                cn.con.Close();
                return 1;
            }
            
        }

        public int UpdateProduct(int id, string category, string name, int price, string parameter, string content, int discount, string image)
        {
            SqlDataAdapter da1 = new SqlDataAdapter("select * from tblProduct where Name='" + name + "' and Price='" + price + "' ", cn.con);
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);
            SqlDataAdapter da2 = new SqlDataAdapter("select * from tblCategory where Name='" + category + "' ", cn.con);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);
            int category_id = int.Parse(dt2.Rows[0]["ID"].ToString());

            if (name == "" || price == 0 || content == "")
            {
                return 1;
            }
            else if (image.Length > 5000)
            {
                return 2;
            }
            else
            {
                string sql = "Update tblProduct Set Category_id = '" + category_id + "', Name='" + name + "', Price='" + price + "', Parameter=N'" + parameter + "', Content=N'" + content + "', Discount='" + discount + "', Image_link='" + image + "' where ID = '" + id + "'";
                SqlCommand cmd = new SqlCommand(sql, cn.con);
                cn.con.Open();
                cmd.ExecuteNonQuery();
                cn.con.Close();
                return 3;
            }

        }

        public int AddCategory(string name, int parentid, int sort_order)
        {
            SqlDataAdapter da1 = new SqlDataAdapter("select * from tblCategory where Name='" + name + "' ", cn.con);
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);
            if(dt1.Rows.Count > 0)
            {
                return 0;
            }
            else if(name == "")
            {
                return 2;
            }
            else
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = cn.con;
                cmd.CommandText = "insert into tblCategory(Name, Parent_id, sort_order) values ('" + name + "', '" + parentid + "', '" + sort_order + "')";
                cmd.CommandType = CommandType.Text;
                cn.con.Open();
                cmd.ExecuteNonQuery();
                cn.con.Close();
                return 1;
            }
        }

        public int AddProduct(string category, string name, int price, string parameter, string content, int discount, string image)
        {
            SqlDataAdapter da1 = new SqlDataAdapter("select * from tblProduct where Name='" + name + "' and Price='" + price + "' ", cn.con);
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);
            SqlDataAdapter da2 = new SqlDataAdapter("select * from tblCategory where Name='" + category + "' ", cn.con);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);
            int category_id = int.Parse(dt2.Rows[0]["ID"].ToString());
            if (dt1.Rows.Count > 0)
            {
                return 0;
            }
            else if (name == "" || price == 0 || content == "")
            {
                return 1;
            }
            else if(image.Length > 5000)
            {
                return 2;
            }
            else
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = cn.con;
                cmd.CommandText = "insert into tblProduct(Category_id, Name, Price, Parameter, Content, Discount, Image_link) values " +
                    "('" + category_id + "', '" + name + "', '" + price + "', N'" + parameter + "', N'" + content + "', '" + discount + "', '" + image + "')";
                cmd.CommandType = CommandType.Text;
                cn.con.Open();
                cmd.ExecuteNonQuery();
                cn.con.Close();
                return 3;
            }
        }

        public DataSet loadCategory()
        {
            string sql = "select * from tblCategory";
            SqlDataAdapter adapter = new SqlDataAdapter(sql, cn.con);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            return ds;
        }


        public int CheckMail(string email)
        {
            string strRegex = @"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}" +
             @"\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\" +
             @".)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$";

            Regex re = new Regex(strRegex);

            if (re.IsMatch(email))
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }

        public int ChangePass(string username, string oldpass, string newpass, string retype_pass)
        {
            if (oldpass == newpass)
            {
                return 1;
            }
            else if (newpass != retype_pass)
            {
                return 2;
            }
            else if (newpass.Length < 8)
            {
                return 4;
            }
            else
            {
                cn.con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = cn.con;
                cmd.CommandText = "update tblAdmin set PassWord = '" + cn.encode(newpass) + "' where UserName = '" + username + "' ";
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
                cn.con.Close();
                return 3;
            }
        }

        public Tuple<string, string, int, string> LoadProFile(string username)
        {
            SqlDataAdapter da = new SqlDataAdapter("select * from tblAdmin where Username='" + username + "'", cn.con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            string email = dt.Rows[0][1].ToString();
            string user = dt.Rows[0][2].ToString();
            int status = int.Parse(dt.Rows[0][4].ToString());
            string avatar = dt.Rows[0][5].ToString();

            return new Tuple<string, string, int, string>(email, user, status, avatar);
        }

        public int LoginAdmin(string username, string pass)
        {
            cn.con.Open();
            string encode = cn.encode(pass);
            SqlDataAdapter da = new SqlDataAdapter("select * from tblAdmin where username='" + username + "' and password='" + encode + "' ", cn.con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                public_email = dt.Rows[0][1].ToString();
                public_username = dt.Rows[0][2].ToString();
                public_pass = dt.Rows[0][3].ToString();
                public_status = dt.Rows[0][4].ToString();
                public_avatar = dt.Rows[0][5].ToString();
                cn.con.Close();
                return 1;
            }
            else
            {
                return 0;
            }
        }

        public int SignupAdmin(string username, string email, string pass, string re_enter_pass)
        {
            SqlDataAdapter da1 = new SqlDataAdapter("select * from tblAdmin where username='" + username + "' ", cn.con);
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
            else if (CheckMail(email) == 0)
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
                cmd.CommandText = "insert into tblAdmin( email, username, password, status) values ('" + email + "', '" + username + "', '" + encode + "',0)";
                cmd.CommandType = CommandType.Text;
                cn.con.Open();
                cmd.ExecuteNonQuery();
                cn.con.Close();

                return 3;
            }
        }
        public int SaveProfile(string username, string newemail, string avatar)
        {
            if (CheckMail(newemail) == 0)
            {
                return 0;
            }
            else if (newemail.Length > 5000)
            {
                return 2;
            }
            else
            {
                string sql = "update tblAdmin Set Email = '" + newemail + "', avatar='" + avatar + "' where Username = '" + username + "'";
                SqlCommand cmd = new SqlCommand(sql, cn.con);
                cn.con.Open();
                cmd.ExecuteNonQuery();
                cn.con.Close();
                return 1;
            }
        }

    }
}