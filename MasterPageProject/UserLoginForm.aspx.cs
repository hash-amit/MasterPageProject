using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MasterPageProject
{
    public partial class UserLoginForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=DESKTOP-IOJE25P\\SQLEXPRESS;initial catalog=DB_MPP;integrated security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("verifyEmailPassword", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@email", text_email.Text);
            cmd.Parameters.AddWithValue("@password", text_pswd.Text);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            con.Close();
            Session["user_id"] = dt.Rows[0]["UID"].ToString();
            if (dt.Rows.Count > 0)
            {
                Response.Redirect("welcome.aspx");
            }
            else
            {
                lbl_invalid_msg.Text = "Sorry! you may have enered wrong email/password...!!";
            }
        }
    }
}