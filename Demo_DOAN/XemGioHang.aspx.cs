using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Demo_DOAN
{
    public partial class XemGioHang : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable gioHang = (DataTable)Session["GioHang"];
                if (gioHang != null)
                {
                    TinhTongTien(gioHang);

                    gvGioHang.DataSource = gioHang;
                    gvGioHang.DataBind();

                    decimal tongDonHang = gioHang.AsEnumerable().Sum(row => row.Field<decimal>("TongTien"));
                    lblTongDonHang.Text = "Tổng đơn hàng: " + tongDonHang.ToString("N0") + "đ";
                }
            }
        }

        protected void gvGioHang_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "XoaSanPham")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                DataTable gioHang = (DataTable)Session["GioHang"];
                gioHang.Rows.RemoveAt(rowIndex);
                TinhTongTien(gioHang);
                gvGioHang.DataSource = gioHang;
                gvGioHang.DataBind();

                // Cập nhật lại tổng đơn hàng
                decimal tongDonHang = gioHang.AsEnumerable().Sum(row => row.Field<decimal>("TongTien"));
                lblTongDonHang.Text = "Tổng đơn hàng: " + tongDonHang.ToString("N0") + "đ";
            }
        }

        private void TinhTongTien(DataTable gioHang)
        {
            // Kiểm tra xem cột "Tổng Tiền" đã tồn tại trong DataTable chưa
            if (!gioHang.Columns.Contains("TongTien"))
            {
                gioHang.Columns.Add("TongTien", typeof(decimal));
            }

            foreach (DataRow row in gioHang.Rows)
            {
                decimal donGia = Convert.ToDecimal(row["DonGia"]);
                int soLuong = Convert.ToInt32(row["SoLuong"]);
                decimal thanhTien = donGia * soLuong;
                row["TongTien"] = thanhTien;
            }
        }

        protected void btnDecrease_Click(object sender, EventArgs e)
        {
            // Lấy chỉ mục hàng được kích hoạt
            int rowIndex = ((GridViewRow)((Button)sender).NamingContainer).RowIndex;

            // Lấy giỏ hàng từ Session
            DataTable gioHang = (DataTable)Session["GioHang"];

            // Giảm số lượng của hàng tại chỉ mục đã lấy, đảm bảo không nhỏ hơn 1
            int soLuong = Convert.ToInt32(gioHang.Rows[rowIndex]["SoLuong"]);
            gioHang.Rows[rowIndex]["SoLuong"] = (soLuong > 1) ? soLuong - 1 : 1;

            // Tính lại tổng tiền
            TinhTongTien(gioHang);

            // Cập nhật GridView và tổng đơn hàng
            UpdateGridViewAndTotal(gioHang);
        }

        protected void btnIncrease_Click(object sender, EventArgs e)
        {
            // Lấy chỉ mục hàng được kích hoạt
            int rowIndex = ((GridViewRow)((Button)sender).NamingContainer).RowIndex;

            // Lấy giỏ hàng từ Session
            DataTable gioHang = (DataTable)Session["GioHang"];

            // Tăng số lượng của hàng tại chỉ mục đã lấy
            gioHang.Rows[rowIndex]["SoLuong"] = Convert.ToInt32(gioHang.Rows[rowIndex]["SoLuong"]) + 1;

            // Tính lại tổng tiền
            TinhTongTien(gioHang);

            // Cập nhật GridView và tổng đơn hàng
            UpdateGridViewAndTotal(gioHang);
        }

        private void UpdateGridViewAndTotal(DataTable gioHang)
        {
            gvGioHang.DataSource = gioHang;
            gvGioHang.DataBind();

            // Hiển thị tổng đơn hàng
            decimal tongDonHang = gioHang.AsEnumerable().Sum(row => row.Field<decimal>("TongTien"));
            lblTongDonHang.Text = "Tổng đơn hàng: " + tongDonHang.ToString("N0") + "đ";
        }



        protected void btnThanhToan_Click(object sender, EventArgs e)
        {
            // Xử lý logic thanh toán
            // ...
        }
    }
}