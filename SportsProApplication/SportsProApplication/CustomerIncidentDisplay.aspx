<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerIncidentDisplay.aspx.cs" Inherits="SportsProApplication.CustomerIncidentDisplay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="container">   
        <div class="form-group row">
            <asp:Label class="col-sm-3 offset-sm-1" ID="lblSelectACustomer" style="margin-top:1rem;" Font-Bold="True" Font-Size="Medium" runat="server" Text="Select a customer: " ></asp:Label>
            <div class="col-sm-6">
                <asp:DropDownList ID="ddlSelectACustomer" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="CustomerID" AutoPostBack="True"></asp:DropDownList>


                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [CustomerID], [Name] FROM [Customers]"></asp:SqlDataSource>
            </div>
        </div>

    </div>


     <div class="container" >  
         <asp:DataList ID="dlIncidents" runat="server" DataSourceID="dbIncidents"  CellPadding="4" ForeColor="#333333" Width="1140px">
             <AlternatingItemStyle BackColor="White" />
             <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
             <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
             <HeaderTemplate>
          
            <span class="col-md-3" >Product/Incident</span>
            <span class="col-md-3"  >Tech Name</span>
            <span  class="col-md-3"  >Opened</span>
            <span  class="col-md-3" >Closed</span>
          
             </HeaderTemplate>
             <ItemStyle BackColor="#EFF3FB" />
             <ItemTemplate>
                 
                 <asp:Label class="col-md-3" Text='<%# Eval("ProductName") %>' runat="server" ID="ProductNameLabel" />
                 <asp:Label class="col-md-3"  Text='<%# Eval("TechName") %>' runat="server" ID="TechNameLabel" />
                 
                 <asp:Label class="col-md-3" Text='<%# Eval("DateOpened", "{0:d}") %>' runat="server" ID="DateOpenedLabel" />
                 
                 <asp:Label class="col-md-3" Text='<%# Eval("DateClosed", "{0:d}") %>' runat="server" ID="DateClosedLabel" /><br />
               
                 <asp:Label style="margin-left:1.75rem;" Text='<%# Eval("Description") %>' runat="server" ID="DescriptionLabel" />
                 
                
                 
                 
             </ItemTemplate>
             <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
         </asp:DataList>


         <asp:SqlDataSource runat="server" ID="dbIncidents" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT Technicians.Name AS TechName, Incidents.Description, 
        Products.Name AS ProductName, Incidents.DateOpened, Incidents.DateClosed, 
        Incidents.CustomerID FROM ((Incidents INNER JOIN Products ON Incidents.ProductCode = Products.ProductCode) 
        INNER JOIN Technicians ON Incidents.TechID = Technicians.TechID) 
        WHERE ([CustomerID] = @CustomerID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlSelectACustomer" PropertyName="SelectedValue" Name="CustomerID" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
         </asp:SqlDataSource>
     </div>

</asp:Content>
