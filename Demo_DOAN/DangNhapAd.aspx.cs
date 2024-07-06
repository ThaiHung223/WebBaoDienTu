using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace Demo_DOAN
{
    public partial class DangNhapAd : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username1"] != null)
            {
                Response.Redirect("DefaultAd.aspx");
            }
        }


        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            string username = Login1.UserName;
            string password = Login1.Password;
            Session["LoggedInUser"] = username;
            string sql = "Select * From ADMIN Where TenDangNhap='" + username + "' and MatKhau = '" + password + "'";
            DataTable dt = ketnoi.docdulieu(sql);
            if (dt.Rows.Count > 0)
            {
                Session["username1"] = username;
                Response.Redirect("DefaultAd.aspx");
            }
        }
    }
}