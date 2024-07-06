using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Demo_DOAN
{
    public partial class VietBai : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string tendangnhap = Session["Username2"] + "";
                if (!string.IsNullOrEmpty(tendangnhap))
                {
                    txttacgia.Text = tendangnhap;
                }
                else
                {
                    string script = "alert('Bạn phải đăng nhập'); window.location = 'DangNhap.aspx';";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Thông báo", script, true);
                }
            }
        }

        protected void btndang_Click(object sender, EventArgs e)
        {
            string newID = GetNewID();

            string sql = "INSERT INTO BAOCD (MABAO, TIEUDE, NOIDUNG, HINHANH, NOIDUNG2, HINHANH2, NOIDUNG3, HINHANH3, NOIDUNG4, HINHANH4, MADANHMUC, NGAYSOAN, TACGIA) " +
                         "VALUES ('" + newID + "', N'" + txttieude.Text + "', N'" + txtnd1.Text + "', '" + txtanh1.Text + "', N'" + txtnd2.Text + "', '" + txtanh2.Text + "', N'" + txtnd3.Text + "', '" + txtanh3.Text + "', N'" + txtnd4.Text + "', '" + txtanh4.Text + "', '" + txtmadm.Text + "', '" + DateTime.Now.ToString("yyyy-MM-dd") + "', N'" + txttacgia.Text + "')";

            int kq = ketnoi.CapNhat(sql);
            if (kq >= 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thêm thành công!'); window.location.href = 'DefaultTG.aspx';", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thêm thất bại!');", true);
            }
        }

        private string GetNewID()
        {
            string newID = "1"; // mặc định = 1 nếu trống

            string query = "SELECT MAX(MABAO) FROM BAOCD";
            DataTable dt = ketnoi.docdulieu(query);

            if (dt.Rows.Count > 0 && dt.Rows[0][0] != DBNull.Value)
            {
                int maxID = Convert.ToInt32(dt.Rows[0][0]);
                newID = (maxID + 1).ToString();
            }

            return newID;
        }
    }
}
