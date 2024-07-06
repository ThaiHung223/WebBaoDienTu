using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Demo_DOAN
{
    public partial class FixVietBai : Page
    {
        LopKetNoi ketnoi = new LopKetNoi();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["MABAO"] != null)
                {
                    string mabao = Request.QueryString["MABAO"].ToString();
                    LoadDataForEdit(mabao);
                }
            }
        }

        private void LoadDataForEdit(string mabao)
        {
            string query = "SELECT * FROM BAOCD WHERE MABAO = '" + mabao + "'";
            DataTable dt = ketnoi.docdulieu(query);

            if (dt.Rows.Count > 0)
            {
                txttieude.Text = dt.Rows[0]["TIEUDE"].ToString();
                txtnd1.Text = dt.Rows[0]["NOIDUNG"].ToString();
                txtanh1.Text = dt.Rows[0]["HINHANH"].ToString();
                txtnd2.Text = dt.Rows[0]["NOIDUNG2"].ToString();
                txtanh2.Text = dt.Rows[0]["HINHANH2"].ToString();
                txtnd3.Text = dt.Rows[0]["NOIDUNG3"].ToString();
                txtanh3.Text = dt.Rows[0]["HINHANH3"].ToString();
                txtnd4.Text = dt.Rows[0]["NOIDUNG4"].ToString();
                txtanh4.Text = dt.Rows[0]["HINHANH4"].ToString();
                txtmadm.Text = dt.Rows[0]["MADANHMUC"].ToString();
                txttacgia.Text = dt.Rows[0]["TACGIA"].ToString();
            }
        }

        protected void btndang_Click(object sender, EventArgs e)
        {
            string mabao = Request.QueryString["MABAO"];
            if (!string.IsNullOrEmpty(mabao))
            {
                // UPDATE existing record
                string sql = "UPDATE BAOCD SET TIEUDE = N'" + txttieude.Text + "', " +
                             "NOIDUNG = N'" + txtnd1.Text + "', HINHANH = '" + txtanh1.Text + "', " +
                             "NOIDUNG2 = N'" + txtnd2.Text + "', HINHANH2 = '" + txtanh2.Text + "', " +
                             "NOIDUNG3 = N'" + txtnd3.Text + "', HINHANH3 = '" + txtanh3.Text + "', " +
                             "NOIDUNG4 = N'" + txtnd4.Text + "', HINHANH4 = '" + txtanh4.Text + "', " +
                             "MADANHMUC = '" + txtmadm.Text + "', NGAYSOAN = '" + DateTime.Now.ToString("yyyy-MM-dd") + "', " +
                             "TACGIA = N'" + txttacgia.Text + "' WHERE MABAO = '" + mabao + "'";

                int kq = ketnoi.CapNhat(sql);
                if (kq >= 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật thành công!'); window.location.href = 'DefaultTG.aspx';", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cập nhật thất bại!');", true);
                }
            }
            else
            {
                
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
