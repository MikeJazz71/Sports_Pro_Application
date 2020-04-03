<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SportsProApplication.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

       <div >

        <div class="form-horizontal col-sm-offset-1" >

        
        <h1>Register</h1>
            <h3>Create a new account</h3>
            
            </div>

           <%-- Email Address --%>
           
               

               
           <div class="form-group row col-md-6 col-sm-offset-1">
               <div class="form-group ">
                    <asp:Label ID="lblRegisterEmail"  runat="server" Text="Email" Font-Bold="True"></asp:Label>
                   <div class="form-group row">
                       

                       <asp:TextBox class="form-control col-md-5" ID="txtRegisterEmail" runat="server"></asp:TextBox>
                       <asp:RequiredFieldValidator class="col-md-1" ID="rfvRegisterEmail" runat="server" ErrorMessage="Email is required." ForeColor="Red" ControlToValidate="txtRegisterEmail" Display="Dynamic">*</asp:RequiredFieldValidator>
                       <asp:RegularExpressionValidator class="col-md-1" ForeColor="Red" ID="regexRequiredEmail" runat="server" ErrorMessage="Please enter a valid email."
                           ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                           Display="Dynamic" ControlToValidate="txtRegisterEmail">*</asp:RegularExpressionValidator>
                   </div>
                   <asp:Label Font-Bold="True"  ID="lblRequiredPassword" runat="server" Text="Password"></asp:Label>
                   <div class="form-group row">
                       
                       <asp:TextBox class="form-control col-md-5" ID="txtRegisterPassword" runat="server"></asp:TextBox>
                       <asp:RequiredFieldValidator class="col-md-1" ForeColor="Red" ID="rvfRegisterPassword" runat="server" ErrorMessage="A password is required" ControlToValidate="txtRegisterPassword">*</asp:RequiredFieldValidator>

                   </div>   
                   <asp:Label  Font-Bold="True" ID="lblConfirmPassword" runat="server" Text="Confirm password"></asp:Label>
                   <div class="form-group row">
                       
                       <asp:TextBox class="form-control col-md-5" ID="txtRegisterConfirmPassword" runat="server"></asp:TextBox>
                       <asp:RequiredFieldValidator  class="col-md-1" ForeColor="Red" ID="rfvRegisterConfirmPassword" runat="server" ErrorMessage="Password is required" ControlToValidate="txtRegisterConfirmPassword">*</asp:RequiredFieldValidator>
                       <asp:CompareValidator class="col-md-1"  ForeColor="Red" ID="cvRegisterConfirmPassword" runat="server" ErrorMessage="Passwords must match." ControlToValidate="txtRegisterConfirmPassword" ControlToCompare="txtRegisterPassword">*</asp:CompareValidator>
                   </div>

                   <div>

                       <asp:Button CssClass="btn btn-default" ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
                   </div>

                   
</div>
               </div>
         <asp:ValidationSummary class="col-md-5 text-danger"  ID="vsRegister" runat="server" />

               </div>
      
        

</asp:Content>
