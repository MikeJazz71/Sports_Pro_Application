<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TechnicianMaintenance.aspx.cs" Inherits="SportsProApplication.TechnicianMaintenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="container">

      <%-- Select the Tech Row --%>
        
        <div class="form-group row ">

            <asp:Label class="col-sm-3 offset-sm-1" Font-Bold="True" Font-Size="Medium" ID="lblSelectTech" runat="server" Text="Select a Technician: "></asp:Label>

            <div class="col-sm-8">
                <asp:DropDownList CssClass="form-control"  ID="ddlSelectTech" runat="server" AutoPostBack="True" DataSourceID="dbSelectTech" DataTextField="Name" DataValueField="TechID"></asp:DropDownList>


                <asp:SqlDataSource runat="server" ID="dbSelectTech" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [TechID], [Name] FROM [Technicians] ORDER BY [Name]"></asp:SqlDataSource>
            </div>

        </div>

        <%-- FormView Control --%>
        <div class="form-group row">      
        <asp:FormView CssClass="col-sm-8 container" ID="fvSelectTech" runat="server" 
            DataKeyNames="TechID" DataSourceID="dbFormViewSelectTech" CellPadding="4" ForeColor="#333333" 
            onitemdeleted="fvTechMain_ItemDeleted" style="margin-left:17px;" oniteminserted="fvTechMain_ItemInserted" 
        onitemupdated="fvTechMain_ItemUpdated">

            

        
           
            
          

            <%-- EditItem Template --%>

            <EditItemTemplate>
                <div class="col-sm-8 ">


                    <div class="form-group row offset-sm-1" style="padding-top: 7px;" >
                        <div class="col-sm-3" >
                            TechID:
                        </div>
                        <asp:Label Text='<%# Eval("TechID") %>' runat="server" ID="TechIDLabel1" />  <br />
                    </div>
                    

                    <div class="form-group row">
                        <div class="col-sm-3">
                            Name:
                        </div>
                        
                        <asp:TextBox class="col-sm-7 form-control"   Text='<%# Bind("Name") %>' runat="server" ID="txtEditName" Width="268px" />
                        <asp:RequiredFieldValidator ID="rfvEditName"  ControlToValidate="txtEditName" class="text-danger col-sm-2" ForeColor="Red"
                            runat="server" ErrorMessage="Required Field" >*</asp:RequiredFieldValidator>
                            
                        <br />
                            
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-3">
                            Email:
                        </div>
                        <asp:TextBox class="form-control col-sm-3"  Text='<%# Bind("Email") %>' runat="server" ID="txtEditEmail" Width="268px" />
                        <asp:RequiredFieldValidator  Display="Dynamic" class="col-sm-2 text-danger" ID="rfvEditEmail" ForeColor="Red" runat="server" ErrorMessage="Email is a required field" 
                            ControlToValidate="txtEditEmail">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator Display="Dynamic" ID="regexEditEmail" ForeColor="Red" class="text-danger col-sm-2 " runat="server" ErrorMessage="Invalid email address" 
                           
                            ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" 
                            ControlToValidate="txtEditEmail">*</asp:RegularExpressionValidator>
                        <br />
                    </div>

                    <div class="form-group row ">
                        <div class="col-sm-3">
                            Phone:
                        </div>
                        <asp:TextBox class="col-sm-3 form-control" Text='<%# Bind("Phone") %>' runat="server" ID="txtEditPhone" Width="268px" />
                         <asp:RequiredFieldValidator Display="Dynamic" class="col-sm-2 text-danger" ID="rfvEditPhone" ForeColor="Red" runat="server" ErrorMessage="Phone is a required field" 
                            ControlToValidate="txtEditPhone">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator Display="Dynamic" class=" col-sm-2 text-danger" ForeColor="Red" ID="regexEditPhone" runat="server" ErrorMessage="Please enter a valid phone number." 
                            ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$"  ControlToValidate="txtEditPhone">*</asp:RegularExpressionValidator>
                        <br />
                    </div>

                    <div class="form-group ">
                        <div class="col-sm-5">
                            <asp:LinkButton runat="server" Text="Update" class="btn btn-primary" CommandName ="Update" ID="UpdateButton" CausesValidation="True" />
                            &nbsp;<asp:LinkButton runat="server" class="btn btn-default"  Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
                        </div>
                    </div>


                </div>

            </EditItemTemplate>
            
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderTemplate>
                &nbsp;&nbsp; Selected Technician
            </HeaderTemplate>


            <%-- InsertItem Template --%>

            <InsertItemTemplate>
                <div class="col-sm-8">
               
                    
                <div class="form-group row " style="padding-top: 11px;">
                <div class="col-sm-3">
                Name:
                    </div>  
                <asp:TextBox class="col-sm-3 form-control" Text='<%# Bind("Name") %>' runat="server" ID="txtInsertName" />
                    <asp:RequiredFieldValidator Display="Dynamic" ID="rfvInsertName" runat="server" ForeColor="Red" class="col-sm-2 " ErrorMessage="Please enter a name" 
                        ControlToValidate="txtInsertName">*</asp:RequiredFieldValidator>
                    
                    <br />
                    </div>  


                <div class="form-group  row" >
                <div class="col-sm-3">
                Email:
                    </div>  
                <asp:TextBox class="col-sm-3 form-control" Text='<%# Bind("Email") %>' runat="server" ID="txtInsertEmail" />
                    <asp:RequiredFieldValidator Display="Dynamic" ForeColor="Red" ID="rfvInsertEmail" class="col-sm-2 " runat="server" ErrorMessage="Email is required" 
                        ControlToValidate="txtInsertEmail">*</asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator Display="Dynamic" ForeColor="Red" ID="regexInsertEmail" class="col-sm-2 " runat="server" ErrorMessage="Invalid email address." 
                        ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                        ControlToValidate="txtInsertEmail" >*</asp:RegularExpressionValidator>
                    <br />
                    </div>  

                    <div class="form-group  row" >
                <div class="col-sm-3">
                Phone:
                    </div>
                <asp:TextBox class="col-sm-3 form-control" Text='<%# Bind("Phone") %>' runat="server" ID="txtInsertPhone" />
                        
                        <asp:RequiredFieldValidator Display="Dynamic" ID="rfvInsertPhone" ForeColor="Red" class="col-sm-2 " runat="server" ErrorMessage="This is a required field" 
                            ControlToValidate="txtInsertPhone">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ForeColor="Red" ID="regexInsertPhone" class="col-sm-2 " runat="server" ErrorMessage="Invalid phone number." 
                            ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$" 
                            ControlToValidate="txtInsertPhone"  Display="Dynamic">*</asp:RegularExpressionValidator>
                        <br />
                        </div>  

                    <div class="form-group  " >
                <div class="col-sm-5">
                <asp:LinkButton class="btn btn-primary" runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" 
                    CausesValidation="True" />&nbsp;<asp:LinkButton class="btn btn-default" runat="server" Text="Cancel" 
                        CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                    </div>
                        </div>
            </InsertItemTemplate>


            <%-- ItemTemplate --%>

            <ItemTemplate>
                <div class="col-sm-8">
                    <div class="form-group " style="padding-top:11px;">
               <div class="col-sm-3" >
                   TechID:
               </div> 
                <asp:Label  Text='<%# Bind("TechID") %>' runat="server" ID="TechIDLabel" /><br />
                        <hr class="my-4">
                    </div>

               <div class="form-group">
               <div class="col-sm-3" >
                Name:
                   </div>
                <asp:Label Text='<%# Bind("Name") %>' runat="server" ID="NameLabel" /><br />
                   <hr class="my-4">
            </div>

               <div class="form-group">
               <div class="col-sm-3" >
                Email:
                   </div>
                <asp:Label Text='<%# Bind("Email") %>' runat="server" ID="EmailLabel" /><br />
                   <hr class="my-4">
                   </div>

                <div class="form-group">
               <div class="col-sm-3" >
                Phone:
                   </div>
                <asp:Label Text='<%# Bind("Phone") %>' runat="server" ID="PhoneLabel" /><br />
                    </div>
               <div class="form-group">
               <div class="col-sm-6" >

                <asp:LinkButton runat="server"  class="btn btn-primary" Text="Edit" CommandName="Edit" ID="EditButton" 
                    CausesValidation="False" />&nbsp;
                    <asp:LinkButton  class="btn btn-default" runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
                  &nbsp; <asp:LinkButton class="btn btn-danger" runat="server" Text="Delete" 
                        CommandName="Delete" ID="DeleteButton" 
                        CausesValidation="False" />
                  
                   </div>
                   </div>
            </div>  
            </ItemTemplate>
           

            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
           

            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
           

        </asp:FormView>
                     <%-- Validation Summary --%>

