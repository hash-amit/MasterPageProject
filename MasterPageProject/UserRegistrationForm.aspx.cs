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
    public partial class UserRegistrationForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=DESKTOP-IOJE25P\\SQLEXPRESS;initial catalog=DB_MPP;integrated security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                bindGender();
                bindDesignation();
            }

            if (Request.QueryString["pp"] != null && Request.QueryString["pp"].ToString() != "")
            {
                if (!IsPostBack)
                {
                    editRecord();
                }
            }
        }

        public void editRecord()
        {
            // Opening the SQL connection
            con.Open();

            // Creating a new SQL command object and specifying the stored procedure name
            SqlCommand cmd = new SqlCommand("GetUserInfoByID", con);

            // Setting the command type to indicate it's a stored procedure
            cmd.CommandType = CommandType.StoredProcedure;

            // Adding the user ID as a parameter to the stored procedure based on the value from the query string
            cmd.Parameters.AddWithValue("@UserID", Request.QueryString["pp"]);

            // Creating a data adapter to retrieve data from the database using the command
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);

            // Creating a new data table to store the retrieved data
            DataTable dt = new DataTable();

            // Filling the data table with the data from the database
            adapter.Fill(dt);

            // Closing the SQL connection
            con.Close();

            // Populating the text boxes and other controls with the retrieved data from the data table
            text_firstname.Text = dt.Rows[0]["USER_FIRST_NAME"].ToString();
            text_lastname.Text = dt.Rows[0]["USER_LAST_NAME"].ToString();
            text_email.Text = dt.Rows[0]["USER_EMAIL"].ToString();
            rbl_gender.SelectedValue = dt.Rows[0]["USER_GENDER"].ToString();
            ddl_designation.SelectedValue = dt.Rows[0]["USER_DESIGNATION"].ToString();
            text_pswd.Text = dt.Rows[0]["USER_PASSWORD"].ToString();
            
            // Changing the text of button
            btn_register.Text = "Update";
        }

        //fetching list of gender form the database
        public void bindGender()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("ShowGender", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            con.Close();
            rbl_gender.DataValueField = "GID";
            rbl_gender.DataTextField= "GENDER";
            rbl_gender.DataSource = dt;
            rbl_gender.DataBind();
        }

        //fetching list of designation form the database
        public void bindDesignation()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("ShowDesignation", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            con.Close();
            ddl_designation.DataValueField = "DID";
            ddl_designation.DataTextField = "DESIGNATION";
            ddl_designation.DataSource = dt;
            ddl_designation.DataBind();
            ddl_designation.Items.Insert(0, new ListItem("---Select Designation---", "0")); //Inserting value in the dropdown list
        }

        //clearing form
        public void clearForm() 
        {
            text_firstname.Text = string.Empty;
            text_lastname.Text = string.Empty;
            text_email.Text = string.Empty;
            rbl_gender.ClearSelection(); //unselecting radio button
            ddl_designation.SelectedIndex = 0; //setting the default value in drop down list
            text_pswd.Text = string.Empty;
        }

        //Inserting user data into database using procedure
        protected void btn_register_Click(object sender, EventArgs e) //
        {
            if (text_firstname.Text != null && text_firstname.Text != "")
            {
                if (btn_register.Text == "Register")
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("InsertUserInfo", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@fname", text_firstname.Text);
                    cmd.Parameters.AddWithValue("@lname", text_lastname.Text);
                    cmd.Parameters.AddWithValue("@email", text_email.Text);
                    cmd.Parameters.AddWithValue("@gender", rbl_gender.SelectedValue);
                    cmd.Parameters.AddWithValue("@designation", ddl_designation.SelectedValue);
                    cmd.Parameters.AddWithValue("@password", text_pswd.Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    clearForm();
                    Response.Redirect("ListOfUsers.aspx");
                }
                else if (btn_register.Text == "Update")
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("UpdateUserInfo", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@uid", Request.QueryString["pp"]);
                    cmd.Parameters.AddWithValue("@fname", text_firstname.Text);
                    cmd.Parameters.AddWithValue("@lname", text_lastname.Text);
                    cmd.Parameters.AddWithValue("@email", text_email.Text);
                    cmd.Parameters.AddWithValue("@gender", rbl_gender.SelectedValue);
                    cmd.Parameters.AddWithValue("@designation", ddl_designation.SelectedValue);
                    cmd.Parameters.AddWithValue("@password", text_pswd.Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    clearForm();
                    Response.Redirect("ListOfUsers.aspx");
                }
            }
            else
            {
                show_error_msg.Text = "Please fill all the fields..!!";
            }
        }
    }
}