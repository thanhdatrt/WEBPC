<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="WebPC.User.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SignUp</title>
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/all.css'/>
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/fontawesome.css'/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>

    <link rel="stylesheet" href="../Public/Admin/css/StyleAdminLogin.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="overlay">
                <div class="form">
                   <!--   con = Container  for items in the form-->
                   <div class="con">
                   <!--     Start  header Content  -->
                   <header class="head-form">
                      <h2>Sign Up</h2>
                      <!--     A welcome message or an explanation of the login form -->
                      <p>SignUp here using your username and password</p>
                   </header>
                   <!--     End  header Content  -->
                   <br/>

                   <div class="field-set">
     
                      <!--   user name -->
                         <span class="input-item">
                           <i class="fa fa-user-circle"></i>
                         </span>
                        <!--   user name Input-->
                         <input class="form-input" autocomplete="off" runat="server" id="txtusername" type="text" placeholder="@UserName"/>
     
                        <br/>

                       <!--   name -->
                         <span class="input-item">
                           <i class="fas fa-envelope"></i>
                         </span>
                        <!--   user name Input-->
                         <input class="form-input" autocomplete="off" runat="server" id="txtemail" type="text" placeholder="Email"/>
     
                        <br/>
     
                           <!--   Password -->
     
                      <span class="input-item">
                        <i class="fa fa-key"></i>
                       </span>
                      <!--   Password Input-->
                      <input class="form-input" autocomplete="off" type="password" runat="server" placeholder="Password" id="pwd"  name="password" required/>
     
                        <!--      Show/hide password  -->
                     <span>
                        <i class="fa fa-eye" aria-hidden="true"  type="button" id="eye"></i>
                     </span>
     
                       <br/>
     
                           <!--  re-enter Password -->
     
                      <span class="input-item">
                        <i class="fa fa-key"></i>
                       </span>
                      <!--   Password Input-->
                      <input class="form-input" autocomplete="off" runat="server" type="password" placeholder="Retype Password" id="pwd1"  name="password" required/>
                       
                        <!--      Show/hide password  -->
                    
     
                      <br/>
                       
                       <asp:Label ID="lbwaining" CssClass="alert-danger message" runat="server" Text=""></asp:Label>
                      <br />
                           
                <!--        buttons -->
                <!--      button LogIn -->
                       <asp:Button ID="btnSignup" OnClick="btnSignup_Click" class="button log-in" runat="server" Text="Sign Up" />
                   </div>
  
                <!--   End Conrainer  -->
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