<asp:ValidationSummary class="col-lg-3 text-danger" ID="vsTechMain" runat="server" HeaderText="Please fix the following errors: "/>
       
       </div>

         <div class="row">

        <asp:Label ID="lblTechMainDBError" style="margin-left:2rem; margin-top:2rem;" class="text-danger" runat="server" Text="" Font-Bold="True" EnableViewState="False"></asp:Label>
    </div>

        <%-- End FormView --%>





        
        

        <%-- DataSource --%>



        <asp:SqlDataSource runat="server" ID="dbFormViewSelectTech" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [Technicians] WHERE [TechID] = @original_TechID AND [Name] = @original_Name AND [Email] = @original_Email AND [Phone] = @original_Phone" InsertCommand="INSERT INTO [Technicians] ([Name], [Email], [Phone]) VALUES (@Name, @Email, @Phone)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [TechID], [Name], [Email], [Phone] FROM [Technicians] WHERE ([TechID] = @TechID)" UpdateCommand="UPDATE [Technicians] SET [Name] = @Name, [Email] = @Email, [Phone] = @Phone WHERE [TechID] = @original_TechID AND [Name] = @original_Name AND [Email] = @original_Email AND [Phone] = @original_Phone">
            <DeleteParameters>
                <asp:Parameter Name="original_TechID" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="original_Name" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Email" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Phone" Type="String"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                <asp:Parameter Name="Phone" Type="String"></asp:Parameter>
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlSelectTech" PropertyName="SelectedValue" Name="TechID" Type="Int32"></asp:ControlParameter>
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                <asp:Parameter Name="Phone" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_TechID" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="original_Name" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Email" Type="String"></asp:Parameter>
                <asp:Parameter Name="original_Phone" Type="String"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

    
</asp:Content>
