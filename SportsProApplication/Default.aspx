<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="SportsProApplication._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">

        <div class="col-sm-offset-1">

        
        <h1>Welcome to SportsPro</h1>

            
            </div>
        <div class="row col-sm-offset-1">
            <%--  
            <asp:Button ID="btnLogin" CssClass="btn btn-primary " runat="server" Text="" OnClick="btnLogin_Click" />
            <asp:Button ID="btnRegister" CssClass="btn btn-default " runat="server" Text="" OnClick="btnRegister_Click" /> --%>
            <asp:LoginStatus ID="lsLogin" runat="server" class="col-sm-2" LogoutAction="Redirect" LogoutText="Log off" LogoutPageUrl="~/Default.aspx" OnLoggingOut="Unnamed_LoggingOut" />
            <asp:LinkButton ID="lbRegister" class="col-sm-2" runat="server" Text="Register" OnClick="lbRegister_Click"></asp:LinkButton>
            
            
                  
        
            

        </div>
         
    </div>

</asp:Content>
