<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="SetUser.aspx.cs" Inherits="WebPC.Admin.SetUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<asp:Repeater ID="rptDS" runat="server" OnItemCommand="rptDS_ItemCommand" Visible="true">
    <HeaderTemplate>
    <table class="table align-items-center mb-0">
        <thead>
        <tr>
            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">USERNAME</th>
            <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">STATUS</th>
            <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">CREATEDATE</th>
            <th class="text-secondary opacity-7"></th>
        </tr>
        </thead>
        <tbody id="myTable">
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td>
                <div class="d-flex px-2 py-1">
                    <div>
                        <img src="<%#Eval("Avatar")%>" class="avatar avatar-sm me-3 border-radius-lg" alt="user1">
                    </div>
                    <div class="d-flex flex-column justify-content-center">
                        <h6 class="mb-0 text-sm"><%#Eval("UserName")%></h6>
                        <p class="text-xs text-secondary mb-0"><%#Eval("Email")%></p>
                    </div>
                </div>
            </td>
            <td class="align-middle text-center text-sm" visible="<%#Eval("Status") != null %>"> 
                    <span class="badge badge-sm bg-gradient-success">
                    Active
                    <asp:CheckBox ID="CheckBox1" Checked="true" runat="server" />
                    </span>

            </td>
            <td class="align-middle text-center text-sm" visible="<%#Eval("Status") == null %>">
                    <span class="badge badge-sm bg-gradient-secondary">
                    Active
                    <asp:CheckBox ID="CheckBox2" Checked="false" runat="server" />
                    </span>
                
            </td>
            <td class="align-middle text-center">
                <span class="text-secondary text-xs font-weight-bold"><%#Eval("CreateDate")%></span>
            </td>
            <td class="align-middle">
                <a href="javascript:;" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">
                    Edit
                </a>
            </td>
        </tr>
        </ItemTemplate>
        <FooterTemplate>
            </tbody>
          </table>
        </FooterTemplate>
        
</asp:Repeater>

</asp:Content>
