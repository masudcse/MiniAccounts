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
            bool isSuccess=false;
            string transactionType = ddlTransactionType.SelectedValue;
            decimal amount = Convert.ToDecimal(txtAmount.Text);
            string description = txtDescription.Text;
            DateTime transactionDate = DateTime.Now;
            try
            {
                string connString = ConfigurationManager.ConnectionStrings["NeekashDBConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO Transactions (TransactionType, Amount, Description, TransactionDate) VALUES (@TransactionType, @Amount, @Description, @TransactionDate)", conn);
                    cmd.Parameters.AddWithValue("@TransactionType", transactionType);
                    cmd.Parameters.AddWithValue("@Amount", amount);
                    cmd.Parameters.AddWithValue("@Description", description);
                    cmd.Parameters.AddWithValue("@TransactionDate", transactionDate);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
                isSuccess = true;
            }
            catch(Exception ex)
            {

            }
           return isSuccess;
        }
    }
}