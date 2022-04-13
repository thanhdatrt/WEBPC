<%@ Page Title="Product" Language="C#" MasterPageFile="~/User/UserMasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebPC.User.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../Public/User/css/StyleProduct.css" rel="stylesheet" type="text/css" />

    <style>
        .group-paging {
            padding-top: 15px;
            padding-bottom: 25px;
        }

    </style>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
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

        <div runat="server" class="header-middle">
            <!--header-middle-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="logo pull-left">
                            <a href="Default.aspx"><img src="../Public/User/images/logopc.png" alt="" /></a>
                        </div>

                        <div class="btn-group pull-right">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
                                    VietNam
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a href="#">USA</a></li>
                                </ul>
                            </div>

                            <div class="btn-group">
                                <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
                                    VND
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a href="#">DOLLAR</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="shop-menu pull-right">
                            <ul class="nav navbar-nav">
                                <%  if (Session["allow"] == null)
                                {
                                %>
                                    <li>
                                        <a href="Profile.aspx"><i class="fa fa-user"></i> Tài khoản</a>
                                    </li>
                                    <li>
                                        <a href="Cart.aspx"><i class="fa fa-shopping-cart"></i> Giỏ hàng(<% Response.Write(Session["CountCart"].ToString()); %>)</a>
                                    </li>
                                    <li>
                                        <a href="Login.aspx"><i class="fa fa-lock"></i> Đăng nhập</a>
                                    </li>
                                <%}
                                else
                                { %>
                                     <li>
                                        <a href="Profile.aspx"><i class="fa fa-user"></i> <% Response.Write(Session["username"].ToString()); %></a>
                                    </li>
                                    <li>
                                        <a href="Cart.aspx"><i class="fa fa-shopping-cart"></i> Giỏ hàng(<% Response.Write(Session["CountCart"].ToString()); %>)</a>
                                    </li>
                                    <li>
                                        <a href="Logout.aspx"><i class="fa fa-sign-out" aria-hidden="true"></i> Thoát</a>
                                    </li>
                              <%} %>
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
                                  
                                </div>
                            </div>

                        </div>
                        <div class="col-sm-3">
                            <div runat="server" class="search_box pull-right">
                                <div class="box1">
                                  <div class="container-11">
                                      <input type="search" runat="server" id="search1" placeholder="Enter keywords..." />
                                      <asp:Button ID="Button5" CssClass="btnsearch1" OnClick="btnSearch_Click" runat="server" Text="Search" />
                                  </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/header-bottom-->
    </header>
    <!--/header-->

    <section id="slider">
        <!--slider-->
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div id="slider_element">
                        <ul id="slideWrap"> 
                          <li><img src="../Public/User/images/banner/banner1.jpg" alt=""></li>

                          <li><img src="../Public/User/images/banner/banner3.jpg" alt=""></li>

                          <li><img src="../Public/User/images/banner/banner4.jpg" alt=""></li>
                         
                        </ul>
                        <a id="prev" href="#">&#8810;</a>
                        <a id="next" href="#">&#8811;</a>
                     </div>

                </div>
            </div>
        </div>
    </section>
    <!--/slider-->

    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="left-sidebar">
                        <h2>BỘ LỌC TÌM KIẾM</h2>
                        <div class="panel-group category-products" id="accordian">
                            <!--category-productsr-->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordian" href="#sportswear">
                                            <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                            Sportswear
                                        </a>
                                    </h4>
                                </div>
                                <div id="sportswear" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul>
                                            <li><a href="#">Nike </a></li>
                                            <li><a href="#">Under Armour </a></li>
                                            <li><a href="#">Adidas </a></li>
                                            <li><a href="#">Puma</a></li>
                                            <li><a href="#">ASICS </a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordian" href="#mens">
                                            <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                            Mens
                                        </a>
                                    </h4>
                                </div>
                                <div id="mens" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul>
                                            <li><a href="#">Fendi</a></li>
                                            <li><a href="#">Guess</a></li>
                                            <li><a href="#">Valentino</a></li>
                                            <li><a href="#">Dior</a></li>
                                            <li><a href="#">Versace</a></li>
                                            <li><a href="#">Armani</a></li>
                                            <li><a href="#">Prada</a></li>
                                            <li><a href="#">Dolce and Gabbana</a></li>
                                            <li><a href="#">Chanel</a></li>
                                            <li><a href="#">Gucci</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordian" href="#womens">
                                            <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                            Womens
                                        </a>
                                    </h4>
                                </div>
                                <div id="womens" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul>
                                            <li><a href="#">Fendi</a></li>
                                            <li><a href="#">Guess</a></li>
                                            <li><a href="#">Valentino</a></li>
                                            <li><a href="#">Dior</a></li>
                                            <li><a href="#">Versace</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title"><a href="#">Kids</a></h4>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title"><a href="#">Fashion</a></h4>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title"><a href="#">Households</a></h4>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title"><a href="#">Interiors</a></h4>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title"><a href="#">Clothing</a></h4>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title"><a href="#">Bags</a></h4>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title"><a href="#">Shoes</a></h4>
                                </div>
                            </div>
                        </div>
                        <!--/category-products-->

                        <div class="brands_products">
                            <!--brands_products-->
                            <h2>Brands</h2>
                            <div class="brands-name">
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="#"> <span class="pull-right">(50)</span>Acne</a>
                                    </li>
                                    <li><a href="#"> <span class="pull-right">(56)</span>Grüne
                                            Erde</a></li>
                                    <li><a href="#"> <span class="pull-right">(27)</span>Albiro</a>
                                    </li>
                                    <li><a href="#"> <span class="pull-right">(32)</span>Ronhill</a>
                                    </li>
                                    <li><a href="#"> <span class="pull-right">(5)</span>Oddmolly</a>
                                    </li>
                                    <li><a href="#"> <span class="pull-right">(9)</span>Boudestijn</a></li>
                                    <li><a href="#"> <span class="pull-right">(4)</span>Rösch
                                            creative culture</a></li>
                                </ul>
                            </div>
                        </div>
                        <!--/brands_products-->

                        <!--price-range-->
                        <div class="price-range">
                            <h2>Price Range</h2>
                            <div class="well text-center">
                                <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5"
                                    data-slider-value="[250,450]" id="sl2"><br />
                                <b class="pull-left">$ 0</b> <b class="pull-right">$ 600</b>
                            </div>
                        </div>
                        <!--/price-range-->

                    </div>
                </div>

                <div class="col-sm-9 padding-right">

					<asp:DataList ID="ListProduct" OnItemCommand="ListProduct_ItemCommand" runat="server" RepeatColumns="2">
                        <ItemTemplate>
            
                                <figure class="card card-product-grid pdleft card-lg"> <a href="#" class="img-wrap" data-abc="true"><img src='<%#Eval("Image_link") %>'></a>
                            
                                    <table>
                                        <tr>
                                            <td>
                                                <div class="row">
                                                    <div class="col-md-12"> <a href="#" class="title" data-abc="true"><%#Eval("Name") %></a> </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                 <div class="bottom-wrap"> 
                                                    <div class="price-wrap"> 
                                                        <span class="price h5"><%#Eval("Price") %></span> <br> 
                                                        <small class="text-success">Sản Phẩm chính hãng</small> 
                                                    </div>
                                    
                                                     <asp:LinkButton ID="btnDetail"  OnClick="btnDetail_Click" CssClass="btn btn-primary float-right" runat="server" CommandName="Detail" CommandArgument='<%#Eval("ID") %>'>
                                                         <span class="material-icons-round">info</span>
                                                         Chi Tiết
                                                     </asp:LinkButton>
                                                     <asp:LinkButton ID="btnAddToCard" CssClass="btn btn-primary float-right" runat="server" CommandName="AddToCart" CommandArgument='<%#Eval("ID") %>'>
                                                         <span class="material-icons-round">add_shopping_cart</span>
                                                         Thêm Vào Giỏ hàng
                                                     </asp:LinkButton>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>

                                </figure>
            
                        </ItemTemplate>
                    </asp:DataList>


    
    
                    <div class="row text-center group-paging">
                        <asp:Button ID="Button1" CssClass="btn-danger btn-sm" runat="server" OnClick="Button1_Click" Text="<<" />
                        <asp:Button ID="Button2" CssClass="btn-danger btn-sm" runat="server" OnClick="Button2_Click" Text="<" />
                        <asp:Button ID="Button3" CssClass="btn-danger btn-sm" runat="server" OnClick="Button3_Click" Text=">" />
                        <asp:Button ID="Button4" CssClass="btn-danger btn-sm" runat="server" OnClick="Button4_Click" Text=">>" />
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

</asp:Content>
