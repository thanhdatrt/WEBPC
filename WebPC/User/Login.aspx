<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebPC.User.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LogIn</title>
    
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/all.css'/>
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/fontawesome.css'/>
    <link rel="stylesheet" href="../Public/Admin/css/StyleAdminLogin.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="overlay">
                <div class="form">
                   <!--   con = Container  for items in the form-->
                   <div class="con">
                   <!--     Start  header Content  -->
                   <header class="head-form">
                      <h2>Log In</h2>
                      <!--     A welcome message or an explanation of the login form -->
                      <p>login here using your username and password</p>
                   </header>
                   <!--     End  header Content  -->
                   <br/>

                   <div class="field-set">
     
                      <!--   user name -->
                         <span class="input-item">
                           <i class="fa fa-user-circle"></i>
                         </span>
                        <!--   user name Input-->
                         <input class="form-input" autocomplete="off" runat="server" id="txtusername" type="text" placeholder="@UserName" required />
     
                      <br/>
     
                           <!--   Password -->
     
                      <span class="input-item">
                        <i class="fa fa-key"></i>
                       </span>
                      <!--   Password Input-->
                      <input class="form-input"  autocomplete="off" runat="server" type="password" placeholder="Password" id="pwd"  name="password" required/>
     
                <!--      Show/hide password  -->
                     <span>
                        <i class="fa fa-eye" aria-hidden="true"  type="button" id="eye"></i>
                     </span>
     
                      <br />
                       <asp:Label ID="errorMessage" CssClass="alert-danger" runat="server" Text=""></asp:Label>
                      <br/>
                <!--        buttons -->
                <!--      button LogIn -->
                       <asp:Button ID="btnLogin" OnClick="btnLogin_Click" class="button log-in" runat="server" Text="LogIn" />
                   </div>
  
                <!--   other buttons -->
                   <div class="other">
                <!--      Forgot Password button-->
                      <button class="btn button submits frgt-pass">Forgot Password</button>
                <!--     Sign Up button -->
                       <asp:LinkButton ID="btnSignup" OnClick="btnSignup_Click" class="btn button submits sign-up" runat="server">
                           Sign Up
                           <i class="fa fa-user-plus" aria-hidden="true"></i>
                       </asp:LinkButton>
                <!--      End Other the Division -->
                   </div>
     
                <!--   End Conrainer  -->
                  </div>
                </div>
            </div>
        </div>
    </form>

	<script>
        function show() {
            var p = document.getElementById('pwd');
            p.setAttribute('type', 'text');
        }

        function hide() {
            var p = document.getElementById('pwd');
            p.setAttribute('type', 'password');
        }

        var pwShown = 0;

        document.getElementById("eye").addEventListener("click", function () {
            if (pwShown == 0) {
                pwShown = 1;
                show();
            } else {
                pwShown = 0;
                hide();
            }
        }, false);

    </script>
</body>
</html>
