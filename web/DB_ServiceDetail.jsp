<%-- 
    Document   : DB_ServiceDetail
    Created on : Jun 30, 2022, 12:16:25 AM
    Author     : Doan
--%>

<%@page import="serviceImage.ServiceImageDTO"%>
<%@page import="services.ServiceDTO"%>
<%@page import="admins.AdminDTO"%>
<%@page import="serviceTypes.ServiceTypeDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SB Admin 2 - Dashboard</title>

        <!-- Custom fonts for this template-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link href="css/index_admin.css" rel="stylesheet">

    </head>

    <body id="page-top">
        <%AdminDTO loginAdmin = (AdminDTO) session.getAttribute("LOGIN_ADMIN");
            ServiceDTO service = (ServiceDTO) request.getAttribute("SERVICE_INFOR");
            List<ServiceImageDTO> listServiceImage = (List<ServiceImageDTO>) request.getAttribute("LIST_SERVICE_IMAGE");
        %>
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
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                       aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-fw fa-cog"></i>
                        <span>Dịch vụ</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <div class="row">
                                <h6 class="collapse-header">Các loại dịch vụ</h6>
                            </div>
                            <%
                                List<ServiceTypeDTO> listServiceType = (List<ServiceTypeDTO>) session.getAttribute("LIST_SERVICE_BY_SVTYPE");
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

                <!-- Nav Item - Utilities Collapse Menu -->

                <li class="nav-item">
                    <a class="nav-link collapsed" href="ShowDoctorController">
                        <i class="fas fa-fw fa-bell"></i>
                        <span>Bác Sĩ</span>
                    </a>
                </li>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                     data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Utilities:</h6>
                        <a class="collapse-item" href="utilities-color.html">Colors</a>
                        <a class="collapse-item" href="utilities-border.html">Borders</a>
                        <a class="collapse-item" href="utilities-animation.html">Animations</a>
                        <a class="collapse-item" href="utilities-other.html">Other</a>
                    </div>
                </div>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Addons
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                       aria-expanded="true" aria-controls="collapsePages">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Pages</span>
                    </a>
                    <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Login Screens:</h6>
                            <a class="collapse-item" href="login.html">Login</a>
                            <a class="collapse-item" href="register.html">Register</a>
                            <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
                            <div class="collapse-divider"></div>
                            <h6 class="collapse-header">Other Pages:</h6>
                            <a class="collapse-item" href="404.html">404 Page</a>
                            <a class="collapse-item" href="blank.html">Blank Page</a>
                        </div>
                    </div>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="charts.html">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Charts</span></a>
                </li>

                <!-- Nav Item - Tables -->
                <li class="nav-item">
                    <a class="nav-link" href="tables.html">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Tables</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>


            </ul>
        
            <!-- End of Page Wrapper -->    
        
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
                    <!-- Noi dung Page -->


                    <div class="container">
                        <div clas="row-col-12">
                            <form action="UpdateServiceController" class="col-12">
                                <div class="col-md-5 float-left">
                                    <div>
                                        <label class="text-primary font-weight-bold">Tên dịch vụ</label>
                                        <input name="serviceName" value="<%=service.getServiceName()%>">
                                    </div>
                                    <div >
                                        <label class="text-primary font-weight-bold">Trạng thái hoạt động</label>
                                        <select name ="status">
                                            <option selected value="<%=service.getStatus()%>"><%if (service.getStatus() == 1) {%>Đang hoạt động<%} else {%>Ngưng hoạt động<%}%></option>
                                            <option value="<%=Math.abs(service.getStatus() - 1)%>"><%if (service.getStatus() == 0) {%>Đang hoạt động<%} else {%>Ngưng hoạt động<%}%></option>
                                        </select>         
                                    </div>                
                                    <div >
                                        <label class="text-primary font-weight-bold">Giá tiền </label>
                                        <input name="servicePrice" value="<%=service.getServicePrice()%>">VND
                                    </div>
                                    <input type="hidden" name ="serviceID" value="<%=service.getServiceID()%>">
                                    <input type="hidden" name="serviceTypeID" value="<%=service.getServiceTypeID()%>">
                                    <div>
                                        <label class="text-primary font-weight-bold">AdminID Đã Chỉnh Sửa: </label>
                                        <label><%=service.getAdminID()%></label>
                                    </div>
                                </div>
                                <div class="col-md-7 float-right" >
                                    <label class="text-primary font-weight-bold">Mô tả :</label>
                                    <textarea class="form-control" name="description" cols="6" rows="4" id="description"> <%=service.getDescription()%></textarea>
                                    <input class="btn btn-primary mt-3" type="submit" value="Chỉnh sửa">
                                </div>
                            </form >
                        </div>    

                        <div class="pt-5 pb-5" style="clear:both">
                            <h2 class="text-center text-primary font-weight-bold">Ảnh của dịch vụ</h2>
                            <table class="table table-bordered table-striped table-responsive-md">
                                <thead>
                                    <tr>
                                        <th class="text-primary" scope="col">STT</th>
                                        <th class="text-primary" scope="col">Ảnh</th>
                                        <th class="text-primary" scope="col">Xóa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%int demm = 0;
                                        for (ServiceImageDTO img : listServiceImage) {
                                            if (img.getServiceID() == service.getServiceID()) {
                                                demm++;
                                    %>
                                    <tr>
                                        <td class="text-primary font-weight-bold" scope="row"><%=demm%></td>
                                        <td><img src="<%=img.getImage()%>" style="display: block;margin-right:auto;margin-left: auto;height:100px;width: 150px"/></td>
                                        <td class="align-content-center"><a class="btn btn-danger" href="DeleteImageServiceController?serviceID=<%=service.getServiceID()%>&imageID=<%=img.getImageID()%>">X</a></td>
                                        <%
                                                }
                                            }%>
                                    </tr>


                                </tbody>
                            </table>
                            <form id="form-anh" action="UpdateImageController" method ="POST">
                                <label class="text-primary font-weight-bold">Thêm Ảnh Mới:</label><br>
                                <img id="rendered_image_<%=service.getServiceID()%>" style="width: 200px; height: 250px" src="<%=service.getImage()%>"/>
                                <input type="file" value="" onchange="return onSelectedImage(this, '<%=service.getServiceID()%>')" />
                                <input type="hidden" id="image_<%=service.getServiceID()%>" name="image" value=""/>
                                <input type="hidden" name="serviceID" value="<%=service.getServiceID()%>"><br>
                                <input class="btn btn-primary mt-2" type="submit" value="Thêm ảnh">
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>

            <!-- Logout Modal-->
            <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Bạn có muốn đăng xuất không</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">Chọn "Đăng Xuất" nếu bạn muốn đăng xuất tài khoản.</div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Hủy</button>
                            <a class="btn btn-primary" href="login.html">Đăng Xuất</a>
                        </div>
                    </div>
                </div>
            </div>



            <script src="ckeditor/ckeditor.js"></script>
            <script>
                                    var editor = CKEDITOR.replace('description');
                                    CKFinder.setupCKEditor(editor, 'ckfinder/');
                                    data["description"] = editor.getData();
            </script>     
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
            <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
            <script src="js/js/convertImageBase64.js"></script>
    </body>

</html>
