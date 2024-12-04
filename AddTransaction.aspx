<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddTransaction.aspx.cs" Inherits="MiniAccounts.AddTransaction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div class="container mt-0">
        <div class="card shadow">
            <div class="card-header bg-primary text-white text-center">
                <h4>Add Transaction</h4>
            </div>
            <div class="card-body">

                <div class="mb-3">
                    <label for="TransactionType" class="form-label">Transaction Type:</label>
                    <asp:DropDownList ID="ddlTransactionType" runat="server" CssClass="form-select">
                        <asp:ListItem Text="Income" Value="Income"></asp:ListItem>
                        <asp:ListItem Text="Expense" Value="Expense"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label for="Category" class="form-label">Category:</label>
                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select">
                        <asp:ListItem Text="-- Select Category --" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label for="Amount" class="form-label">Amount:</label>
                    <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" placeholder="Enter amount"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="TransactionDate" class="form-label">Transaction Date:</label>
                    <asp:TextBox ID="txtTransactionDate" runat="server" CssClass="form-control" placeholder="Select date"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="Description" class="form-label">Description:</label>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" placeholder="Enter description"></asp:TextBox>
                </div>

                <div class="text-center">
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                </div>

            </div>
        </div>
    </div>
    <script>
        $(function () {
            $("#<%= txtTransactionDate.ClientID %>").datepicker({
               dateFormat: "yy-mm-dd", // Format as YYYY-MM-DD
               changeMonth: true,      // Allow month selection
               changeYear: true,       // Allow year selection
               showAnim: "slideDown"   // Animation for the date picker
           });
       });
    </script>

</asp:Content>
