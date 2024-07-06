using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Demo_DOAN
{
    public partial class DefaultAd : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi();
        PagedDataSource pds = new PagedDataSource();
        int currentPage;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            string sql = "Select * From DANHMUCCD";
            dl_danhmuc.DataSource = ketnoi.docdulieu(sql);
            dl_danhmuc.DataBind();

            string sql1 = "Select * From BAOCD";
            dl_baodt.DataSource = ketnoi.docdulieu(sql1);
            dl_baodt.DataBind();
            currentPage = 0;
            ViewState["PageCount"] = 0;
            BindDataList();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string madm = ((LinkButton)sender).CommandArgument; // Lấy ra được mã danh mục mà lúc nãy gắn vào CommandArgument
            string sql1 = "";
            if (madm == "")
            {
                sql1 = "Select * From BAOCD";
            }
            else
            {
                sql1 = "Select * From BAOCD Where MADANHMUC='" + madm + "'";
            }
            dl_baodt.DataSource = ketnoi.docdulieu(sql1);
            dl_baodt.DataBind();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string mabao = ((ImageButton)sender).CommandArgument;
            Response.Redirect("ChiTietCD.aspx?mabao=" + mabao);
        }

        protected void LinkButton2_Click1(object sender, EventArgs e)
        {
            string mabao = ((LinkButton)sender).CommandArgument;
            Response.Redirect("ChiTietCD.aspx?mabao=" + mabao);
        }

        private void BindDataList()
        {
            string sql = "SELECT * FROM BAOCD";
            DataTable dt = ketnoi.docdulieu(sql);

            pds.DataSource = dt.DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = 9;
            pds.CurrentPageIndex = currentPage;

            ViewState["PageCount"] = pds.PageCount;

            btnPrevious.Enabled = !pds.IsFirstPage;
            btnNext.Enabled = !pds.IsLastPage;

            dl_baodt.DataSource = pds;
            dl_baodt.DataBind();
        }

        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            currentPage = (int)ViewState["CurrentPage"];
            currentPage -= 1;
            ViewState["CurrentPage"] = currentPage;
            BindDataList();
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            currentPage = (int)ViewState["CurrentPage"];
            currentPage += 1;
            ViewState["CurrentPage"] = currentPage;
            BindDataList();
        }

        protected void btnpheduyet_Click(object sender, EventArgs e)
        {
            string mabao = (sender as Button).CommandArgument; // Lấy mã báo từ CommandArgument của Button

            // Chuyển dữ liệu từ BAOCD sang BAODT
            bool isTransferSuccessful = TransferDataToBAODT(mabao);

            if (isTransferSuccessful)
            {
                // Cập nhật trạng thái đã duyệt trong BAOCD
                UpdateTrangThaiBAOCD(mabao);

                // Cập nhật lại DataList dl_baodt
                LoadDataListBAOCD();

                // Thông báo và chuyển hướng
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Phê duyệt thành công!'); window.location='DefaultAD.aspx';", true);
            }
            else
            {
                // Thông báo thất bại
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Phê duyệt thất bại!');", true);
            }
        }

        private bool TransferDataToBAODT(string mabao)
        {
            try
            {
                string sqlTransfer = "INSERT INTO BAODT (MABAO, TIEUDE, NOIDUNG, HINHANH, NOIDUNG2, HINHANH2, NOIDUNG3, HINHANH3, NOIDUNG4, HINHANH4, MADANHMUC, NGAYSOAN, TACGIA) " +
                                     "SELECT MABAO, TIEUDE, NOIDUNG, HINHANH, NOIDUNG2, HINHANH2, NOIDUNG3, HINHANH3, NOIDUNG4, HINHANH4, MADANHMUC, NGAYSOAN, TACGIA " +
                                     "FROM BAOCD WHERE MABAO = '" + mabao + "'";

                int kqTransfer = ketnoi.CapNhat(sqlTransfer);
                return kqTransfer >= 1; // Trả về true nếu thành công, false nếu thất bại
            }
            catch (Exception)
            {
                return false;
            }
        }

        private void UpdateTrangThaiBAOCD(string mabao)
        {
            try
            {
                string queryUpdateBAOCD = "UPDATE BAOCD SET TRANGTHAI = N'Đã duyệt' WHERE MABAO = '" + mabao + "'";
                ketnoi.CapNhat(queryUpdateBAOCD);
            }
            catch (Exception)
            {
                // Bỏ qua lỗi
            }
        }

        private void LoadDataListBAOCD()
        {
            try
            {
                // Cập nhật lại DataList dl_baodt sau khi thực hiện phê duyệt
                string queryBAOCD = "SELECT * FROM BAOCD WHERE TRANGTHAI IS NULL OR TRANGTHAI != N'Đã duyệt'";
                DataTable dtBAOCD = ketnoi.docdulieu(queryBAOCD);

                if (dtBAOCD.Rows.Count > 0)
                {
                    dl_baodt.DataSource = dtBAOCD;
                    dl_baodt.DataBind();
                }
                else
                {
                    // Xử lý khi không có dữ liệu để hiển thị
                    dl_baodt.DataSource = null;
                    dl_baodt.DataBind();
                }
            }
            catch (Exception)
            {
                // Bỏ qua lỗi
            }
        }

        protected void dl_baodt_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                string mabao = e.CommandArgument.ToString();
                string sql = "DELETE FROM BAOCD WHERE MABAO = '" + mabao + "'";
                int kq = ketnoi.CapNhat(sql);

                if (kq >= 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa thành công!');", true);
                    BindDataList();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa thất bại!');", true);
                }
            }
        }
    }
}
