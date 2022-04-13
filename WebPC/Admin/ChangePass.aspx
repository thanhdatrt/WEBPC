<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ChangePass.aspx.cs" Inherits="WebPC.Admin.ChangePass" %>
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
            <asp:Label Width="110px" CssClass="item_label" Text="Old Password: " runat="server" />
            <asp:TextBox ID="txtOldPass" CssClass="item_input" TextMode="Password" EnableViewState="false" AutoComplete="off" runat="server"></asp:TextBox>
        </div>
        <br />
        <div class="item">
            <asp:Label Width="110px" CssClass="item_label" Text="New Password: " runat="server" />
            <asp:TextBox ID="txtnewpass" TextMode="Password" CssClass="item_input" EnableViewState="false" AutoComplete="off" runat="server"></asp:TextBox>

        </div>
        <br />
        <div class="item">
            <asp:Label Width="110px" CssClass="item_label" Text="Re-enter Password: " runat="server" />
            <asp:TextBox ID="txtre_enter_pass" CssClass="item_input" TextMode="Password" EnableViewState="false" AutoComplete="off" runat="server"></asp:TextBox>

        </div>
        <br />
            <asp:Label ID="lbmessage" CssClass="message alert-danger" Text="" runat="server" />
        <br />
        <asp:Button ID="btnSave" CssClass="btn btn-success btnSave" OnClick="btnSave_Click" Text="Save" runat="server" />
        <br />
    </div>

</asp:Content>
