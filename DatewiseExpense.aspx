<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DatewiseExpense.aspx.cs" Inherits="MiniAccounts.DatewiseExpense" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
    <!-- Form Section -->
   
        <div class="row">
            <!-- Start Date -->
            <div class="col-md-6">
                <div class="form-group">
                    <label for="txtStartDate" class="form-label">Start Date:</label>
                    <asp:TextBox ID="txtStartDate" runat="server"  CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <!-- End Date -->
            <div class="col-md-6">
                <div class="form-group">
                    <label for="txtEndDate" class="form-label">End Date:</label>
                    <asp:TextBox ID="txtEndDate" runat="server"  CssClass="form-control"></asp:TextBox>
                </div>
            </div>
        </div>

        <!-- Search Button -->
        <div class="text-center mt-3">
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
        </div>
 

    <!-- GridView Section -->
    <div class="table-responsive">
        <asp:GridView ID="gvExpenses" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="TransactionDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" DataFormatString="{0:C}" />
                <asp:BoundField DataField="Description" HeaderText="Description" />
            </Columns>
        </asp:GridView>
    </div>
</div>
    <script>
    $(document).ready(function () {
        $("#<%= txtStartDate.ClientID %>,#<%= txtEndDate.ClientID %>").datepicker({
            format: "yyyy-mm-dd", // Format as YYYY-MM-DD
            autoclose: true,
            todayHighlight: true
        });
    });
    </script>
</asp:Content>
