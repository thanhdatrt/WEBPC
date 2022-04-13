<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="WebPC.Admin.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .vl {
            border-bottom: 1px solid #e43270;
            width: 100%;
            margin: 5px 0px;
        }

        .btn-add {
            margin-top: 18px;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="vl"></div>

    <div class="row g-4">
      <div class="col-auto">
        <label for="labelTenDanhMuc">Tên danh mục</label>
          <asp:TextBox ID="txtTendanhmuc" class="form-control" runat="server"></asp:TextBox>
      </div>

      <div class="col-auto">
        <label >Cấp danh mục</label>
        <asp:TextBox ID="txtCapdanhmuc" class="form-control" runat="server"></asp:TextBox>
      </div>
      <div class="col-auto">
        <label >Thứ tự sắp xếp</label>
        <asp:TextBox ID="txtSort" class="form-control" runat="server"></asp:TextBox>
      </div>
      <div class="col-auto">

        <asp:Button ID="btnAdd" OnClick="btnAdd_Click" CssClass="btn btn-primary mb-3 btn-add" runat="server" Text="Add" />

      </div>
        <div class="col-auto">
            <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-primary mb-3 btn-add" OnClick="btnUpdate_Click" Text="Update" />
        </div>
    </div>

    <div class="vl"></div>



   <div class="card has-table">
      <div class="card-content">
          <asp:Repeater ID="rptDS" runat="server" OnItemCommand="rptDS_ItemCommand" Visible="True">
            <HeaderTemplate> 
                <table>
                  <thead>
                  <tr>
                    <th scope="col" style="width: 40px" class="checkbox-cell">
                      <label class="checkbox">
                        <input type="checkbox">
                        <span class="check"></span>
                      </label>
                    </th>
                    <th scope="col" style="width: 100px">ID</th>
                    <th scope="col" style="width: 100px">Name</th>
                    <th scope="col" style="width: 100px">Parent ID</th>
                    <th scope="col" style="width: 100px">Sort Order</th>
                    <th scope="col" style="width: 200px">Created</th>
                    <th></th>
                  </tr>
                  </thead>
                  <tbody>
             </HeaderTemplate>
             <ItemTemplate> 
                    <tr>
                      <td class="checkbox-cell">
                        <label class="checkbox">
                          <input type="checkbox">
                          <span class="check"></span>
                        </label>
                      </td>
                      
                      <td data-label="id"> 
                          <asp:Label ID="lbID" runat="server" Text='<%#Eval("ID") %>'></asp:Label>
                      </td>

                      <td data-label="Name"><%#Eval("Name") %></td>
                      <td data-label="Parent"><%#Eval("Parent_id") %></td>
                      <td data-label="SortOrder"><%#Eval("Sort_order") %></td>
                      <td data-label="Created">
                        <small class="text-gray-500"><%#Eval("CreateDate") %></small>
                      </td>
                      <td class="actions-cell">
                        <div class="buttons right nowrap">
                  
                            <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" CssClass="button small green --jb-modal" runat="server">
                                <span class="material-icons-round">edit</span>
                                Edit
                            </asp:LinkButton>

                            <asp:LinkButton ID="LinkButton2" OnClick="LinkButton2_Click" CssClass="button small green --jb-modal" runat="server">
                                <span class="material-icons-round">delete</span>
                                Delete
                            </asp:LinkButton>

                        </div>
                      </td>
                    </tr>
                </ItemTemplate>

                <FooterTemplate>
                      </tbody>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        
      </div>
    </div>

</asp:Content>
