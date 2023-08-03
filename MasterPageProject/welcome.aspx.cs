using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

namespace MasterPageProject
{
    public partial class welcome : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=DESKTOP-IOJE25P\\SQLEXPRESS;initial catalog=DB_MPP;integrated security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            showUserDetails();
        }

        public void showUserDetails() 
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("selectRowByID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", Convert.ToInt32(Session["user_id"]));
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            con.Close();
            gv_list_of_users.DataSource = dt;
            gv_list_of_users.DataBind();
        }
    }
}