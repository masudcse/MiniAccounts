using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace MiniAccounts
{
    public partial class DatewiseExpense : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            DateTime startDate;
            DateTime endDate;

            if (DateTime.TryParse(txtStartDate.Text, out startDate) &&
                DateTime.TryParse(txtEndDate.Text, out endDate))
            {
                string transactionType = "Expense";
                var data = GetFilteredExpenses(startDate, endDate,transactionType); // Replace with your data-fetching logic.
                gvExpenses.DataSource = data;
                gvExpenses.DataBind();
            }
            else
            {
                // Handle invalid dates.
            }
        }
        private List<Expense> GetFilteredExpenses(DateTime startDate, DateTime endDate,string transactionType)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["NeekashDBConnectionString"].ConnectionString; // Replace with your actual connection string
            var expenses = new List<Expense>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("GetTransactionsByDate", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@StartDate", startDate);
                    cmd.Parameters.AddWithValue("@EndDate", endDate);
                    cmd.Parameters.AddWithValue("@TransactionType", transactionType);

                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            expenses.Add(new Expense
                            {
                                TransactionDate = Convert.ToDateTime(reader["TransactionDate"]),
                                Amount = Convert.ToDecimal(reader["Amount"]),
                                Description = reader["Description"].ToString()
                            });
                        }
                    }
                }
            }

            return expenses;
        }
        public class Expense
        {
            public DateTime TransactionDate { get; set; }
            public decimal Amount { get; set; }
            public string Description { get; set; }
        }
    }
}