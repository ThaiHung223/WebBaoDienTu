using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Demo_DOAN
{
    public partial class DangKy : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi(); 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;

            if (password != confirmPassword)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Mật khẩu không khớp!');", true);
                return;
            }

            string sql = "INSERT INTO TACGIA (TENDANGNHAP, MATKHAU) VALUES (@username, @password)";

            int kq = ketnoi.CapNhat(sql);
            if (kq > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Đăng ký thành công!');", true);
                Response.Redirect("DangNhapTg.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Có lỗi xảy ra, vui lòng thử lại!');", true);
            }
        }
    }
}
