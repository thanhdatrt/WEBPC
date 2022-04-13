using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data.Sql;
using System.Text;
using System.Security.Cryptography;


namespace WebPC
{
    public class Connect
    {
        /*public SqlConnection con = new SqlConnection("Data Source=DESKTOP-MC\\SQLEXPRESS;Initial Catalog=PCWEB;Integrated Security=True");*/
        public SqlConnection con = new SqlConnection("workstation id=WEBCOMPUTER.mssql.somee.com;packet size=4096;user id=thanhdattt_SQLLogin_1;pwd=ahkf5lumin;data source=WEBCOMPUTER.mssql.somee.com;persist security info=False;initial catalog=WEBCOMPUTER");
        public string encode(string pass)
        {
            return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(pass.Trim(),"SHA1");
        }
    }
}