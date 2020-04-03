<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerMaintenance.aspx.cs" Inherits="SportsProApplication.CustomerMaintenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

  

    <div class="container">

        <%-- GridView and DetailsView Group --%>
        <div class="form-group row">

            <%-- GridView --%>
            <div class="row">
                <div class="col-md-5 offset-md-1">
                    <asp:GridView Style="margin-left: 2rem;" ID="gvCustomerMaintenance" class=" table table-bordered table-striped table-condensed" runat="server"
                        AutoGenerateColumns="False" DataKeyNames="CustomerID" DataSourceID="dsCustomerMaintenance" AllowPaging="True" AllowSorting="True"
                        PagerSettings-Mode="NextPreviousFirstLast" PagerStyle-HorizontalAlign="Center" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>

                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City"></asp:BoundField>
                            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State"></asp:BoundField>
                            <asp:CommandField ShowSelectButton="True" ButtonType="Button" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:CommandField>
                            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" InsertVisible="False" SortExpression="CustomerID" Visible="False"></asp:BoundField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White"  HorizontalAlign="Center" CssClass="pagerStyle" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>

                    </div>

                <%-- DetailsView Control --%>
                <div class="col-md-5 offset-md-1 ">
                <asp:DetailsView style="margin-left:2rem;" ID="dvCustomerMaintenance"  class=" table table-bordered table-striped table-condensed " runat="server" 
                     DataSourceID="detailsviewCustomerMaintenance" AutoGenerateRows="False"
                    DataKeyNames="CustomerID" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                    <EditRowStyle BackColor="#999999" />
                    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                    <Fields >
                        <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" InsertVisible="False" SortExpression="CustomerID"></asp:BoundField>
                        <asp:BoundField  DataField="Name" HeaderText="Name" SortExpression="Name" ControlStyle-CssClass="form-control"></asp:BoundField>
                        <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" ControlStyle-CssClass="form-control"></asp:BoundField>
                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" ControlStyle-CssClass="form-control"></asp:BoundField>
                        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" ControlStyle-CssClass="form-control"></asp:BoundField>
                        <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" SortExpression="ZipCode" ControlStyle-CssClass="form-control"></asp:BoundField>
                        <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" ControlStyle-CssClass="form-control"></asp:BoundField>
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" ControlStyle-CssClass="form-control"></asp:BoundField>
                        <asp:CommandField ShowInsertButton="True" ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
                    </Fields>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" Cssclass="pagerStyle" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                </asp:DetailsView>

                    </div>

               <%-- DataSources --%>


                <asp:SqlDataSource runat="server" ID="detailsviewCustomerMaintenance" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = @original_CustomerID AND [Name] = @original_Name AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL))" InsertCommand="INSERT INTO [Customers] ([Name], [Address], [City], [State], [ZipCode], [Phone], [Email]) VALUES (@Name, @Address, @City, @State, @ZipCode, @Phone, @Email)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Customers] WHERE ([CustomerID] = @CustomerID)" UpdateCommand="UPDATE [Customers] SET [Name] = @Name, [Address] = @Address, [City] = @City, [State] = @State, [ZipCode] = @ZipCode, [Phone] = @Phone, [Email] = @Email WHERE [CustomerID] = @original_CustomerID AND [Name] = @original_Name AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_CustomerID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Address" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_City" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_State" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_ZipCode" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Phone" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Email" Type="String"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Address" Type="String"></asp:Parameter>
                        <asp:Parameter Name="City" Type="String"></asp:Parameter>
                        <asp:Parameter Name="State" Type="String"></asp:Parameter>
                        <asp:Parameter Name="ZipCode" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Phone" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="gvCustomerMaintenance" PropertyName="SelectedValue" Name="CustomerID" Type="Int32"></asp:ControlParameter>
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Address" Type="String"></asp:Parameter>
                        <asp:Parameter Name="City" Type="String"></asp:Parameter>
                        <asp:Parameter Name="State" Type="String"></asp:Parameter>
                        <asp:Parameter Name="ZipCode" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Phone" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_CustomerID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Address" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_City" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_State" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_ZipCode" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Phone" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Email" Type="String"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource runat="server" ID="dsCustomerMaintenance" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = @original_CustomerID AND [Name] = @original_Name AND [City] = @original_City AND [State] = @original_State" InsertCommand="INSERT INTO [Customers] ([Name], [City], [State]) VALUES (@Name, @City, @State)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Name], [City], [State], [CustomerID] FROM [Customers]" UpdateCommand="UPDATE [Customers] SET [Name] = @Name, [City] = @City, [State] = @State WHERE [CustomerID] = @original_CustomerID AND [Name] = @original_Name AND [City] = @original_City AND [State] = @original_State">
                    <DeleteParameters>
                        <asp:Parameter Name="original_CustomerID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_City" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_State" Type="String"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="City" Type="String"></asp:Parameter>
                        <asp:Parameter Name="State" Type="String"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="City" Type="String"></asp:Parameter>
                        <asp:Parameter Name="State" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_CustomerID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_City" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_State" Type="String"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>

             <asp:Label style="margin-left:2rem" ID="lblCustomerMainDBError" class="text-danger" runat="server" Text="" EnableViewState="False" Font-Bold="True" ></asp:Label>


        </div>



    </div>
</asp:Content>
