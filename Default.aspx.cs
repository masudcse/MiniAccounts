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
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSummary();
            }
        }
        private void LoadSummary()
        {
            string connString = ConfigurationManager.ConnectionStrings["NeekashDBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("GetSummary", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblTotalIncome.Text = reader["TotalIncome"].ToString();
                    lblTotalExpense.Text = reader["TotalExpense"].ToString();
                }
            }
        }
    }
}