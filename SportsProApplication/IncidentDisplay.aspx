<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IncidentDisplay.aspx.cs" Inherits="SportsProApplication.IncidentDisplay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">

        <%-- ListView Element --%>
        <asp:ListView ID="lvIncident" runat="server" DataSourceID="lvIncidentDataSource">

            
           
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
           
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label Text='<%# Eval("Product") %>' runat="server" ID="Label6" /></td>
                    
                    <td style="font-weight: bold;">                       
                       <br />
                        DateOpened: <br />
                        DateClosed: <br />
                        Title: <br />
                        Description:
                    </td>
                    <td>
                         <asp:Label Text='<%# Eval("Customer") %>' runat="server" ID="Label5" /><br />
                        <asp:Label Text='<%# Eval("DateOpened", "{0:d}") %>' runat="server" ID="Label1" /><br />
                        <asp:Label Text='<%# Eval("DateClosed", "{0:d}") %>' runat="server" ID="Label2" /><br />
                        <asp:Label Text='<%# Eval("Title") %>' runat="server" ID="Label3" /><br />
                        <asp:Label Text='<%# Eval("Description") %>' runat="server" ID="Label4" />

                    </td>
                    <td>
                        <asp:Label Text='<%# Eval("Technician") %>' runat="server" ID="Label7" /></td>

                  

                </tr>
                 
                    
                   
                    
                    
                   
                    







            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server" class="col-xs-12 table-responsive">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" class="table table-bordered table-striped">
                                <thead style="background-color:black; color:white">
                                    <tr runat="server" style="">
                                        <th  class="col-xs-2"  runat="server">Product</th>
                                        <th class="col-xs-1" runat="server"></th>
                                        <th class="col-xs-4" runat="server">Customer</th>
                                        <th class="col-xs-3" runat="server">Technician</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr id="itemPlaceholder" runat="server"></tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="background-color:black;  " class="text-center">
                            <asp:DataPager PageSize="4" style="color:white;"  runat="server" ID="DataPager1">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Link"  ButtonCssClass="btn btn-primary" ></asp:NextPreviousPagerField>
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
           
        </asp:ListView>

        <%-- ListView DataSource --%>


        <asp:SqlDataSource runat="server" ID="lvIncidentDataSource" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT Incidents.DateOpened, Incidents.DateClosed, Incidents.Title, Incidents.Description, Customers.Name AS Customer, Products.Name AS Product, Technicians.Name AS Technician FROM Incidents INNER JOIN Customers ON Incidents.CustomerID = Customers.CustomerID INNER JOIN Products ON Incidents.ProductCode = Products.ProductCode INNER JOIN Technicians ON Incidents.TechID = Technicians.TechID"></asp:SqlDataSource>
    </div>
</asp:Content>

