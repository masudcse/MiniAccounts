<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="MiniAccounts.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
    <div class="card shadow">
        <div class="card-header bg-primary text-white">
            <h4>Add Category</h4>
        </div>
        <div class="card-body">
            <div class="mb-3">
                <label for="CategoryId" class="form-label">Category ID:</label>
                <asp:TextBox ID="txtCategoryId" runat="server" CssClass="form-control" placeholder="Enter Category ID"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="CategoryName" class="form-label">Category Name:</label>
                <asp:TextBox ID="txtCategoryName" runat="server" CssClass="form-control" placeholder="Enter Category Name"></asp:TextBox>
            </div>
            <div class="text-center">
                <asp:Button ID="btnAddCategory" runat="server" Text="Add Category" CssClass="btn btn-success" OnClick="btnAddCategory_Click" />
            </div>
        </div>
    </div>

    <div class="card shadow mt-4">
        <div class="card-header bg-secondary text-white">
            <h4>Existing Categories</h4>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <asp:GridView ID="gvCategories" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="gvCategories_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="CategoryId" HeaderText="Category ID" />
                        <asp:BoundField DataField="CategoryName" HeaderText="Category Name" />
                    </Columns>
                    <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NumericFirstLast" NextPageText="Next" PreviousPageText="Previous" />
                    <PagerStyle Font-Size="Large" />
                </asp:GridView>
            </div>
        </div>
    </div>
</div>
</asp:Content>
