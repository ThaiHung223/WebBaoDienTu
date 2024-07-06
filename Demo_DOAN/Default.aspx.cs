using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Demo_DOAN
{
    public partial class Default : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi();
        PagedDataSource pds = new PagedDataSource();
        int currentPage;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            string sql = "Select * From DANHMUC";
            dl_danhmuc.DataSource = ketnoi.docdulieu(sql);
            dl_danhmuc.DataBind();

            string sql1 = "Select * From BAODT ORDER BY MABAO DESC"; // Sắp xếp theo thứ tự giảm dần của MABAO
            dl_baodt.DataSource = ketnoi.docdulieu(sql1);
            dl_baodt.DataBind();

            currentPage = 0;
            ViewState["CurrentPage"] = currentPage;
            ViewState["PageCount"] = 0;

            BindDataList();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string madm = ((LinkButton)sender).CommandArgument; //Lấy ra được mã danh mục mà lúc nãy gắn vào CommandArgument
            string sql1 = "";
            if (madm == "")
            {
                sql1 = "Select * From BAODT ORDER BY MABAO DESC"; // Sắp xếp theo thứ tự giảm dần của MABAO
            }
            else
            {
                sql1 = "Select * From BAODT Where MADANHMUC='" + madm + "' ORDER BY MABAO DESC"; // Sắp xếp theo thứ tự giảm dần của MABAO
            }
            dl_baodt.DataSource = ketnoi.docdulieu(sql1);
            dl_baodt.DataBind();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string mabao = ((ImageButton)sender).CommandArgument;
            Response.Redirect("ChiTiet.aspx?mabao=" + mabao);
        }

        protected void LinkButton2_Click1(object sender, EventArgs e)
        {
            string mabao = ((LinkButton)sender).CommandArgument;
            Response.Redirect("ChiTiet.aspx?mabao=" + mabao);
        }

        private void BindDataList()
        {
            string sql = "SELECT * FROM BAODT ORDER BY MABAO DESC"; // Sắp xếp theo thứ tự giảm dần của MABAO
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
    }
}
