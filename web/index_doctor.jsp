<%-- 
    Document   : index_admin
    Created on : Jun 23, 2022, 4:39:03 PM
    Author     : Doan
--%>

<%@page import="doctors.DoctorDTO"%>
<%@page import="admins.AdminDTO"%>
<%@page import="serviceTypes.ServiceTypeDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel='shortcut icon' href="images/logo-icon.png" />
        <title>DentaCare-Admin</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        
    </head>

    <body id="page-top">
        <%AdminDTO loginAdmin = (AdminDTO) session.getAttribute("LOGIN_ADMIN");%>
        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-tooth"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">Denta <strong>care</strong></div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="LoadAdminController">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Interface
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">

                    <a class="nav-link collapsed" href="index_service.jsp" data-toggle="collapse" data-target="#collapseTwo"
                       aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-fw fa-cog"></i>
                        <span>Dịch Vụ</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <div class="row">
                                <h6 class="collapse-header">Các loại dịch vụ</h6>
                            </div>
                            <%
                                List<ServiceTypeDTO> listServiceType = (List<ServiceTypeDTO>) request.getAttribute("LIST_SERVICE_BY_SVTYPE");
                                if (listServiceType != null) {
                                    for (ServiceTypeDTO svType : listServiceType) {
                            %>


                            <div class="row service-item">
                                <a class="collapse-item col-sm float-left" href="LoadServiceController?serviceTypeName=<%=svType.getServiceTypeName()%>&serviceTypeID=<%=svType.getServiceTypeID()%>"><%=svType.getServiceTypeName()%></a>
                            </div>
                            <%
                                    }
                                }
                            %>
                        </div>
                    </div>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <li class="nav-item">
                    <a class="nav-link collapsed" href="ShowDoctorController">
                        <i class="fas fa-fw fa-user-doctor"></i>
                        <span>Bác Sĩ</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link collapsed" href="ShowPatientController">
                        <i class="fas fa-fw fa-bed-pulse"></i>
                        <span>Bệnh nhân</span>
                    </a>
                </li>



                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="ShowFeedBackAdminController">
                        <i class="fas fa-fw fa-bell"></i>
                        <span>Đánh Giá</span>
                    </a>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="ShowBookingAdminController">
                        <i class="fas fa-fw fa-calendar-check"></i>
                        <span>Lịch Hẹn</span></a>
                </li>
                <!-- Nav Item - Tables -->
                <li class="nav-item">

                    <a class="nav-link collapsed" href="index_service.jsp" data-toggle="collapse" data-target="#collapseThree"
                       aria-expanded="true" aria-controls="collapseThree">
                        <i class="fas fa-fw fa-cog"></i>
                        <span>Mã giảm giá</span>
                    </a>
                    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <div class="row">
                                <h6 class="collapse-header">Các loại giảm giá</h6>
                            </div>
                            <%
                                if (listServiceType != null) {
                                    for (ServiceTypeDTO svType : listServiceType) {
                            %>

                            <div class="row service-item">
                                <a class="collapse-item col-sm float-left" href="LoadDiscountController?serviceTypeID=<%=svType.getServiceTypeID()%>"><%=svType.getServiceTypeName()%></a>

                            </div>
                            <%
                                    }
                                }
                            %>
                        </div>
                    </div>
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>

            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>



                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">
                            <%            String search = request.getParameter("fullName");
                                if (search == null) {
                                    search = "";
                                }
                            %>
                            <form class="form-inline my-2 my-lg-0" action="SearchDoctorController">
                                <input name="fullName" class="form-control mr-sm-2" type="search" value="<%=search%>" placeholder="Nhập tên bác sĩ" aria-label="Search">
                                <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Tìm kiếm</button>
                            </form>

                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=loginAdmin.getFullName()%></span>
                                    <img class="img-profile rounded-circle"
                                         src="https://www.kindpng.com/picc/m/699-6997452_administrator-network-icons-system-avatar-computer-transparent-admin.png">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Profile
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Settings
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Activity Log
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <% List<DoctorDTO> listDoctor = (List<DoctorDTO>) request.getAttribute("LIST_DOCTOR");
                        List<DoctorDTO> listSearch = (List<DoctorDTO>) request.getAttribute("SEARCH_DOCTOR");
                    %>
                    <div class="container">
                        <!-- Danh sach doctor search theo ten -->
                        <%if (listSearch != null) {%>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Họ và Tên</th>
                                    <th>Chuyên khoa</th>                        
                                    <th>Gmail</th>
                                    <th>Số điện thoại</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (DoctorDTO dr : listSearch) {%>
                                <tr>
                                    <td><%=dr.getFullName()%></td>
                                    <td><%=dr.getServiceTypeName()%></td>
                                    <td><%=dr.getGmail()%></td>
                                    <td>0<%=dr.getPhone()%></td>
                                    <td><a href="DetailDoctorAdminController?doctorID=<%=dr.getDoctorID()%>">Chi tiết</a></td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                        <%} else {%> 
                        <!-- Danh sach tat ca doctor -->
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Họ và Tên</th>
                                    <th>Chuyên khoa</th>                        
                                    <th>Gmail</th>
                                    <th>Số điện thoại</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (DoctorDTO dr : listDoctor) {%>
                                <tr>
                                    <td><%=dr.getFullName()%></td>
                                    <td><%=dr.getServiceTypeName()%></td>
                                    <td><%=dr.getGmail()%></td>
                                    <td>0<%=dr.getPhone()%></td>
                                    <td><a href="DetailDoctorAdminController?doctorID=<%=dr.getDoctorID()%>">Chi tiết</a></td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                        <%}%>






                    </div>
                    <!-- Footer -->
                    
                    <!-- End of Footer -->

                </div>
                <!-- End of Content Wrapper -->

            </div>
            <!-- End of Page Wrapper -->

            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
                <i class="fas fa-angle-up"></i>
            </a>

            <!-- Logout Modal-->
            <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                            <a class="btn btn-primary" href="login.html">Logout</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

            <!-- Bootstrap core JavaScript-->
            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <!-- Core plugin JavaScript-->
            <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
            <!-- Custom scripts for all pages-->
            <script src="js/sb-admin-2.min.js"></script>
            <!-- Page level plugins -->
            <script src="vendor/chart.js/Chart.min.js"></script>
            <!-- Page level custom scripts -->
            <script src="js/demo/chart-area-demo.js"></script>
            <script src="js/demo/chart-pie-demo.js"></script>

    </body>

</html>

