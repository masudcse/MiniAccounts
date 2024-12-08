<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CategoryWiseTransaction.aspx.cs" Inherits="MiniAccounts.CategoryWiseTransaction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-0">
        <h3 class="text-center mb-4">Category-Wise Transactions</h3>

        <!-- Date Filter Form -->
        <div class="row mb-3">
            <div class="col-md-4">
                <label for="txtStartDate" class="form-label">Start Date:</label>
                <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" placeholder="Start Date"></asp:TextBox>
            </div>
            <div class="col-md-4">
                <label for="txtEndDate" class="form-label">End Date:</label>
                <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control" placeholder="End Date"></asp:TextBox>
            </div>
            <div class="col-md-4 d-flex align-items-end">
                <asp:Button ID="btnFilter" runat="server" Text="Filter" CssClass="btn btn-primary" OnClick="btnFilter_Click" />
            </div>
        </div>

        <!-- GridView for Transactions -->
        <div class="table-responsive">
            <asp:GridView ID="gvCategorySummary" runat="server" CssClass="table table-bordered table-hover"
                AutoGenerateColumns="False" ShowHeaderWhenEmpty="True">
                <Columns>
                    <asp:BoundField DataField="CategoryName" HeaderText="Category" />
                    <asp:BoundField DataField="TotalIncome" HeaderText="Total Income" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="TotalExpense" HeaderText="Total Expense" DataFormatString="{0:C}" />
                </Columns>
            </asp:GridView>

        </div>
    </div>
</asp:Content>
