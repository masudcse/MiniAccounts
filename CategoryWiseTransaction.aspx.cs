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
    public partial class CategoryWiseTransaction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCategoryTransactions(null, null); // Default load without filter
            }
        }
        protected void btnFilter_Click(object sender, EventArgs e)
        {
            // Fetch start and end dates from the UI
            DateTime? startDate = string.IsNullOrEmpty(txtStartDate.Text) ? (DateTime?)null : Convert.ToDateTime(txtStartDate.Text);
            DateTime? endDate = string.IsNullOrEmpty(txtEndDate.Text) ? (DateTime?)null : Convert.ToDateTime(txtEndDate.Text);

            // Bind filtered data
            BindCategoryTransactions(startDate, endDate);
        }


        private void BindCategoryTransactions(DateTime? startDate, DateTime? endDate)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["NeekashDBConnectionString"].ConnectionString))
            {
                // SQL query with optional filtering
                string query = @"
               SELECT 
                C.CategoryName, 
                SUM(CASE WHEN T.TransactionType = 'Income' THEN T.Amount ELSE 0 END) AS TotalIncome,
                SUM(CASE WHEN T.TransactionType = 'Expense' THEN T.Amount ELSE 0 END) AS TotalExpense
            FROM Transactions T
            INNER JOIN Categories C ON T.CategoryId = C.CategoryId
            WHERE (@StartDate IS NULL OR CAST(T.TransactionDate AS DATE) >= @StartDate)
              AND (@EndDate IS NULL OR CAST(T.TransactionDate AS DATE) <= @EndDate)
            GROUP BY C.CategoryName
            ORDER BY C.CategoryName;";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    // Add parameters
                    cmd.Parameters.AddWithValue("@StartDate", (object)startDate ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@EndDate", (object)endDate ?? DBNull.Value);

                    // Execute query and bind results
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvCategorySummary.DataSource = dt;
                    gvCategorySummary.DataBind();
                }
            }
        }

    }

}