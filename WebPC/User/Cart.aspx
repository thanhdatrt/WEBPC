<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="WebPC.User.Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cart</title>
    <link rel="apple-touch-icon" sizes="76x76" href="../Public/Admin/Images/apple-icon.png">
    <link rel="icon" type="image/png" href="../Public/Admin/Images/favicon.png">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link href="../Public/User/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="../Public/User/css/prettyPhoto.css" rel="stylesheet">
    <link href="../Public/User/css/price-range.css" rel="stylesheet">
    <link href="../Public/User/css/animate.css" rel="stylesheet">
    <link href="../Public/User/css/main.css" rel="stylesheet">
    <link href="../Public/User/css/responsive.css" rel="stylesheet">
    <style>
        .cart-shop {
            font-size: 50px;
            color: #be0318;
        }
    </style>
</head>
<body>
    <header id="header">
        <!--header-->
        <div class="header_top">
            <!--header_top-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-6"></div>
                    <div class="col-sm-6">
                        <div class="social-icons pull-right">
                            <ul class="nav navbar-nav">
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/header_top-->

        <div class="header-middle">
            <!--header-middle-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-8">
                        <div class="logo pull-left">
                            <a href="Default.aspx"><img src="../Public/User/images/logopc.png" alt="" />
                                <b class="cart-shop">| Giỏ hàng</b>
                            </a>
                            
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <div class="shop-menu pull-right">
                            <ul class="nav navbar-nav">
                                <li>
                                    <a href="#"><i class="fa fa-user"></i> Tài khoản</a>
                                </li>
                                <li>
                                    <a href="Cart.aspx"><i class="fa fa-shopping-cart"></i> Giỏ hàng</a>
                                </li>
                                <li>
                                    <a href="Login.aspx"><i class="fa fa-lock"></i> Đăng nhập</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/header-middle-->

        <div class="header-bottom">
            <!--header-bottom-->
            <div class="container">
                <div class="row">
                    <div>
                        <div class="col-sm-9">

                            <div class="dropdown">
                                <button class="dropbtn">
                                    <a href="#" style="color: #fff !important" class="icon-bar"><i style="color: #fff !important" class="fa fa-bars" aria-hidden="true"></i></a>
                                    Danh mục sản phẩm
                                </button>
                                <div class="dropdown-content">
                                  <a href="#">Link 1</a>
                                  <a href="#">Link 2</a>
                                  <a href="#">Link 3</a>
                                  <a href="#">Link 3</a>
                                  <a href="#">Link 3</a>
                                  <a href="#">Link 3</a>
                                  <a href="#">Link 3</a>
                                  <a href="#">Link 3</a>
                                  <a href="#">Link 3</a>
                                  <a href="#">Link 3</a>
                                </div>
                            </div>

                        </div>
                        <div class="col-sm-3">
                            <div class="search_box pull-right">
                                <input type="text" placeholder="Search" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/header-bottom-->
    </header>
    <!--/header-->

    

    <section>
        <div class="row">
            <div class="col-sm-12">
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
                                <th scope="col" style="width: 40px">S.No</th>
                                <th scope="col" style="width: 100px">ID</th>
                                <th scope="col" style="width: 100px">Name</th>
                                <th scope="col" style="width: 100px">Price</th>
                                <th scope="col" style="width: 100px">Image</th>
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
                                      <asp:Label ID="lbID" runat="server" Text='<%#Eval("sno") %>'></asp:Label>
                                  </td>

                                  <td data-label="Image_link">
                                      <img alt="IMAGE" class="image-thumnail" src='<%#Eval("ID") %>' />
                                  </td>
                                  
                                  <td data-label="Name"><%#Eval("Name") %></td>
                                  <td data-label="Price"><%#Eval("Price") %></td>
                                  <td data-label="Discount"><%#Eval("Image_link") %></td>

                                  <td class="actions-cell">
                                    <div class="buttons right nowrap">

                                        <asp:LinkButton ID="LinkButton2" CssClass="button small green --jb-modal" runat="server">
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
            </div>
          </div>
    </section>

    <footer id="footer">
        <!--Footer-->
        <div class="footer-bottom">
            <div class="container">
                <div class="row">
                    <p class="pull-center">Copyright © Thanh dat</p>
                    <p class="pull-right">Designed by <span></span></p>
                </div>
            </div>
        </div>
    </footer>
    <!--/Footer-->
</body>
</html>
