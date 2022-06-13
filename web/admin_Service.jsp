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
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/menu.css">
        <style>
            #toast-msg{
                position: fixed;
                padding-left: 10px;
                right: 10px;
                top:10px;
                z-index: 100;
                width: 210px;
                background-color: #28a745;
                border-bottom-left-radius:10px;
                border-top-left-radius: 10px;
                border-bottom-right-radius: 10px;
                text-align: left;
                color:white;
                font-size: 18px;
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
        <%
            List<ServiceTypeDTO> listServiceType = (List<ServiceTypeDTO>) session.getAttribute("LIST_SERVICE_TYPE");
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
                        <li class="nav-item dropdown"><a href="LogoutController" id="navbarDropdown" role="button" data-toggle="dropdown"
                                                         aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle"><%=((AdminDTO) session.getAttribute("LOGIN_USER")).getFullName()%></a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a href="LogoutController" class="dropdown-item nav-link text-primary text-center">Đăng xuất</a>
                                <a href="admin_Account.jsp" class="dropdown-item nav-link text-primary text-center">Hồ sơ cá nhân</a>
                            </div>
                        </li>


                        <li class="nav-item"><a href="ShowServiceController" class="nav-link sa">Dịch Vụ</a></li>

                        <li class="nav-item"><a href="ShowPatientController" class="nav-link sa">Bệnh Nhân</a></li>
                        <li class="nav-item"><a href="#" class="nav-link sa">Phản Hồi</a></li>
                        <li class="nav-item"><a href="ShowDoctorController" class="nav-link sa">Bác Sĩ</a></li>
                        <li class="nav-item"><a href="#" class="nav-link sa">Lịch Hẹn</a></li>
                        <li class="nav-item"><a href="#" class="nav-link sa">Khuyến Mãi</a></li>
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
                <strong class="mr-auto1">Thông báo <i class="fa fa-bell"></i></strong>

                <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close" onClick="toastClose()">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="toast-body1">
                <%=msg%>
            </div>
        </div>

        <%
            }
        %>

        <section class="home-slider owl-carousel">
            <div class="slider-item bread-item" style="background-image: url('images/bg_1.jpg');"
                 data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
            </div>
        </section>

        <!--Modal hiện form tạo Service-->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel" style="color:#2f89fc">Thêm Dịch Vụ</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="AddServiceController" method="GET">
                        <div class="modal-body">
                            <div class="register-box">
                                <div class="input-group mb-3">
                                    <input name="serviceName" type="text" class="form-control" placeholder="Tên dịch vụ">
                                </div>
                                <div class="input-group mb-3">
                                    <input name="servicePrice" type="text" class="form-control" placeholder="Giá dịch vụ" required="">
                                </div>
                                <div class="input-group mb-3">
                                    <input name="image" type="text" class="form-control" placeholder="Ảnh">
                                </div>
                                <div class="input-group mb-3">
                                    <input name="description" type="text" class="form-control" placeholder="Mô tả">
                                </div>
                                <div class="input-group mb-3">
                                    <input type="hidden" name="adminID" value="<%=login.getAdminID()%>" class="form-control" readonly="">
                                </div>
                                <div class="input-group mb-3">
                                    <label for="serviceTypeName">Chuyên khoa</label>
                                    <select name="serviceTypeName">
                                        <% for (ServiceTypeDTO svTypeDTO : listServiceType) {%>                                
                                        <option value="<%=svTypeDTO.getServiceTypeID()%>"><%=svTypeDTO.getServiceTypeName()%></option> 
                                        <%}%>
                                    </select>
                                </div>
                            </div><!-- /.card -->
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <input type="submit" value="Add Service" class="btn btn-primary">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <section >
            <!--service type theo service-->
            <div class="container-fluid">
                <div class="col-md-5 pr-md-5 mt-5 offset-1">
                    <div class="dropright">
                        <button class="btn dropdown-toggle" style="background: #2f89fc; color: white; margin-right: 5px" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Loại Dịch Vụ
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                            <%
                                if (listServiceType != null) {
                                    for (ServiceTypeDTO svType : listServiceType) {
                            %>
                            <button class="dropdown-item" type="button"><a href="ServiceTypeController?serviceTypeID=<%=svType.getServiceTypeID()%>"><%=svType.getServiceTypeName()%></a></button>

                            <%
                                    }
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container-fluid">
                <div class="col-md-5 pr-md-5 offset-1">
                    <div>
                        <h3 class="text-primary">Quản lí dịch vụ:</h3>
                    </div>
                </div>

                <!-- Search bac si theo ten -->

                <div class="col-md-5 offset-1">
                    <div class="btn-group">
                        <form action="SearchServiceController">
                            <input type="search" class="form" name="serviceName">
                            <input class="btn" style="background: #2f89fc; color: white; margin-right: 5px " type="submit" value="Tìm kiếm dịch vụ">
                        </form>
                        <button class="btn btn-success" data-toggle="modal" data-target="#exampleModal" style="border-radius: 40px; width: 40px"><i class="fa fa-plus"></i></button>
                    </div>
                </div>

                <%
                    List<ServiceDTO> listSearchService = (List<ServiceDTO>) request.getAttribute("SEARCH_SERVICE");
                    List<ServiceDTO> listsvbySVType = (List<ServiceDTO>) session.getAttribute("LIST_SERVICE_BY_SVTYPE");
                    if (listSearchService != null) {
                        List<ServiceDTO> listService = listSearchService;
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
                                    <th>Cập Nhật</th>
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
                                    <td><input type="text" name="serviceID" value="<%=service.getServiceID()%>"/></td>
                                    <td><input type="text" name="serviceName" value="<%=service.getServiceName()%>"/></td>
                                    <td><input type="text" name="servicePrice" value="<%=service.getServicePrice()%>" class="form-control-plaintext"/></td>
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
                                        <input type="submit" class="btn btn-block btn-outline-success flex" name="action" value="Cập Nhật"/>
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
                } else if (listsvbySVType != null) {
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
                                    <th>Cập Nhật</th>
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
                                    <td><input type="text" name="serviceID" value="<%=service.getServiceID()%>"/></td>
                                    <td><input type="text" name="serviceName" value="<%=service.getServiceName()%>"/></td>
                                    <td><input type="text" name="servicePrice" value="<%=service.getServicePrice()%>"/></td>
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
                                        <input type="submit" class="btn btn-block btn-outline-success flex" name="action" value="Cập Nhật"/>
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
                    <div class="card card-body">

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
                                    <th>Cập Nhật</th>
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
                                    <td><input type="text" name="serviceID" value="<%=service.getServiceID()%>"/></td>
                                    <td><input type="text" name="serviceName" value="<%=service.getServiceName()%>"/></td>
                                    <td><input type="text" name="servicePrice" value="<%=service.getServicePrice()%>"/></td>
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
                                        <input type="submit" class="btn btn-block btn-outline-success flex" name="action" value="Cập Nhật"/>
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

                    <!-- /.card-body -->

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
