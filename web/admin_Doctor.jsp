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
        <title>Admin Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">

        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">

        <link rel="stylesheet" href="css/aos.css">

        <link rel="stylesheet" href="css/ionicons.min.css">

        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/jquery.timepicker.css">


        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
        <style>
            #toast-msg{
                position: absolute;
                right: 10px;
                top:10px;
                z-index: 100;
                width: 240px;
                background-color: rgb(231,210,14);
                display: block;
                border-radius:10px;
                text-align: center;
                
            }
            
            #toast-msg strong{
                color: red;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="index.html">Denta<span>Care</span></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                        aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item dropdown"><a href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                                         aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle">Quang</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a href="" class="dropdown-item nav-link text-primary text-center">Đăng xuất</a>
                                <a href="admin_Account.html" class="dropdown-item nav-link text-primary text-center">Hồ sơ cá nhân</a>
                            </div>
                        </li>
                        <li class="nav-item "><a href="admin_Service.jsp" class="nav-link">Dịch vụ</a></li>
                        <li class="nav-item "><a href="admin_User.html" class="nav-link">User</a></li>
                        <li class="nav-item"><a href="admin_Feedback.html" class="nav-link">FeedBack</a></li>
                        <li class="nav-item active"><a href="#" class="nav-link">Bác sĩ</a></li>
                        <li class="nav-item"><a href="admin_Booking.html" class="nav-link">Booking</a></li>
                        <li class="nav-item"><a href="admin_Discount.html" class="nav-link">Khuyến mãi</a></li>
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
        <div id="toast-msg" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header1">
                <strong class="mr-auto1">Thông báo</strong>
                <small></small>
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

        <section class="ftco-section contact-section ftco-degree-bg">
            <div class="container">

                <div class="col-md-5 pr-md-5">
                    <div>
                        <h3 class="text-primary">Danh sách bác sĩ:</h3>
                    </div>
                </div>
                <div class="col-md-5">
                    <form action="SearchDoctorController">
                    <input type="search" name="fullName">
                    <input type="submit">
                </form>
                </div>
                
                
                <div class="col-md-9">
                    <form action="">
                        <div class="card-body">
                            <%
                                List<doctors.DoctorDTO> listSearchDoctor  = (List<DoctorDTO>) session.getAttribute("SEARCH_DOCTOR");
                                if(listSearchDoctor!=null){
                                List<doctors.DoctorDTO> listDoctor=listSearchDoctor;                           
                                %>
                            <table id="table_id" class="table table-bordered table-hover text-align-center">
                                <thead class="bg-light align-content-center">
                                    <tr>
                                        <th>Bác sĩ ID</th>
                                        <th class="col-md-2">Chuyên khoa</th>
                                        <th>Họ Tên</th>
                                        <th>Email</th>                                     
                                        <th>Link ảnh</th>
                                        <th>Điện thoại</th>
                                        <th>Trạng thái</th>
                                        <th>Gender</th>
                                        <th>Ngày làm việc</th>
                                        <th>Update </th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>

                                <tbody class="align-content-around">
                                    <%
                                        int count = 1;
                                        for (DoctorDTO doctor : listDoctor) {
                                    %>
                                <form action="UpdateDoctor_Admin" >
                                    <tr>
                                        <td><input type="text" name="id" value="<%=doctor.getDoctorID()%>" readonly ></td>
                                        <td><input type="text" name="serviceTypeName" value="<%=doctor.getServiceTypeName()%>"></td>
                                        <td><input type="text" name="fullName" value="<%=doctor.getFullName()%>" readonly ></td>
                                        <td><input type="text" name="gmail" value="<%=doctor.getGmail()%>" readonly ></td>                                  
                                        <td><input type="text" name="image" value="<%=doctor.getImage()%>" readonly ></td>
                                        <td><input type="text" name="phone" value="0<%=doctor.getPhone()%>" readonly ></td>
                                        <td>  
                                            <input type="text" name="status" value="<%if (doctor.getStatus() == 1) {%>Làm việc<%} else {%>Đã nghĩ việc<%}%>" readonly>
                                        </td> 
                                        <td><input type="text" name="gender" value="<%=doctor.getGender()%>" readonly /></td>
                                        <td><select id="workDayID" name="workDayID" class="form-select form-select-sm" aria-label=".form-select-sm example">
                                                <option selected value="<%=doctor.getWorkDayID()%>"><%if (doctor.getWorkDayID() == 2) {%>2, 4, 6<%} else {%>3, 5, 7<%}%></option>
                                                <option value="<%=Math.abs(doctor.getWorkDayID() - 3)%>"><%if (doctor.getWorkDayID() == 2) {%>3, 5, 7<%} else {%>2, 4, 6<%}%></option>
                                        </td>
                                        <td><input type="submit" name="action" value="Update Doctor"></td>
                                        <td><a href="DeleteDoctorController?doctorID=<%=doctor.getDoctorID()%>">Xóa bác sĩ</a></td>
                                    </tr>
                                </form>
                                </tbody>
                                <%
                                    }
                                %>
                            </table>
                            
                            <!<!-- ELSE SECTION --> 
                            
                            <%
                                }else{
                                 List<doctors.DoctorDTO> listDoctor = (List<DoctorDTO>) session.getAttribute("LIST_DOCTOR");
                                if (listDoctor != null) {
                                    if (!listDoctor.isEmpty()) {
                                }
                       
                            %>
                            <table id="table_id" class="table table-bordered table-hover text-align-center">
                                <thead class="bg-light align-content-center">
                                    <tr>
                                        <th>Bác sĩ ID</th>
                                        <th class="col-md-2">Chuyên khoa</th>
                                        <th>Họ Tên</th>
                                        <th>Email</th>                                     
                                        <th>Link ảnh</th>
                                        <th>Điện thoại</th>
                                        <th>Trạng thái</th>
                                        <th>Gender</th>
                                        <th>Ngày làm việc</th>
                                        <th>Update </th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>

                                <tbody class="align-content-around">
                                    <%
                                        int count = 1;
                                        for (DoctorDTO doctor : listDoctor) {
                                    %>
                                <form action="UpdateDoctor_Admin" >
                                    <tr>
                                        <td><input type="text" name="id" value="<%=doctor.getDoctorID()%>" readonly ></td>
                                        <td><input type="text" name="serviceTypeName" value="<%=doctor.getServiceTypeName()%>"></td>
                                        <td><input type="text" name="fullName" value="<%=doctor.getFullName()%>" readonly ></td>
                                        <td><input type="text" name="gmail" value="<%=doctor.getGmail()%>" readonly ></td>                                  
                                        <td><input type="text" name="image" value="<%=doctor.getImage()%>" readonly ></td>
                                        <td><input type="text" name="phone" value="0<%=doctor.getPhone()%>" readonly ></td>
                                        <td>  
                                            <input type="text" name="status" value="<%if (doctor.getStatus() == 1) {%>Làm việc<%} else {%>Đã nghĩ việc<%}%>" readonly>
                                        </td> 
                                        <td><input type="text" name="gender" value="<%=doctor.getGender()%>" readonly /></td>
                                        <td><select id="workDayID" name="workDayID" class="form-select form-select-sm" aria-label=".form-select-sm example">
                                                <option selected value="<%=doctor.getWorkDayID()%>"><%if (doctor.getWorkDayID() == 2) {%>2, 4, 6<%} else {%>3, 5, 7<%}%></option>
                                                <option value="<%=Math.abs(doctor.getWorkDayID() - 3)%>"><%if (doctor.getWorkDayID() == 2) {%>3, 5, 7<%} else {%>2, 4, 6<%}%></option>
                                        </td>
                                        <td><input type="submit" name="action" value="Update Doctor"></td>
                                        <td><a href="DeleteDoctorController?doctorID=<%=doctor.getDoctorID()%>">Xóa bác sĩ</a></td>
                                    </tr>
                                </form>
                                </tbody>
                                <%
                                    }
                                %>
                            </table>
                            <%
                                    }
                                }
                            %>
                        </div>
                        <!-- /.card-body -->
                    </form>
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
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
    <script src="js/jquery.animateNumber.min.js"></script>
    <script src="js/bootstrap-datepicker.js"></script>
    <script src="js/jquery.timepicker.min.js"></script>
    <script src="js/scrollax.min.js"></script>
    <script src="js/main.js"></script>
    <script>
   
                            function toastClose(){
                                var toast1= document.getElementById("toast-msg");
                                toast1.style.display ="none";
                            }
    </script>
</body>
</html>
