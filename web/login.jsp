<%-- 
    Document   : login
    Created on : Jun 1, 2022, 12:48:09 PM
    Author     : nguye
--%>

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
</head>

<body class="hold-transition login-page ">
  <div class="login-box">
    <!-- /.login-logo -->
    <div class="card card-outline card-primary">
      <div class="card-header text-center">
        <a href="index.html" class="h1"><b>DENTA</b>CARE</a>
      </div>
      <div class="card-body">
        <p class="login-box-msg">Đăng kí tài khoản cá nhân</p>

        <form action="MainController" method="POST">
          <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="Your email">
            <div class="input-group-append">
              <div class="input-group-text">
                <span class="fa fa-envelope"></span>
              </div>
            </div>
          </div>
          <div class="input-group mb-3">
            <input type="password" class="form-control" placeholder="Password">
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
              <button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>
            </div>
            <!-- /.col -->
          </div>
        </form>

        <div class="social-auth-links text-center mt-2 mb-3">
          <a href="#" class="btn btn-block btn-danger">
            <i class="fa fa-google"></i> Đăng nhập với Google
          </a>
        </div>
        <p class="mb-0">
          <a href="register.html" class="text-center">Đăng kí tài khoản</a>
        </p>
      </div>
      <!-- /.card-body -->
    </div>
    <!-- /.card -->
  </div>
  <!-- /.login-box -->

  <!-- jQuery -->
  <script src="js/js/jquery.min.js"></script>
  <!-- Bootstrap 4 -->
  <script src="js/js/bootstrap.bundle.min.js"></script>
  <script src="js/adminlte.min.js"></script>
</body>

</html>
