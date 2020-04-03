<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductMaintenance.aspx.cs" Inherits="SportsProApplication.ProductMaintenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-xs-12 table-responsive"">
        <%-- Start GridView --%>
        
        <asp:GridView CssClass="table table-bordered table-striped table-condensed" ID="gvProducts"
            runat="server" AutoGenerateColumns="False" DataKeyNames="ProductCode"
            DataSourceID="gridvProducts" OnPreRender="gvProducts_PreRender" OnRowUpdated="gvProducts_RowUpdated">
            <Columns>
           
                 <%-- Non-Editable Product Code --%>
                <asp:TemplateField HeaderText="ProductCode" SortExpression="ProductCode">
                    <EditItemTemplate>
                        <asp:Label ID="lblProductCode" runat="server" Text='<%# Eval("ProductCode") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblProductCode" runat="server" Text='<%# Bind("ProductCode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
        <%-- Editable Name --%>
                
                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtProductName" runat="server" Text='<%# Bind("Name") %>'  CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvProductName" runat="server" 
                            ErrorMessage="This is a required field" 
                            ControlToValidate="txtProductName" 
                             >*
                            </asp:RequiredFieldValidator>
                        
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
              
                
       <%-- Editable Version --%>

                <asp:TemplateField HeaderText="Version" SortExpression="Version">
                    <EditItemTemplate>
                        <asp:TextBox CssClass="form-control" ID="txtVersion" runat="server" Text='<%# Bind("Version") %>'></asp:TextBox>
                         <asp:RequiredFieldValidator ID="rfvVersion" runat="server" 
                            ErrorMessage="This is a required field" 
                            ControlToValidate="txtVersion" 
                             >*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rvfVersionNumber" runat="server"  ErrorMessage="Please enter in the following format: ##.##"
                            ValidationExpression="^[0-9]{1,2}([.][0-9]{1,2})?$" ControlToValidate="txtVersion">*</asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblVersion" runat="server" Text='<%# Bind("Version") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
               
        <%-- Editable Release Date--%>


                <asp:TemplateField HeaderText="ReleaseDate" SortExpression="ReleaseDate">
                    <EditItemTemplate>
                        <asp:TextBox CssClass="form-control" ID="txtReleaseDate" runat="server" Text='<%# Bind("ReleaseDate", "{0:d}") %>'></asp:TextBox>
                       
                        <asp:RequiredFieldValidator ID="rfvReleaseDate" runat="server" 
                            ErrorMessage="This is a required field" CssClass="text-danger" 
                            ControlToValidate="txtReleaseDate" 
                              >*
                             </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator  
                            ID="RegularExpressionValidator1" runat="server"
                            ErrorMessage="The date is in the incorrect format"
                            ControlToValidate="txtReleaseDate"   ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$">*
                            
                        </asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblReleaseDate" runat="server" Text='<%# Bind("ReleaseDate", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                
                
                
                
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" ButtonType="Button" ControlStyle-ForeColor="#FF0066" ControlStyle-Width="75" ItemStyle-HorizontalAlign="Center">
                    <ControlStyle ForeColor="#FF0066" Width="75px"></ControlStyle>

                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:CommandField>
                <asp:CommandField ShowDeleteButton="True" ButtonType="Button" ControlStyle-ForeColor="#FF0066" ControlStyle-Width="75" ItemStyle-HorizontalAlign="Center">
