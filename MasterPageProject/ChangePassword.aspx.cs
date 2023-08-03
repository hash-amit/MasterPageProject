using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace MasterPageProject
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=DESKTOP-IOJE25P\\SQLEXPRESS;initial catalog=DB_MPP;integrated security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void ClearForm() 
        {
            text_current_pass.Text = string.Empty;
            text_new_pass.Text = string.Empty;
            text_confirm_pass.Text = string.Empty;
            lbl_old_pass.Text = string.Empty;
            lbl_new_pass.Text = string.Empty;
        }

        protected void btn_change_pass_Click(object sender, EventArgs e)
        {
            if (text_new_pass.Text == text_confirm_pass.Text)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("changePassword", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@newPass", text_new_pass.Text);
                cmd.Parameters.AddWithValue("@userID", Convert.ToInt32(Session["user_id"]));
                cmd.Parameters.AddWithValue("@currentPass", text_current_pass.Text);
                int effectedRow = cmd.ExecuteNonQuery();
                con.Close();
                if (effectedRow > 0)
                {
                    lbl_msg.Text = "Your password has been changed successfuly!";
                    ClearForm();
                }
                else
                {
                    lbl_old_pass.Text = "Current password doesn't match!";
                }
            }
            else 
            {
                lbl_new_pass.Text = "Password doesn't match!";
            }
        }
    }
}