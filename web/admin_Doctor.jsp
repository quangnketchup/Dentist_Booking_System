<%@page import="admins.AdminDTO"%>
<%@page import="serviceTypes.ServiceTypeDTO"%>
<%@ page import="java.util.List" %>
<%@ page import="java.lang.Math" %>
<%@ page import="doctors.DoctorDTO" %><%--
  Created by IntelliJ IDEA.
  User: Doan
  Date: 6/4/2022
  Time: 11:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel='shortcut icon' href="images/logo-icon.png" />
        <title>Admin Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700" rel="stylesheet">
        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/aos.css">
        <link rel="stylesheet" href="css/ionicons.min.css">
        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/jquery.timepicker.css">
        <link rel="stylesheet" href="css/menu.css">
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
        <style>
            #toast-msg{
                position: fixed;
                padding-left: 10px;
                right: 10px;
                top:80px;
                z-index: 100;
                width: 210px;
                background-color: #28a745;
                border-bottom-left-radius:10px;
                border-top-left-radius: 10px;
                border-bottom-right-radius: 10px;
                text-align: left;
                color:white;
                font-size: 18px;
                animation: slideInleft ease .3s, fadeOut linear 1s 3s forwards;
            }
            
            @keyframes slideInleft {
                
                from{
                    opacity: 0;
                    transform: translateX(calc(100%+40px));
                    
                }
                to{
                    opacity: 1;
                    transform: translateX(0);
                }
            }
            
            @keyframes fadeOut{
                to{
                    opacity: 0;
                    
                }
            }
            
            #toast-close{
                color: white;
                width: 240px;
                background-color: rgb(231,210,14);
                display: block;
            }

            #toast-msg strong{
                color: white;
                font-size: 15px;

            }
        </style>
    </head>
    <body>


        <% List<ServiceTypeDTO> listServiceType = (List<ServiceTypeDTO>) session.getAttribute("LIST_SERVICE_TYPE");%>
        <%
            
            AdminDTO login = (AdminDTO) session.getAttribute("LOGIN_USER");
        %>
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="home.jsp">Denta<span>Care</span></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                        aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item dropdown"><a href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                                         aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle"><%=((AdminDTO) session.getAttribute("LOGIN_ADMIN")).getFullName()%></a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a href="LogoutController" class="dropdown-item nav-link text-primary text-center">Đăng xuất</a>
                                <a href="admin_Account.jsp" class="dropdown-item nav-link text-primary text-center">Hồ sơ cá nhân</a>
                            </div>
                        </li>
                        <li class="nav-item "><a href="admin_Service.jsp" class="nav-link sa">Dịch vụ</a></li>
                        <li class="nav-item "><a href="admin_User.jsp" class="nav-link sa">User</a></li>
                        <li class="nav-item"><a href="admin_Feedback.html" class="nav-link sa">FeedBack</a></li>
                        <li class="nav-item active"><a href="#" class="nav-link sa">Bác sĩ</a></li>
                        <li class="nav-item"><a href="admin_Booking.html" class="nav-link sa">Booking</a></li>
                        <li class="nav-item"><a href="admin_Discount.html" class="nav-link sa">Khuyến mãi</a></li>

                    </ul>
                </div>
            </div>
        </nav>
        <!-- END nav -->

        <%
            String error = (String) session.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <%=error%>

        <!<!-- Toast thông báo succeed update -->

        <%
            String msg = (String) request.getAttribute("SSMSG");
            if (msg == null) {
                msg = "";
            } else {
        %>
        <div id="toast-msg" role="alert" aria-live="assertive" aria-atomic="true"">
            <div class="toast-header1">
                <strong class="mr-auto1">Thông báo <i class="fa fa-bell"></i></strong>

                <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close" onClick="toastClose()">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="toast-body1">
                <%=msg%>
            </div>
        </div>

        <%}%>

        <section class="home-slider owl-carousel">
            <div class="slider-item bread-item" style="background-image: url('images/bg_1.jpg');"
                 data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
            </div>
        </section>

        <!--Modal hiện form tạo bác sĩ-->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel" style="color:#2f89fc">Add New Doctor</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="AddDoctorController" method="GET">
                        <div class="modal-body">
                            <div class="register-box">
                                <div class="input-group mb-3">
                                    <input name="fullName" type="text" class="form-control" placeholder="Họ tên">
                                </div>
                                <div class="input-group mb-3">
                                    <input name="email" type="email" class="form-control" placeholder="Email" required="">
                                </div>
                                <div class="input-group mb-3">
                                    <input name="password" type="password" class="form-control" placeholder="Mật khẩu">
                                </div>
                                <div class="input-group mb-3">
                                    <label for="serviceTypeName">Chuyên khoa</label>
                                    <select name="serviceTypeName">
                                        <% for (ServiceTypeDTO svTypeDTO : listServiceType) {%>                                
                                        <option value="<%=svTypeDTO.getServiceTypeID()%>"><%=svTypeDTO.getServiceTypeName()%></option> 
                                        <%}%>
                                    </select>
                                </div>
                                <div class="input-group mb-3">
                                    <label for="gender" value="">Giới tính</label>
                                    <select name="gender">
                                        <option value="Female">Nữ</option>
                                        <option value="Male">Nam</option>
                                    </select>
                                </div>
                                <div class="input-group mb-3">
                                    <label value="">Lịch làm việc</label>
                                    <select name="workDayID">
                                        <option value="2">2, 4, 6</option>
                                        <option value="3">3, 5, 7</option>       
                                    </select>
                                </div>
                                <label for ="phone">Số điện thoại</label>
                                <div class="input-group mb-3">
                                    <input name="phone" type="text">
                                </div>
                            </div><!-- /.card -->
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <input type="submit" value="Add Doctor" class="btn btn-primary">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <section class="ftco-section ">
            <div class="container-fluid">
                <div class="col-md-3 offset-1">
                    <div>
                        <h3 class="text-primary"><strong>Quản lí bác sĩ:</strong></h3>
                    </div>
                </div>
                <div class="col-10 offset-1">
                    <div class="btn-group">
                        <form action="SearchDoctorController">
                            <input type="search" style="width: 350px" class="form" name="fullName">
                            <input class="btn" style="background: #2f89fc; color: white; margin-right: 5px " type="submit" value="Tìm kiếm bác sĩ">
                        </form>
                        <button class="btn btn-success" data-toggle="modal" data-target="#exampleModal" style="border-radius: 50px; position: absolute; left: 1230px; "><i class="fa fa-plus"></i></button>
                    </div>
                    
                </div>

                <!-- Search bac si theo ten -->

                <div class="col-md-12 mt-2">
                    <div class="card-body">
                        <%
                            List<doctors.DoctorDTO> listSearchDoctor = (List<DoctorDTO>) request.getAttribute("SEARCH_DOCTOR");
                            if (listSearchDoctor != null) {
                                List<doctors.DoctorDTO> listDoctor = listSearchDoctor;
                        %>
                        <table id="table_id" class="table table-bordered table-hover text-align-center">
                            <thead class="bg-light align-content-center">
                                <tr>
                                    <th>Bác Sĩ ID</th>
                                    <th>Chuyên Khoa</th>
                                    <th>Họ Tên</th>
                                    <th>Email</th>                                     
                                    <th>Link Ảnh</th>
                                    <th>Điện Thoại</th>
                                    <th>Trạng Thái</th>
                                    <th>Giới Tính</th>
                                    <th>Ngày Làm Việc</th>
                                    <th>Chỉnh sữa thông tin bác sĩ</th>
                                </tr>
                            </thead>

                            <tbody class="align-content-around">
                                <%
                                    int count = 1;
                                    for (DoctorDTO doctor : listDoctor) {
                                %>

                            <form action="UpdateDoctor_Admin">
                                <tr>
                                    <td><input type="text" name="id" value="<%=doctor.getDoctorID()%>" class="form-control-plaintext" readonly ></td>
                                    <td>
                                        <select name="serviceTypeName">
                                            <option selected  value="<%=doctor.getServiceTypeName()%>"><%=doctor.getServiceTypeName()%></option>
                                            <% for (ServiceTypeDTO svTypeDTO : listServiceType) {
                                                    if (!svTypeDTO.getServiceTypeName().equals(doctor.getServiceTypeName())) {
                                            %>
                                            <option value="<%=svTypeDTO.getServiceTypeName()%>"><%=svTypeDTO.getServiceTypeName()%></option>
                                            <%}
                                                }%>
                                        </select>
                                    </td>
                                    <td><input type="text" name="fullName" value="<%=doctor.getFullName()%>" class="form-control-plaintext" readonly ></td>
                                    <td><input type="text" name="gmail" value="<%=doctor.getGmail()%>" class="form-control-plaintext" readonly ></td>                                  
                                    <td><input type="text" name="image" value="<%=doctor.getImage()%>" class="form-control-plaintext" readonly ></td>
                                    <td><input type="text" name="phone" value="0<%=doctor.getPhone()%>" class="form-control-plaintext" readonly ></td>
                                    <td>  
                                        <select id="status" name="status" class="form-select form-select-sm" aria-label=".form-select-sm example">
                                            <option selected value="<%=doctor.getStatus()%>"><%if (doctor.getStatus() == 1) {%>Đang làm việc<%} else {%>Đã nghỉ việc<%}%></option>
                                            <option value="<%=Math.abs(doctor.getStatus() - 1)%>"><%if (doctor.getStatus() == 1) {%>Đã nghỉ việc<%} else {%>Đang làm việc<%}%></option>
                                        </select>
                                    </td> 
                                    <td><input type="text" name="gender" value="<%=doctor.getGender()%>" class="form-control-plaintext" readonly /></td>

                                    <td><select id="workDayID" name="workDayID" class="form-select form-select-sm" aria-label=".form-select-sm example">
                                            <option selected value="<%=doctor.getWorkDayID()%>"><%if (doctor.getWorkDayID() == 2) {%>2, 4, 6<%} else {%>3, 5, 7<%}%></option>
                                            <option value="<%=Math.abs(doctor.getWorkDayID() - 3)%>"><%if (doctor.getWorkDayID() == 2) {%>3, 5, 7<%} else {%>2, 4, 6<%}%></option>
                                        </select>
                                    </td>
                                    <td><input type="submit" class="btn btn-block btn-outline-success" name="action" value="Update Doctor"></td>

                                </tr>
                            </form>
                            <%
                                }
                            %>
                            </tbody>
                        </table>

                        <!<!-- ELSE SECTION --> 

                        <%
                        } else {
                            List<doctors.DoctorDTO> listDoctor = (List<DoctorDTO>) session.getAttribute("LIST_DOCTOR");
                            if (listDoctor != null) {
                                if (!listDoctor.isEmpty()) {
                                }

                        %>
                        <table id="table_id" class="table table-bordered table-hover text-align-center">
                            <thead class="bg-light align-content-center">
                                <tr>
                                    <th>Bác Sĩ ID</th>
                                    <th>Chuyên Khoa</th>
                                    <th>Họ Tên</th>
                                    <th>Email</th>                                     
                                    <th>Link Ảnh</th>
                                    <th>Điện Thoại</th>
                                    <th>Trạng Thái</th>
                                    <th>Giới Tính</th>
                                    <th>Ngày Làm Việc</th>
                                    <th>Chỉnh sữa thông tin bác sĩ</th>
                                </tr>
                            </thead>

                            <tbody class="align-content-around">
                                <%                                    int count = 1;
                                    for (DoctorDTO doctor : listDoctor) {
                                %>


                            <form action="UpdateDoctor_Admin" method="POST">
                                <tr>
                                    <td><input type="text" name="id" value="<%=doctor.getDoctorID()%>" class="form-control-plaintext" readonly ></td>
                                    <td>
                                        <select name="serviceTypeName">
                                            <option selected  value="<%=doctor.getServiceTypeName()%>"><%=doctor.getServiceTypeName()%></option>
                                            <% for (ServiceTypeDTO svTypeDTO : listServiceType) {
                                                    if (!svTypeDTO.getServiceTypeName().equals(doctor.getServiceTypeName())) {
                                            %>
                                            <option value="<%=svTypeDTO.getServiceTypeName()%>" ><%=svTypeDTO.getServiceTypeName()%></option>
                                            <%}
                                                }%>
                                        </select>
                                    </td>
                                    <td><input type="text" name="fullName" value="<%=doctor.getFullName()%>" class="form-control-plaintext" readonly ></td>
                                    <td><input type="text" name="gmail" value="<%=doctor.getGmail()%>" class="form-control-plaintext" readonly ></td>                                  
                                    <td><input type="text" name="image" value="<%=doctor.getImage()%>" class="form-control-plaintext" readonly ></td>
                                    <td><input type="text" name="phone" value="0<%=doctor.getPhone()%>" class="form-control-plaintext" readonly ></td>
                                    <td>  
                                        <select id="status" name="status" class="form-select form-select-sm" aria-label=".form-select-sm example">
                                            <option selected value="<%=doctor.getStatus()%>"><%if (doctor.getStatus() == 1) {%>Đang làm việc<%} else {%>Đã nghỉ việc<%}%></option>
                                            <option value="<%=Math.abs(doctor.getStatus() - 1)%>"><%if (doctor.getStatus() == 1) {%>Đã nghỉ việc<%} else {%>Đang làm việc<%}%></option>
                                        </select>
                                    </td> 
                                    <td><input type="text" name="gender" value="<%=doctor.getGender()%>" class="form-control-plaintext" readonly ></td>

                                    <td><select id="workDayID" name="workDayID" class="form-select form-select-sm" aria-label=".form-select-sm example">
                                            <option selected value="<%=doctor.getWorkDayID()%>"><%if (doctor.getWorkDayID() == 2) {%>2, 4, 6<%} else {%>3, 5, 7<%}%></option>
                                            <option value="<%=Math.abs(doctor.getWorkDayID() - 3)%>"><%if (doctor.getWorkDayID() == 2) {%>3, 5, 7<%} else {%>2, 4, 6<%}%></option>
                                        </select>
                                    </td>
                                    <td><input type="submit" class="btn btn-block btn-outline-success" name="action" value="Update Doctor"></td>

                                </tr>
                            </form>
                            <%
                                }
                            %>
                            </tbody>

                        </table>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>

            </div>
        </section>

        <footer class="ftco-footer ftco-bg-dark ftco-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <p>Copyright &copy;
                            <script>document.write(new Date().getFullYear());</script> All rights reserved </a>
                        </p>
                    </div>
                </div>
            </div>
        </footer>

        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
            <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
            <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                    stroke="#F96D00" />
            </svg></div>

        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-migrate-3.0.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/jquery.waypoints.min.js"></script>
        <script src="js/jquery.stellar.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/jquery.animateNumber.min.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/jquery.timepicker.min.js"></script>
        <script src="js/scrollax.min.js"></script>
        <script src="js/main.js"></script>
        <script>    const check = ()=>{alert('hello')}
                                                    
                                function toastClose() {
                                    var toast1 = document.getElementById("toast-msg");
                                    toast1.style.display = "none";  
                                }
        </script>
    </body>
</html>
