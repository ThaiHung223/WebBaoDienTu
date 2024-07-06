using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Demo_DOAN
{
    public partial class ChiTiet : System.Web.UI.Page
    {
        LopKetNoi ketnoi = new LopKetNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username1"] != null)
            {
                Response.Redirect("DefaultAd.aspx");
            }
            string mabao = Request.QueryString["mabao"] + "";
            if (mabao != "")
            {
                string sql = "Select * From BAODT  Where MABAO=" + mabao;
                dl_chitiet.DataSource = ketnoi.docdulieu(sql);
                dl_chitiet.DataBind();
                dl_chitiet1.DataSource = ketnoi.docdulieu(sql);
                dl_chitiet1.DataBind();
                dl_chitiet2.DataSource = ketnoi.docdulieu(sql);
                dl_chitiet2.DataBind();
            }
        }

        protected void dl_chitiet2_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Image img1 = (Image)e.Item.FindControl("Image1");
                Label lbl2 = (Label)e.Item.FindControl("Label2");

                Image img2 = (Image)e.Item.FindControl("Image2");
                Label lbl3 = (Label)e.Item.FindControl("Label3");

                Image img3 = (Image)e.Item.FindControl("Image3");
                Label lbl5 = (Label)e.Item.FindControl("Label5");

                Image img4 = (Image)e.Item.FindControl("Image4");
                Label lbl6 = (Label)e.Item.FindControl("Label6");

                if (string.IsNullOrEmpty((e.Item.DataItem as DataRowView)["HINHANH"].ToString()))
                {
                    img1.Visible = false;
                }
                if (string.IsNullOrEmpty((e.Item.DataItem as DataRowView)["NOIDUNG"].ToString()))
                {
                    lbl2.Visible = false;
                }
                if (string.IsNullOrEmpty((e.Item.DataItem as DataRowView)["HINHANH2"].ToString()))
                {
                    img2.Visible = false;
                }
                if (string.IsNullOrEmpty((e.Item.DataItem as DataRowView)["NOIDUNG2"].ToString()))
                {
                    lbl3.Visible = false;
                }
                if (string.IsNullOrEmpty((e.Item.DataItem as DataRowView)["HINHANH3"].ToString()))
                {
                    img3.Visible = false;
                }
                if (string.IsNullOrEmpty((e.Item.DataItem as DataRowView)["NOIDUNG3"].ToString()))
                {
                    lbl5.Visible = false;
                }
                if (string.IsNullOrEmpty((e.Item.DataItem as DataRowView)["HINHANH4"].ToString()))
                {
                    img4.Visible = false;
                }
                if (string.IsNullOrEmpty((e.Item.DataItem as DataRowView)["NOIDUNG4"].ToString()))
                {
                    lbl6.Visible = false;
                }
            }
        }
    }
}
