using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Demo_DOAN
{
    public partial class QuanLyDanhMuc : System.Web.UI.Page
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
        }

        protected void dl_danhmuc_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                string madm = e.CommandArgument.ToString();
                string sql = "DELETE FROM DANHMUC WHERE MADANHMUC = '" + madm + "'";
                int kq = ketnoi.CapNhat(sql);

                if (kq >= 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa thành công!');", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Xóa thất bại!');", true);
                }
            }
        }
    }
}