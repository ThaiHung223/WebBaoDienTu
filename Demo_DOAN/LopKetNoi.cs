using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace Demo_DOAN
{
    public class LopKetNoi
    {
        SqlConnection con;
        private void ketnoi()
        {
            string sqlCon = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Workspace\CongCu\DEMO_DOAN\Demo_DOAN\Demo_DOAN\App_Data\QL_TT.mdf;Integrated Security=True";
            con = new SqlConnection(sqlCon);
            con.Open();
        }
        private void dongketnoi()
        {
            if (con.State == ConnectionState.Open)
                con.Close();

        }
        public DataTable docdulieu(string sql)
        {
            DataTable dt = new DataTable();
            try
            {
                ketnoi();
                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                da.Fill(dt);
                dongketnoi();
            }
            catch
            {
                dt = null;
            }
            finally
            {
                dongketnoi();
            }
            return dt;
        }
        public int CapNhat(string sql) 
        {
            int ketqua = 0;
            try
            {
                ketnoi();
                SqlCommand cmd = new SqlCommand(sql, con);
                ketqua = cmd.ExecuteNonQuery(); 
                return ketqua;
            }
            catch
            {
                ketqua = 0;
            }
            finally
            {
                dongketnoi();
            }
            return ketqua;
        }
        public object ExecuteScalar(string sql)
        {
            ketnoi();
            try
            {
                SqlCommand cmd = new SqlCommand(sql, con);
                return cmd.ExecuteScalar();
            }
            catch (Exception ex)
            {
                throw new Exception("Error: " + ex.Message);
            }
            finally
            {
                dongketnoi();
            }
        }
    }
}