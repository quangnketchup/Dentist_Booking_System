<%-- 
    Document   : index_admin
    Created on : Jun 23, 2022, 4:39:03 PM
    Author     : Doan
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="discounts.DiscountDTO"%>
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

    <title>DentaCare-Admin</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

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
                        <h6 class="collapse-header">Các Loại Dịch Vụ</h6>
                 <%
                                    List<ServiceTypeDTO> listServiceType = (List<ServiceTypeDTO>) request.getAttribute("LIST_SERVICE_BY_SVTYPE");
                                    if (listServiceType != null) {
                                        for (ServiceTypeDTO svType : listServiceType) {
                                %>
              
                       
                        <a class="collapse-item" href="ServiceTypeHomeController?serviceTypeID=<%=svType.getServiceTypeID()%>"><%=svType.getServiceTypeName()%></a>
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
                <a class="nav-link collapsed" href="index_doctor.jsp">
                    <i class="fas fa-fw fa-bell"></i>
                    <span>Bác Sĩ</span>
                </a>
            </li>
            
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="index_feedback.jsp">
                    <i class="fas fa-fw fa-bell"></i>
                    <span>Đánh Giá</span>
                </a>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="index_book.jsp">
                    <i class="fas fa-fw fa-calendar-check"></i>
                    <span>Lịch Hẹn</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="index_Discount.jsp">
                    <i class="fas fa-fw fa-percent"></i>
                    <span>Mã Giảm Giá</span></a>
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
                <%List<DiscountDTO> listDiscountBySVType = (List<DiscountDTO>) request.getAttribute("listDiscountBySVType");%>
                <!-- Begin Page Content -->
                <div class="container-fluid">

                        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel" style="color:#2f89fc">Thêm mã khuyến mãi</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form action="AddDiscountController" method="GET">
                                        <div class="modal-body">
                                            <div class="register-box">
                                                <div class="input-group mb-3">
                                                    <input name="title" type="text" class="form-control" placeholder="Tên chủ đề">
                                                </div>
                                                <div class="input-group mb-3">
                                                    <input name="description" type="text" class="form-control" placeholder="Mô tả" >
                                                </div>
                                                <div class="input-group mb-3">
                                                    <input name="percentDiscount" type="number" class="form-control" placeholder="Phần trăm khuyến mãi" required="">
                                                </div>
                                                <div class="input-group mb-3">
                                                    <div class="form-group">
                                                        <label>Ngày tạo mã</label>
                                                        <input type="date" name="createDate" class="form-control" min="<%=LocalDate.now()%>" required="">
                                                    </div>
                                                </div>
                                                <div class="input-group mb-3">
                                                    <div class="form-group">
                                                        <label>Ngày hết hạn</label>
                                                        <input type="date" name="expiredDate" class="form-control" min="<%=LocalDate.now().minusDays(-1)%>" required="">
                                                    </div>
                                                </div>                                                          
                                                <div class="input-group mb-3">
                                                    <input name="adminID" type="text"  class="form-control" placeholder="Mã quản lí"> 
                                                </div>
                                                <div class="input-group mb-3">
                                                    <input name="serviceID" type="text"  class="form-control" placeholder="Mã dịch vụ"> 
                                                </div>
                                            </div><!-- /.card -->
                                        </div>

                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <input type="submit" value="Add Discount" class="btn btn-primary">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-5 offset-1">
                            <div>
                                <h3 class="text-primary">Quản lí khuyến mãi:</h3>
                            </div>
                        </div>

                        <div class="col-md-5 offset-1">
                            <div class="btn-group">
                                <form action="SearchDiscountController">
                                    <input type="search" class="form" name="title">
                                    <input class="btn"
                                           style="background: #2f89fc; color: white; margin-right: 5px "
                                           type="submit" value="Tìm kiếm mã khuyễn mãi">
                                </form>
                                <button class="btn btn-success" data-toggle="modal"
                                        data-target="#exampleModal"
                                        style="border-radius: 50px; position: absolute; left: 500px; "><i
                                        class="fa fa-plus"></i></button>
                            </div>
                        </div>

                        <div class="col-md-12">

                            <div class="card-body">
                                <% List<DiscountDTO> listSearchDiscount = (List<DiscountDTO>) request.getAttribute("SEARCH_DISCOUNT");
                                    if (listSearchDiscount != null) {
                                        List<DiscountDTO> listDiscount = listSearchDiscount;
                                %>
                                <table id="table_id" class="table table-bordered table-hover text-align-center">
                                    <thead class="bg-light align-content-center">
                                        <tr>
                                            <th>Mã khuyến mãi</th>
                                            <th>Chủ đề</th>
                                            <th>Mô tả</th>
                                            <th>Phần trăm khuyến mãi</th>
                                            <th>Trạng thái</th>
                                            <th>Ngày tạo mã</th>
                                            <th>Ngày hết hạn</th>
                                            <th>Admin quản lí</th>
                                            <th>Cập nhật</th>
                                        </tr>
                                    </thead>
                                    <tbody class="align-content-around">
                                        <% int count = 1;
                                            for (DiscountDTO discount : listDiscount) {%>
                                    <form action="UpdateDiscountController" method="GET">
                                        <tr>

                                            <td><input type="text" name="discountID"
                                                       value="<%=discount.getDiscountID()%>"
                                                       class="form-control-plaintext"
                                                       readonly /></td>
                                            <td><input type="text" name="title"
                                                       value="<%=discount.getTitle()%>"
                                                       class="form-control-plaintext" />
                                            </td>
                                            <td><textarea class="form-control" name="description" cols="6" rows="6" id="description"> <%=discount.getDescription()%></textarea>
                                            </td>
                                            <td><input type="number"
                                                       name="percentDiscount"
                                                       value="<%=discount.getPercentDiscount()%>"
                                                       class="form-control-plaintext" />
                                            </td>
                                            <td>
                                                <select name="status">
                                                    <option selected
                                                            value="<%=discount.getStatus()%>">
                                                        <%if (discount.getStatus() == 1) {%>Đang khuyến mại<%} else {%>Đã hết hạn<%}%>
                                                    </option>
                                                    <option
                                                        value="<%=Math.abs(discount.getStatus() - 1)%>">
                                                        <%if (discount.getStatus() == 0) {%>Đang khuyến mại<%} else {%>Đã hết hạn<%}%>
                                                    </option>
                                                </select>
                                            </td>
                                            <td><input type="text" name="createDate"
                                                       value="<%=discount.getCreateDate()%>"
                                                       class="form-control-plaintext" />
                                            </td>
                                            <td><input type="text" name="expiredDate"
                                                       value="<%=discount.getExpiredDate()%>"
                                                       class="form-control-plaintext" />
                                            </td>
                                            <td>
                                                <%=discount.getAdminID()%>
                                            </td>
                                            
                                               <input type="hidden" name="serviceID"
                                                       value="<%=discount.getServiceID()%>"
                                                       class="form-control-plaintext" />
                                            
                                            <td><input type="submit"
                                                       class="btn btn-block btn-outline-success"
                                                       name="action"
                                                       value="Update Discount"></td>
                                        </tr>
                                    </form>
                                    <% } %>
                                    </tbody>

                                </table>
                                <% } else {
                                    List<DiscountDTO> listDiscount = listDiscountBySVType;
                                    if (listDiscount != null) {
                                        if (!listDiscount.isEmpty()) {
                                %>


                                <table id="serviceTB"
                                       class="table table-image table-bordered table-hover text-align-center">
                                    <thead class="bg-light align-content-center">
                                        <tr>
                                            <th>Mã khuyến mãi</th>
                                            <th>Chủ đề</th>
                                            <th>Mô tả</th>
                                            <th>Phần trăm khuyến mãi</th>
                                            <th>Trạng thái</th>
                                            <th>Ngày tạo mã</th>
                                            <th>Ngày hết hạn</th>
                                            <th>Admin quản lí</th>
                                            <th>Cập nhật</th>
                                        </tr>
                                    </thead>
                                    <tbody class="align-content-around">
                                        <% int count = 1;
                                            for (DiscountDTO discount
                                                    : listDiscount) {%>
                                    <form action="UpdateDiscountController"
                                          method="GET">
                                        <tr>
                                            <td><input type="text"
                                                       name="discountID"
                                                       value="<%=discount.getDiscountID()%>"
                                                       class="form-control-plaintext"
                                                       readonly /></td>
                                            <td><input type="text" name="title"
                                                       value="<%=discount.getTitle()%>"
                                                       class="form-control-plaintext" />
                                            </td>
                                            <td><textarea class="form-control" name="description" cols="6" rows="6" id="description"> <%=discount.getDescription()%></textarea>
                                            </td>
                                            <td><input type="number"
                                                       name="percentDiscount"
                                                       value="<%=discount.getPercentDiscount()%>"
                                                       class="form-control-plaintext" />
                                            </td>
                                            <td>
                                                <select name="status">
                                                    <option selected
                                                            value="<%=discount.getStatus()%>">
                                                        <%if (discount.getStatus() == 1) {%>Đang khuyến mại
                                                        <%} else {%>Đã hết
                                                        hạn<%}%>
                                                    </option>
                                                    <option
                                                        value="<%=Math.abs(discount.getStatus() - 1)%>">
                                                        <%if (discount.getStatus() == 0) {%>Đang khuyến mại
                                                        <%} else {%>Đã hết
                                                        hạn<%}%>
                                                    </option>
                                                </select>
                                            </td>
                                            <td><input type="text" name="createDate"
                                                       value="<%=discount.getCreateDate()%>"
                                                       class="form-control-plaintext" />
                                            </td>
                                            <td><input type="text" name="expiredDate"
                                                       value="<%=discount.getExpiredDate()%>"
                                                       class="form-control-plaintext" />
                                            </td>
                                            <td>
                                                <input type="text" name="adminID"
                                                       value="<%=discount.getAdminID()%>"
                                                       class="form-control-plaintext" />

                                            </td>
                                          
                                                <input type="hidden" name="serviceID"
                                                       value="<%=discount.getServiceID()%>"
                                                       class="form-control-plaintext" />

                                        
                                            <td><input type="submit"
                                                       class="btn btn-block btn-outline-success"
                                                       name="action"
                                                       value="Update Discount">
                                            </td>
                                        </tr>
                                    </form>
                                    </tbody>

                                    <% } %>
                                </table>
                                <% }
                                        }
                                    }
                                %>
                            </div>
                        </div>

                    </div>
                
                
                
                

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
                    </div>
                </div>
            </footer>
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

</body>

</html>