<ControlStyle ForeColor="#FF0066" Width="75px"></ControlStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:CommandField>
            </Columns>
        </asp:GridView>
      <%-- Validation Summary--%>

        <div>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="True" ForeColor="Red" HeaderText="Please correct the following errors: "   />
        </div>
       
        <%-- Data Source--%>


        <asp:SqlDataSource runat="server" ID="gridvProducts" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [Products] WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [Version] = @original_Version AND [ReleaseDate] = @original_ReleaseDate" InsertCommand="INSERT INTO [Products] ([ProductCode], [Name], [Version], [ReleaseDate]) VALUES (@ProductCode, @Name, @Version, @ReleaseDate)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [ProductCode], [Name], [Version], [ReleaseDate] FROM [Products] ORDER BY [ProductCode]" UpdateCommand="UPDATE [Products] SET [Name] = @Name, [Version] = @Version, [ReleaseDate] = @ReleaseDate WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [Version] = @original_Version AND [ReleaseDate] = @original_ReleaseDate">
            <DeleteParameters>
                <asp:Parameter Name="original_ProductCode" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Name" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Version" Type="Decimal"></asp:Parameter>
                <asp:Parameter Name="original_ReleaseDate" Type="DateTime"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ProductCode" Type="String"></asp:Parameter>
                <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                <asp:Parameter Name="Version" Type="Decimal"></asp:Parameter>
                <asp:Parameter Name="ReleaseDate" Type="DateTime"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                <asp:Parameter Name="Version" Type="Decimal"></asp:Parameter>
                <asp:Parameter Name="ReleaseDate" Type="DateTime"></asp:Parameter>
                <asp:Parameter Name="original_ProductCode" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Name" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Version" Type="Decimal"></asp:Parameter>
                <asp:Parameter Name="original_ReleaseDate" Type="DateTime"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
    
        <%-- Out of GridView Label--%>

    </div>
        <asp:Label style="margin-left:2rem;" Font-Bold="True" Font-Size="Medium" ID="lblAddANewProduct" runat="server" Text="To add a new product, enter the product information and click Add Product"></asp:Label>
    <div>
        <br />
</div>

    <%-- TextBox Row Product Code--%>

    <div class="container">
    <div class="form-group row">
        <asp:Label class="col-sm-3" style="margin-left:1rem;" Font-Bold="True" Font-Size="Medium" ID="lblAddProductCode" runat="server" Text="Product Code:"></asp:Label>
        <asp:TextBox  class="col-sm-3 form-control" ID="txtAddProductCode" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator class="col-sm-3 text-danger" ID="rfvProductCode" runat="server" ErrorMessage="This field is required." 
             ControlToValidate="txtAddProductCode" ValidationGroup="Add"></asp:RequiredFieldValidator>
    </div>
   
         <%-- TextBox Row Product Name--%>

    <div class="form-group row">
        <asp:Label class="col-sm-3" style="margin-left:1rem;" Font-Bold="True" Font-Size="Medium" ID="lblAddProductName" runat="server" Text="Name:"></asp:Label>
        <asp:TextBox  class="col-sm-5 form-control" ID="txtAddProductName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator class="col-sm-3 text-danger" ID="rfvName"  ValidationGroup="Add" runat="server" ErrorMessage="This field is required." ControlToValidate="txtAddProductName"></asp:RequiredFieldValidator>
    </div>
    
         <%-- TextBox Row Product Version--%>

         <div class="form-group row">
        <asp:Label class="col-sm-3" style="margin-left:1rem;" Font-Bold="True" Font-Size="Medium" ID="lblAddVersion" runat="server" Text="Version:"></asp:Label>
        <asp:TextBox  class="col-sm-5 form-control" ID="txtAddVersion" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator class="col-sm-3 text-danger" ValidationGroup="Add" ID="rfvAddVersion" runat="server" ErrorMessage="This field is required." ControlToValidate="txtAddVersion" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>

         <%-- TextBox Row Product Release Date--%>

    <div class="form-group row">
        <asp:Label style="margin-left:1rem;" Font-Bold="True" Font-Size="Medium" class="col-sm-3" ID="lblAddReleaseDate" runat="server" Text="Release Date:"></asp:Label>
        <asp:TextBox  class="col-sm-3 form-control" ID="txtAddReleaseDate" placeholder="mm/dd/yy" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator class="col-sm-3 text-danger" ValidationGroup="Add" ID="rfvDate" runat="server" ErrorMessage="This field is required." ControlToValidate="txtAddReleaseDate" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:CompareValidator class="col-sm-3 text-danger" ID="cvDate" runat="server" ValidationGroup="Add" ErrorMessage="Please enter a valid date." ControlToValidate="txtAddReleaseDate" Type="Date" Operator="DataTypeCheck" Display="Dynamic"></asp:CompareValidator>
   
    </div >

 
    <%-- Button to Add New Product--%>

        <asp:Button   ID="btnAddProduct" runat="server" Text="Add Product" CssClass="btn btn-primary col-sm-3 col-sm-offset-3" OnClick="btnAddProduct_Click" />

    </div>
    <div class="row">

        <asp:Label ID="lblDBError" class="text-danger" runat="server" Text="" style="margin-left:2rem; margin-top:2rem;" Font-Bold="True" EnableViewState="False"></asp:Label>
    </div>
 
</asp:Content>
 