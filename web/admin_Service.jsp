<%@page import="serviceTypes.ServiceTypeDTO"%>
<%@page import="admins.AdminDTO"%>
<%@page import="services.ServiceDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%
            AdminDTO login = (AdminDTO) session.getAttribute("LOGIN_USER");
        %>
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="index.html">Denta<span>Care</span></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                        aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>
                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a class="nav-link"><%=((AdminDTO) session.getAttribute("LOGIN_USER")).getFullName()%></a></li>

                        <li class="nav-item active"><a href="#" class="nav-link">Dịch vụ</a></li>

                        <li class="nav-item"><a href="ShowServiceController" class="nav-link">Dịch vụ</a></li>

                        <li class="nav-item"><a href="admin_User.html" class="nav-link">Người dùng</a></li>
                        <li class="nav-item"><a href="#" class="nav-link">Phản hồi</a></li>
                        <li class="nav-item"><a href="ShowDoctorController" class="nav-link">Bác sĩ</a></li>
                        <li class="nav-item"><a href="#" class="nav-link">Đặt lịch</a></li>
                        <li class="nav-item"><a href="#" class="nav-link">Đăng xuất</a></li>
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

        <!-- Toast thông báo succeed update -->

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
            <!--service type theo service-->
            <div class="container-fluid">
                <div class="col-md-5 pr-md-5 mt-5">
                    <div class="dropright">
                        <button class="btn dropdown-toggle" style="background: #2f89fc; color: white; margin-right: 5px" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Loại Dịch Vụ
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                            <%
                                List<ServiceTypeDTO> listServiceType = (List<ServiceTypeDTO>) session.getAttribute("LIST_SERVICE_TYPE");
                                if (listServiceType != null) {
                                    for (ServiceTypeDTO svType : listServiceType) {
                            %>
                            <button class="dropdown-item" type="button"><a href="ServiceTypeController?serviceTypeID=<%=svType.getServiceTypeID()%>"><%=svType.getServiceTypeName()%></a></button>

                            <%
                                    }
                                }%>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container-fluid">
                <div class="col-md-5 pr-md-5">
                    <div>
                        <h3 class="text-primary">Quản lí dịch vụ:</h3>
                    </div>
                </div>
                <%List<ServiceDTO> listsvbySVType = (List<ServiceDTO>) session.getAttribute("LIST_SERVICE_BY_SVTYPE");
                    if (listsvbySVType != null) {
                        List<ServiceDTO> listService = listsvbySVType;
                %>
                <div class="col-md-12">
                    <div class="card card-body">
                        <table class="table table-image table-bordered table-hover text-align-center">
                            <thead class="bg-light align-content-center">
                                <tr>
                                        <th>Số Thứ Tự</th>
                                        <th>Mã Dịch Vụ</th>
                                        <th>Tên Dịch Vụ</th>
                                        <th>Giá</th>
                                        <th>Mô Tả</th>
                                        <th>Ảnh</th>
                                        <th>Trạng Thái</th>
                                        <th>Admin Quản Lý</th>
                                        <th>Chỉnh Sửa</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int count = 1;
                                    for (ServiceDTO service : listService) {
                                %>
                            <form action="UpdateServiceController" >
                                <tr>
                                    <td><%=count++%></td>
                                    <td><input type="text" name="serviceID" value="<%=service.getServiceID()%>"/></td>
                                    <td><input type="text" name="serviceName" value="<%=service.getServiceName()%>"/></td>
                                    <td><input type="text" name="servicePrice" value="<%=service.getServicePrice()%>"/></td>
                                    <td><input type="text" name="description" value="<%=service.getDescription()%>"/></td>
                                    <td>
                                        <input type="hidden" name="image" value="<%=service.getImage()%>"/>
                                        <img style="width: 200px " src="<%=service.getImage()%>">
                                    </td>
                                    <td>
                                        <select name ="status">
                                            <option selected value="<%=service.getStatus()%>"><%if (service.getStatus() == 1) {%>Đang hoạt động<%} else {%>Ngưng hoạt động<%}%></option>
                                            <option value="<%=Math.abs(service.getStatus() - 1)%>"><%if (service.getStatus() == 0) {%>Đang hoạt động<%} else {%>Ngưng hoạt động<%}%></option>
                                        </select>    
                                    </td>
                                    <td>
                                        <%=service.getAdminID()%>
                                    </td>
                                    <td> 
                                        <input type="hidden" name ="adminID" value="<%=login.getAdminID()%>"/>
                                        <input type ="hidden" name ="serviceTypeID" value="<%=service.getServiceTypeID()%>"/>
                                        <input type="submit" class="btn btn-block btn-outline-success" name="action" value="Chỉnh Sửa"/>
                                    </td>

                                </tr>
                            </form>
                            </tbody>

                            <%
                                }
                            %>
                            </form>
                        </table>
                    </div>
                </div>
                <%
                } else {
                %>


                <div class="col-md-12 ">
                    <div class="card">
                        <div class="card-body">
                            <%
                                List<ServiceDTO> listService = (List<ServiceDTO>) session.getAttribute("LIST_SERVICE");
                                if (listService != null) {
                                    if (!listService.isEmpty()) {
                            %>

                            <table  class="table table-image table-bordered table-hover text-align-center">
                                <thead class="bg-light align-content-center">
                                    <tr>
                                        <th>Số Thứ Tự</th>
                                        <th >Mã Dịch Vụ</th>
                                        <th>Tên Dịch Vụ</th>
                                        <th>Giá</th>
                                        <th>Mô Tả</th>
                                        <th >Ảnh</th>
                                        <th>Trạng Thái</th>
                                        <th>Admin Quản Lý</th>
                                        <th>Chỉnh Sửa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        int count = 1;
                                        for (ServiceDTO service : listService) {
                                    %>
                                <form action="UpdateServiceController">
                                    <tr>
                                        <td><%=count++%></td>
                                        <td><input type="text" name="serviceID" value="<%=service.getServiceID()%>" class="form-control-plaintext"/></td>
                                        <td><input type="text" name="serviceName" value="<%=service.getServiceName()%>" class="form-control-plaintext"/></td>
                                        <td><input type="text" name="servicePrice" value="<%=service.getServicePrice()%>" class="form-control-plaintext"/><%=service.getServicePrice()%></td>

                                        <td><input type="text" name="description" value="<%=service.getDescription()%>" class="form-control-plaintext"/></td>
                                        <td >
                                            <input type="hidden" name="image" value="<%=service.getImage()%>"/>
                                            <img style="width: 200px; vertical-align: middle; " src="<%=service.getImage()%>"></td>
                                        <td>
                                            <select name ="status">
                                                <option selected value="<%=service.getStatus()%>"><%if (service.getStatus() == 1) {%>Đang hoạt động<%} else {%>Ngưng hoạt động<%}%></option>
                                                <option value="<%=Math.abs(service.getStatus() - 1)%>"><%if (service.getStatus() == 0) {%>Đang hoạt động<%} else {%>Ngưng hoạt động<%}%></option>
                                            </select>    
                                        </td>
                                        <td>
                                            <%=service.getAdminID()%>
                                        </td>
                                        <td> 
                                            <input type="hidden" name ="adminID" value="<%=login.getAdminID()%>"/>
                                            <input type ="hidden" name ="serviceTypeID" value="<%=service.getServiceTypeID()%>"/>
                                            <input type="submit" class="btn btn-block btn-outline-success flex" name="action" value="Chỉnh Sửa"/>
                                        </td>

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
                                }
                            %> 
                        </div>
                    </div>

                    <!-- /.card-body -->

                </div>
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
<script>


        function toastClose() {
            var toast1 = document.getElementById("toast-msg");
            toast1.style.display = "none";
        }
</script>

</body>
</html>
