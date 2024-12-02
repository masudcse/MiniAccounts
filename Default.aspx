<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MiniAccounts.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <h1>Dashboard</h1>
    <div>
        
        <p>Total Income: <asp:Label ID="lblTotalIncome" runat="server" Text="0"></asp:Label></p>
        <p>Total Expense: <asp:Label ID="lblTotalExpense" runat="server" Text="0"></asp:Label></p>
    </div>
</asp:Content>
