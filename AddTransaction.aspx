<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddTransaction.aspx.cs" Inherits="MiniAccounts.AddTransaction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
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
                    <label for="Amount" class="form-label">Amount:</label>
                    <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" placeholder="Enter amount"></asp:TextBox>
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
    <div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true" runat="server">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title" id="errorModalLabel">Error</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    An error occurred while saving your transaction. Please try again.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function showModal(modalId) {
            var modalElement = document.getElementById(modalId);
            if (modalElement) {
                var modal = new bootstrap.Modal(modalElement);
                modal.show();
            } else {
                console.error("Modal with ID " + modalId + " not found.");
            }
        }
    </script>
</asp:Content>
