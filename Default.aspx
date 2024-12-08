<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MiniAccounts.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    .table-responsive {
        position: relative;
    }

    .table-bordered thead th {
        position: sticky;
        top: 0;
        z-index: 2;
        background-color: #f8f9fa; /* Light grey background for header */
    }
    </style>
    <h1 class="text-center my-1">Dashboard</h1>

<div class="container">
    <div class="row">
      <div class="col-md-4">
        <div class="card text-white bg-success mb-3">
            <div class="card-header text-center">
                <h4>Total Income</h4>
            </div>
            <div class="card-body">
                <h5 class="card-title text-center">
                    $<asp:Label ID="lblTotalIncome" runat="server" Text="0"></asp:Label>
                </h5>
            </div>
        </div>
    </div>

    <!-- Total Expense Card -->
    <div class="col-md-4">
        <div class="card text-white bg-danger mb-3">
            <div class="card-header text-center">
                <h4>Total Expense</h4>
            </div>
            <div class="card-body">
                <h5 class="card-title text-center">
                    $<asp:Label ID="lblTotalExpense" runat="server" Text="0"></asp:Label>
                </h5>
            </div>
        </div>
    </div>

    <!-- Balance Card -->
    <div class="col-md-4">
        <div class="card text-white bg-primary mb-3">
            <div class="card-header text-center">
                <h4>Balance</h4>
            </div>
            <div class="card-body">
                <h5 class="card-title text-center">
                    $<asp:Label ID="lblBalance" runat="server" Text="0"></asp:Label>
                </h5>
            </div>
        </div>
    </div>
    </div>
    <div class="container mt-1">
    <h3 class="text-center mb-4">Daily Income & Expense Summary</h3>
    <div class="table-responsive" style="max-height: 400px; overflow-y: auto;">
        <asp:GridView ID="gvDailyTransactions" runat="server" CssClass="table table-bordered table-striped text-center" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="TransactionDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="TotalIncome" HeaderText="Total Income" DataFormatString="{0:C}" />
                <asp:BoundField DataField="TotalExpense" HeaderText="Total Expense" DataFormatString="{0:C}" />
            </Columns>
        </asp:GridView>
    </div>
  </div>
</div>

</asp:Content>
