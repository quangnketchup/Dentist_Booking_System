<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>DentaCare</title>

        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- <link rel="stylesheet" href="css/all.min.css"> -->
        <!-- icheck bootstrap -->
        <link rel="stylesheet" href="css/icheck-bootstrap.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="css/adminlte.min.css">
        <link rel="stylesheet" href="css/style.css">
        <meta name="google-signin-client_id" content="326210504580-9jhmvl00cg3sabr664sav1p87gsnf90g.apps.googleusercontent.com
">
    </head>

    <body class="hold-transition login-page"  style="background-image: url('images/login1.jpg');">
        <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v14.0&appId=560930585693096&autoLogAppEvents=1" nonce="nWftN8as"></script>
        <div class="login-box">
            <!-- /.login-logo -->
            <div class="card card-outline card-primary">
                <div class="card-header text-center">
                    <a href="home.jsp" class="h1"><b>DENTA</b>CARE</a>
                </div>
                <div class="card-body">
                    <p class="login-box-msg">Đăng kí tài khoản cá nhân</p>

                    <form action="MainController" method="POST">
                        <div class="input-group mb-3">
                            <input type="text" name="gmail" required="" class="form-control" placeholder="Your email">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fa fa-envelope"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <input type="password" name="password" required="" class="form-control" placeholder="Password">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fa fa-lock"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-7">
                                <div class="icheck-primary">
                                    <input type="checkbox" id="remember">
                                    <label for="remember">
                                        Ghi nhớ tài khoản đăng nhập
                                    </label>
                                </div>
                            </div>
                            <!-- /.col -->
                            <div class="col-5">
                                <button type="submit" name="action" value="Login" class="btn btn-primary btn-block">Đăng nhập</button>
                            </div>
                            <!-- /.col -->
                        </div>
                    </form>

                    <div class="g-signin2 social-auth-links text-center mt-2 mb-3" >
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/DentistBookingSystem/LoginGoogleController&response_type=code
		   &client_id=326210504580-9jhmvl00cg3sabr664sav1p87gsnf90g.apps.googleusercontent.com
&approval_prompt=force" class="btn btn-block btn-danger">
                            <i class="fa fa-google"></i> Đăng nhập với Google
                        </a>
                        <a class="btn btn-primary" href="https://www.facebook.com/dialog/oauth?client_id=560930585693096&redirect_uri=http://localhost:8080/DentistBookingSystem/LoginFaceBookController&scope=public_profile%2Cemail" class="social-button" id="facebook-connect"> <span>Login with Facebook</span></a>
                    </div>
                    <p class="mb-0">
                        <a href="register.jsp" class="text-center">Đăng kí tài khoản</a>
                    </p>
                    ${requestScope.ERROR}
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>
        <!-- /.login-box -->

        <!-- jQuery -->
        <!-- Login with fb -->
        
      
        
        <script src="js/js/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="js/js/bootstrap.bundle.min.js"></script>
        <script src="js/adminlte.min.js"></script>
       
        
    </body>

</html>
