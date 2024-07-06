using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.IO;


namespace Demo_DOAN
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            string path = Server.MapPath("~/dem.txt");
            if (!File.Exists(path))
            {
                File.WriteAllText(path, "0");
            }

            Application["soluotTC"] = int.Parse(File.ReadAllText(path));
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Application.Lock();
            Application["soluotTC"] = (int)Application["soluotTC"] + 1;
            File.WriteAllText(Server.MapPath("~/dem.txt"), Application["soluotTC"].ToString());
            Application.UnLock();
        }
    }
}