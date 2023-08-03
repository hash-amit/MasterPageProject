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
    public partial class ListOfUsers : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=DESKTOP-IOJE25P\\SQLEXPRESS;initial catalog=DB_MPP;integrated security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView();
            }
        }

        public void GridView()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM TBL_USER_REGISTRATION JOIN TBL_USER_GENDER ON USER_GENDER=GID JOIN TBL_USER_DESIGNATION ON USER_DESIGNATION=DID", con);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            con.Close();
            gv_list_of_users.DataSource = dt;
            gv_list_of_users.DataBind();
            int recordCount = dt.Rows.Count;
            if (recordCount > 0)
            {
                lbl_search_result.Text = recordCount.ToString() + " record(s) found.";
            }
            else
            {
                lbl_search_result.Text = "No records found.";
            }
        }

        protected void Btn_search_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("ShowSearchResult", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@textToSearch", text_search.Text);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            con.Close();
            gv_list_of_users.DataSource = dt;
            gv_list_of_users.DataBind();
            
            // Display the search result message
            int recordCount = dt.Rows.Count;
            if (recordCount > 0)
            {
                lbl_search_result.Text = recordCount.ToString() + " record(s) found.";
            }
            else
            {
                lbl_search_result.Text = "No records found.";
            }
        }

        protected void gv_list_of_users_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "D")
            {
                int commandArgumentValue = Convert.ToInt32(e.CommandArgument);
                con.Open();
                SqlCommand cmd = new SqlCommand("DeleteUserInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@uid", commandArgumentValue);
                cmd.ExecuteNonQuery();
                con.Close();
                GridView();
            }
            else if(e.CommandName == "E")
            {
                Response.Redirect("UserRegistrationForm.aspx?pp=" + e.CommandArgument);
            }
            
        }
    }
}