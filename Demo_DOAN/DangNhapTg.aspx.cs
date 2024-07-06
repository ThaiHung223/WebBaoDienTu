using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Demo_DOAN
{
    public partial class DangNhapTg : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username2"] != null)
            {
                Response.Redirect("DefaultTG.aspx");
            }
        }


        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            string username = Login1.UserName;
            string password = Login1.Password;
            Session["LoggedInUser"] = username;
            string sql = "Select * From TACGIA Where TenDangNhap='" + username + "' and MatKhau = '" + password + "'";
            DataTable dt = ketnoi.docdulieu(sql);
            if (dt.Rows.Count > 0)
            {
                Session["username2"] = username;
                Response.Redirect("DefaultTG.aspx");
            }
        }
    }
}