<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactDisplay.aspx.cs" Inherits="SportsProApplication.ContactDisplay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="form-group">
            <asp:Label class="col-sm-8 offset-sm-1" ID="lblContactList"  runat="server" Text="Contact list:" Font-Bold="True" Font-Size="Medium"></asp:Label>
            <div>
             <div class="row">
                <asp:ListBox size=4 class="col-sm-7" style="margin-left:2rem;" ID="lstbxContacts" runat="server"></asp:ListBox>
            <div >
                <asp:Button class="btn btn-primary col-sm-3 offset-1" ID="btnRemoveContact" style="margin-left:1rem; margin-bottom:1em;" runat="server" Text="Remove Contact" OnClick="btnRemoveContact_Click" />
                <div>
                  <br />  
                </div>
               <div>
                <asp:Button class="btn btn-secondary col-sm-3 offset-1" ID="btnEmptyList" style="margin-left:1rem;"  runat="server" Text="Empty List" OnClick="btnEmptyList_Click" />
                   </div>
                </div>
                 
                <div class="col-sm-8 offset-sm-1 form-group">
                    <asp:Label  ID="lblSelectContactRemove" runat="server" Text="Select the contact to remove." Visible="False" Font-Bold="True" ForeColor="Red"></asp:Label>
                    <asp:Label  ID="lblContactListEmpty" runat="server" Text="The contact list is empty." Visible="False" Font-Bold="True" ForeColor="Red"></asp:Label>

                </div>
                </div>
            </div>
             <div >
            <asp:Button  class="btn btn-primary col-sm-4"  style="margin-right:26rem;" ID="btnSelectAddCust" runat="server" Text="Select Additional Customers" OnClick="btnSelectAddCust_Click" />
      </div>
        </div>
                 </div>
            
        

    
</asp:Content>
