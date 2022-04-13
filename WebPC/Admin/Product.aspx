<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="WebPC.Admin.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .vl {
            border-bottom: 1px solid #e43270;
            width: 100%;
            margin: 5px 0px;
        }
        .btn-add {
            margin-top: 80px;
        }
        .image-thumnail {
            width: 100%;
            height: 100%;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="vl"></div>

    <div class="row g-7">
      <div class="col-auto">
        <label for="labelTenDanhMuc">Danh Mục</label>
          <asp:DropDownList ID="ddlCategory" class="form-control" runat="server"></asp:DropDownList>

        <label for="labelTenSP">Tên Sản Phẩm</label>
        <asp:TextBox ID="txtName" class="form-control" runat="server"></asp:TextBox>        
      </div>

      <div class="col-auto">
        <label >Giá Bán</label>
        <asp:TextBox ID="txtPrice" class="form-control" runat="server" Text="0"></asp:TextBox>
        <label >Mô Tả</label>
          
        <asp:TextBox ID="txtContent" class="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
      </div> 
     <div class="col-auto">
            <label >Giảm giá</label>
        <asp:TextBox ID="txtDiscount" class="form-control" runat="server" Text="0"></asp:TextBox>
            <label >Thông số kỹ thuật</label>
         <asp:TextBox ID="txtParameter" class="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
     </div>
        <div class="col-auto btn-add">
             <asp:Button ID="btnAdd" OnClick="btnAdd_Click" CssClass="btn btn-primary mb-3 btn-add" runat="server" Text="Add" />
            <asp:Button ID="btnUpdate" OnClick="btnUpdate_Click" runat="server" CssClass="btn btn-primary mb-3 btn-add" Text="Update" />
        </div>
    </div>

     <div class="col-auto">
        <label>Hình ảnh</label>
         <asp:TextBox ID="txtImage" Width="400px" class="form-control" runat="server"></asp:TextBox>
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
                    <th scope="col" style="width: 40px">ID</th>
                    <th scope="col" style="width: 100px">Image</th>
                    <th scope="col" style="width: 40px">Category</th>
                    <th scope="col" style="width: 100px">Name</th>
                    <th scope="col" style="width: 100px">Price</th>
                    <th scope="col" style="width: 100px">Discount</th>
                    <th scope="col" style="width: 100px">CreateDate</th>
                    <th scope="col" style="width: 40px">View</th>
                    <th scope="col" style="width: 80px"></th>
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

                      <td data-label="Image_link">
                          <img alt="IMAGE" class="image-thumnail" src='<%#Eval("Image_link") %>' />
                      </td>
                      <td data-label="Category_id"><%#Eval("Category_id") %></td>
                      <td data-label="Name"><%#Eval("Name") %></td>
                      <td data-label="Price"><%#Eval("Price") %></td>
                      <td data-label="Discount"><%#Eval("Discount") %></td>
                      <td data-label="Created">
                        <small class="text-gray-500"><%#Eval("CreateDate") %></small>
                      </td>
                      <td data-label="View">
                          <span class="material-icons">visibility</span>
                          <asp:Label ID="lbView" runat="server" Text='<%#Eval("View") %>'></asp:Label>
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
