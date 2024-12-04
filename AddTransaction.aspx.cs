using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiniAccounts
{
    public partial class AddTransaction : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand(query, conn);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                ddlCategory.DataSource = reader;
                ddlCategory.DataTextField = "CategoryName"; // Column to display
                ddlCategory.DataValueField = "CategoryId"; // Column for value
                ddlCategory.DataBind();

                // Add a default "Select" option
                ddlCategory.Items.Insert(0, new ListItem("-- Select Category --", ""));
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                bool result = TransactionSave();
                if (result)
                {
                    // Trigger the success modal
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Transaction saved successfully!');", true);
                }
                else
                {
                    // Trigger the error modal
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", $"alert('Error: Please check!');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", $"alert('Error: {ex.Message}');", true);
            }


            // Response.Redirect("Default.aspx");
        }

        public bool TransactionSave()
        {
            bool isSuccess = false;
            string transactionType = ddlTransactionType.SelectedValue;
            decimal amount = Convert.ToDecimal(txtAmount.Text);
            string description = txtDescription.Text;
            DateTime transactionDate;
            DateTime.TryParse(txtTransactionDate.Text, out transactionDate);
            try
            {
                int categoryId = int.Parse(ddlCategory.SelectedValue);
                string connString = ConfigurationManager.ConnectionStrings["NeekashDBConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = @"
                     INSERT INTO Transactions (TransactionType, CategoryId, Amount, Description, TransactionDate)
                     VALUES (@TransactionType, @CategoryId, @Amount, @Description, @TransactionDate)";

                    SqlCommand cmd = new SqlCommand(query, conn);

                    cmd.Parameters.AddWithValue("@TransactionType", transactionType);
                    cmd.Parameters.AddWithValue("@CategoryId", categoryId);
                    cmd.Parameters.AddWithValue("@Amount", amount);
                    cmd.Parameters.AddWithValue("@Description", description);
                    cmd.Parameters.AddWithValue("@TransactionDate", transactionDate);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
                isSuccess = true;
            }
            catch (Exception ex)
            {

            }
            return isSuccess;
        }
    }
}