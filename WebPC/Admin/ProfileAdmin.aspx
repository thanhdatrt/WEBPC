<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ProfileAdmin.aspx.cs" Inherits="WebPC.Admin.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Public/Admin/css/StyleDesign.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="frames">
        <div class="frame_title"> Profile </div>
        <div class="item">
            
            <image class="item_image" alt="Avatar" src="<% Response.Write(Session["avatar"].ToString());%>" />
            <asp:Label ID="lbUsername" Width="100px" CssClass="item_label_user" Text="" runat="server" />
        </div>
        <br />
        <div class="item">
            <asp:Label Width="110px" CssClass="item_label" Text="Email: " runat="server" />
            <asp:TextBox ID="txtEmail" CssClass="item_input" AutoComplete="off" runat="server"></asp:TextBox>
        </div>
        <br />
        <div class="item">
            <asp:Label Width="110px" CssClass="item_label" Text="Password: " runat="server" />
            <a href="ChangePass.aspx">Change Password</a>
        </div>
        <br />
         <div class="item">
            <asp:Label Width="110px" CssClass="item_label" Text="Author: " runat="server" />
            <asp:TextBox ID="txtAuthor" CssClass="item_input" title="Bạn không có quyền sửa trường này" EnableViewState="false" ReadOnly="true" AutoComplete="off" runat="server"></asp:TextBox>
             
        </div>
         <br />
        <div class="item">
            <asp:Label Width="110px" CssClass="item_label" Text="Avatar: " runat="server" />
            <asp:TextBox ID="txtAvatar" CssClass="item_input" EnableViewState="false" AutoComplete="off" runat="server"></asp:TextBox>

        </div>
        <br />
            <asp:Label ID="lbmessage" CssClass="message alert-danger" Text="" runat="server" />
        <br />
        <asp:Button ID="btnSave" OnClick="btnSave_Click" CssClass="btn btn-success btnSave" Text="Save" runat="server" />
        <br />
    </div>

</asp:Content>
