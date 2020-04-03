<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerDisplay.aspx.cs" Inherits="SportsProApplication.CustomerDisplay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


     <div class="container">
    <div class="form-group row">
         <asp:Label class="col-sm-3 offset-sm-1" style="margin-top:1rem;" Font-Bold="True" Font-Size="Medium" ID="lblCustomer" runat="server" Text="Select a customer:"></asp:Label>
        <div class="col-sm-6">
            <asp:DropDownList CssClass="form-control" ID="ddlSelectCustomer" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Name" AutoPostBack="True"></asp:DropDownList>

            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [CustomerID], [Name], [Address], [City], [State], [ZipCode], [Phone], [Email] FROM [Customers]"></asp:SqlDataSource>
        </div>

        </div>
             <div class="form-group row">
        <asp:Label style="margin-top:1rem;" Font-Bold="True" Font-Size="Medium" class="col-sm-3 offset-sm-1" ID="lblAddress" runat="server" Text="Address:"></asp:Label>
        <div>
            <asp:Label class="col-sm-6" ID="lblDisplayAddress" runat="server" Text=""></asp:Label><br />
         
            <asp:Label  class="col-sm-6" ID="lblDisplayCity" runat="server" Text=""></asp:Label>
              
            
        
        </div>

    </div>

    <div class="form-group row">
        <asp:Label style="margin-top:1rem;" Font-Bold="True" Font-Size="Medium" class=" col-sm-3 offset-sm-1" ID="lblPhone" runat="server" Text="Phone:" ></asp:Label>
        <div>
            <asp:Label class="col-sm-6" ID="lblDisplayPhone" runat="server" Text=""></asp:Label>
        </div>


    </div>
    <div class="form-group row">
        <asp:Label style="margin-top:1rem;" Font-Bold="True" Font-Size="Medium" class="col-sm-3 offset-sm-1" ID="lblEmail" runat="server" Text="Email:"></asp:Label>
        <div>
            <asp:Label class="col-sm-6" ID="lblDisplayEmail" runat="server" Text=""></asp:Label>
        </div>

    </div>
       <div class="form-row">
           <asp:Button class="btn btn-primary col-sm-3 offset-sm-1" ID="btnAddCustomer"
               runat="server" Text="Add to Contact List" OnClick="btnAddCustomer_Click1"
               />
           <div>
               <asp:Button class="btn btn-secondary col-sm-3 offset-1" ID="btnGoContactDisplay" style="margin-left:1rem;" runat="server" Text="Go to Contacts List Page" OnClick="btnGoContactDisplay_Click1"  />
           </div>
           
           <div>
       <br />
           </div>
    
           
       </div>
    <div class="col-sm-3 offset-sm-1">
        <asp:Label ID="lblMessage" runat="server" Text="Customer already is on the contact list." Visible="False" Font-Bold="True" ForeColor="Red"></asp:Label>
    </div>
         </div>
</asp:Content>
