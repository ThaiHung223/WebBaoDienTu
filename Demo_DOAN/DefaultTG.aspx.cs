using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Demo_DOAN
{
    public partial class DefaultTG : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi();
        PagedDataSource pds = new PagedDataSource();
        int currentPage;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Kiểm tra xem người dùng đã đăng nhập hay chưa
                if (Session["Username2"] == null)
                {
                    Response.Redirect("DangNhap.aspx");
                }
                else
                {
                    // Tiếp tục với các xử lý khác
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
            }
        }
    

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string madm = ((LinkButton)sender).CommandArgument; //Lấy ra được mã danh mục mà lúc nãy gắn vào CommandArgument
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

        protected void btncapnhat_Click(object sender, EventArgs e)
        {
            string tendangnhap = Session["Username2"] + "";
            if (tendangnhap != "")
            {
                Button btn = (Button)sender;
                string mabao = btn.CommandArgument;

                Response.Redirect("FixVietBai.aspx?MABAO=" + mabao);
            }
            else
            {
                string script = "alert('Bạn phải đăng nhập');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Thông báo", script, true);
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