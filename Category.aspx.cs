using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiniAccounts
{
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCategories();
            }
        }
        private void BindCategories()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["NeekashDBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT CategoryId, CategoryName FROM Categories";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();

                da.Fill(dt);

                gvCategories.DataSource = dt;
                gvCategories.DataBind();
            }
        }
        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            // Validate inputs
            if (string.IsNullOrEmpty(txtCategoryId.Text) || string.IsNullOrEmpty(txtCategoryName.Text))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please fill in all fields.');", true);
                return;
            }

            int categoryId;
            if (!int.TryParse(txtCategoryId.Text, out categoryId))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Category ID must be a number.');", true);
                return;
            }

            string categoryName = txtCategoryName.Text;

            // Insert category into database
            string connectionString = ConfigurationManager.ConnectionStrings["NeekashDBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Categories (CategoryId, CategoryName) VALUES (@CategoryId, @CategoryName)";
                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@CategoryId", categoryId);
                cmd.Parameters.AddWithValue("@CategoryName", categoryName);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();

                    // Clear input fields
                    txtCategoryId.Text = string.Empty;
                    txtCategoryName.Text = string.Empty;

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Category added successfully.');", true);

                    // Refresh category list
                    BindCategories();
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
                }
            }
        }

        protected void gvCategories_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCategories.PageIndex = e.NewPageIndex; // Set the new page index
            BindCategories(); // Re-bind the dat
        }
    }

    

}