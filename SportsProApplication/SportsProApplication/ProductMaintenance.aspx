<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductMaintenance.aspx.cs" Inherits="SportsProApplication.ProductMaintenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


        <asp:Label style="margin-left:2rem;" Font-Bold="True" Font-Size="Medium" ID="lblAddANewProduct" runat="server" Text="To add a new product, enter the product information and click Add Product"></asp:Label>
    <div>
        <br />
</div>

    <div class="container">
    <div class="form-group row">
        <asp:Label class="col-sm-3" style="margin-left:1rem;" Font-Bold="True" Font-Size="Medium" ID="lblProductCode" runat="server" Text="Product Code:"></asp:Label>
        <asp:TextBox  class="col-sm-3 form-control" ID="txtProductCode" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator class="col-sm-3 text-danger" ID="rfvProductCode" runat="server" ErrorMessage="This field is required." ControlToValidate="txtProductCode"></asp:RequiredFieldValidator>
    </div>
   
    <div class="form-group row">
        <asp:Label class="col-sm-3" style="margin-left:1rem;" Font-Bold="True" Font-Size="Medium" ID="lblNewProductName" runat="server" Text="Name:"></asp:Label>
        <asp:TextBox  class="col-sm-5 form-control" ID="txtNewProductName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator class="col-sm-3 text-danger" ID="rfvName" runat="server" ErrorMessage="This field is required." ControlToValidate="txtNewProductName"></asp:RequiredFieldValidator>
    </div>
    
    <div class="form-group row">
        <asp:Label style="margin-left:1rem;" Font-Bold="True" Font-Size="Medium" class="col-sm-3" ID="lblReleaseDate" runat="server" Text="Release Date:"></asp:Label>
        <asp:TextBox  class="col-sm-3 form-control" ID="txtReleaseDate" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator class="col-sm-3 text-danger" ID="rfvDate" runat="server" ErrorMessage="This field is required." ControlToValidate="txtReleaseDate"></asp:RequiredFieldValidator>
        <asp:CompareValidator class="col-sm-3 text-danger" ID="cvDate" runat="server" ErrorMessage="Please enter a valid date." ControlToValidate="txtReleaseDate" Type="Date" Operator="DataTypeCheck"></asp:CompareValidator>
   
    </div >

 
   
        <asp:Button   ID="btnAddProduct" runat="server" Text="Add Product" CssClass="btn btn-primary col-sm-3 col-sm-offset-3" />

    </div>
 
</asp:Content>
 