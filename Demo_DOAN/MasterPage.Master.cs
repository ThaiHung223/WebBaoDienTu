using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo_DOAN
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        LopKetNoi ketnoi = new LopKetNoi();
        protected void Page_Load(object sender, EventArgs e)
        {
            lbSoluot.Text = Application["soluotTC"] + "";
            if (!IsPostBack)
            {

                string loggedInUser = (string)Session["LoggedInUser"];


                tieudedangnhap.InnerHtml = loggedInUser;
            }
            if (Session["LoggedInUser"] != null)
            {

                string loggedInUser = (string)Session["LoggedInUser"];


                tieudedangnhap.InnerHtml = loggedInUser;
            }
            else
            {
                tieudedangnhap.InnerHtml = "ĐĂNG NHẬP";
            }
        }
    }
}