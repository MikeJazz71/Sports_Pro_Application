<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageLogins.aspx.cs" Inherits="SportsProApplication.Account.ManageLogins" %>
<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--<h2>Manage your external logins.</h2>--%>
    <%--<asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
            <p class="text-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>
    <div>
        <section id="externalLoginsForm">

            <asp:ListView runat="server"
                ItemType="Microsoft.AspNet.Identity.UserLoginInfo"
                SelectMethod="GetLogins" DeleteMethod="RemoveLogin" DataKeyNames="LoginProvider,ProviderKey">

                <LayoutTemplate>
                    <h4>Registered Logins</h4>
                    <table class="table">
                        <tbody>
                            <tr runat="server" id="itemPlaceholder"></tr>
                        </tbody>
                    </table>

                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#: Item.LoginProvider %></td>
                        <td>
                            <asp:Button runat="server" Text="Remove" CommandName="Delete" CausesValidation="false"
                                ToolTip='<%# "Remove this " + Item.LoginProvider + " login from your account" %>'
                                Visible="<%# CanRemoveExternalLogins %>" CssClass="btn btn-default" />
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>

        </section>
    </div>
    <div>
        <uc:OpenAuthProviders runat="server" ReturnUrl="~/Account/ManageLogins" />
    </div> --%>
    <h2>Manage your external logins.</h2>
    <div class="row">
        <div class="col-sm-12 table-responsive">
            <h2>Users</h2>
            
            <%-- GridView --%>
            <asp:GridView ID="grdUsers" runat="server" DataKeyNames="Id"
                AutoGenerateColumns="False" SelectMethod="grdUsers_GetData" 
                ItemType="SportsProApplication.Models.ApplicationUser" 
                CssClass="table table-bordered table-striped table-condensed" 
                OnPreRender="GridView_PreRender">

                <Columns>
                    <asp:BoundField DataField="UserName" HeaderText="User Name"></asp:BoundField>
                    <asp:BoundField DataField="Email" HeaderText="Email"></asp:BoundField>

                    <asp:TemplateField HeaderText="Roles">

                        
                        <ItemTemplate>
                            <%--<asp:Label runat="server" ID="Label1" Text="<%# ListRoles(Item.Roles) %>"></asp:Label>--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                </Columns>
            </asp:GridView>

        </div>
        <div class="col-sm-6">
            
            <%-- Details View --%>
            <asp:DetailsView ID="dvUsers" runat="server" DataKeyNames="Id" 
                AutoGenerateRows="false" CssClass="table table-bordered table-condensed" 
                SelectMethod="dvUsers_GetItem" UpdateMethod="dvUsers_UpdateItem" 
                InsertMethod="dvUsers_InsertItem" DeleteMethod="dvUsers_DeleteItem">
                <Fields>
                    <asp:BoundField HeaderText="Email" DataField="Email" />
                    <asp:CommandField ShowEditButton="true" ShowInsertButton="true" 
                        ShowDeleteButton="true" />
                </Fields>
            </asp:DetailsView>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-6">
            <h2>Roles</h2>

            <%-- GridView --%>
           <asp:GridView ID="grdRoles" runat="server" DataKeyNames="Id" 
                AutoGenerateColumns="false" SelectMethod="grdRoles_GetData"
                CssClass="table table-bordered table-striped table-condensed" 
                OnPreRender="GridView_PreRender">
                <Columns>
                    <asp:BoundField HeaderText="Role Name" DataField="Name" />
                    <asp:CommandField ShowSelectButton="true" />
                </Columns>
            </asp:GridView>



            <%-- DetailsView --%>
             <asp:DetailsView ID="dvRoles" runat="server" DataKeyNames="Id" 
                AutoGenerateRows="false" CssClass="table table-bordered table-condensed" 
                SelectMethod="dvRoles_GetItem" UpdateMethod="dvRoles_UpdateItem" 
                InsertMethod="dvRoles_InsertItem" DeleteMethod="dvRoles_DeleteItem">
                <Fields>
                    <asp:BoundField HeaderText="Role Name" DataField="Name" />
                    <asp:CommandField ShowEditButton="true" ShowInsertButton="true" 
                        ShowDeleteButton="true" />
                </Fields>
            </asp:DetailsView>
           
        </div>
        <div class="col-sm-6">
            <h2>Add Roles to User</h2>
            <div class="form-group">
                <label class="control-label">Select a user:</label>
                <asp:DropDownList ID="ddlUsers" runat="server" 
                    SelectMethod="grdUsers_GetData" DataValueField="Id"
                    DataTextField="UserName" CssClass="form-control">
                </asp:DropDownList> 
            </div>
            <div class="form-group">
                <label class="control-label">Add one or more roles:</label>
                <asp:ListBox ID="lstRoles" runat="server" SelectionMode="Multiple" 
                    SelectMethod="grdRoles_GetData" DataValueField="Id"
                    DataTextField="Name" CssClass="form-control"></asp:ListBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnAddRoles" runat="server" Text="Add Roles" 
                CssClass="btn btn-default" OnClick="btnAddRoles_Click" />
            </div>
        </div>
    </div>
</asp:Content>
