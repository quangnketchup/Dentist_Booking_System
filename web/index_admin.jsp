<%-- 
    Document   : index_admin
    Created on : Jun 23, 2022, 4:39:03 PM
    Author     : Doan
--%>

<%@page import="doctors.DoctorDTO"%>
<%@page import="feedbacks.FeedbackDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
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
                        <i class="fa-solid fa-user-doctor"></i>
                        <span>Bác Sĩ</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link collapsed" href="ShowPatientController">
                        <i class="fa-solid fa-bed-pulse"></i>
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
                                    <a class="dropdown-item" href="LououtController" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                            <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                    class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
                        </div>
                        <% int money = (int) request.getAttribute("IncomeMonthly");%>
                        <!-- Content Row -->
                        <div class="row">

                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                    Thu nhập (Trong tháng)</div>
                                                    <%DecimalFormat formatter = new DecimalFormat("###,###,###");%>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><%=formatter.format(money)%>VND</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <% int nb = (int) request.getAttribute("numBooking");%>
                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-info shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Lượt Book(Trong tháng)
                                                </div>
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col-auto">
                                                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800"><%=nb%> Lượt đặt</div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="progress progress-sm mr-2">
                                                            <div class="progress-bar bg-info" role="progressbar"
                                                                 style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                                 aria-valuemax="100"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <% int nbFB = (int) request.getAttribute("numFeedBack");%>
                            <!-- Pending Requests Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-warning shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                    Lượng phản hồi(Trong tháng)</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><%=nbFB%></div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-comments fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Content Row -->

                        <div class="row">

                            <!-- Area Chart -->
                            <div class="col-xl-8 col-lg-7">
                                <div class="card shadow mb-4">
                                    <!-- Card Header - Dropdown -->
                                    <div
                                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Biểu đồ doanh thu</h6>
                                        <div class="dropdown no-arrow">
                                            <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                                 aria-labelledby="dropdownMenuLink">
                                                <div class="dropdown-header">Dropdown Header:</div>
                                                <a class="dropdown-item" href="#">Action</a>
                                                <a class="dropdown-item" href="#">Another action</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">Something else here</a>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                        ArrayList listMoneyInMonth = (ArrayList) request.getAttribute("LIST_MONEY_IN_YEAR");
                                    %>
                                    <!-- Card Body -->
                                    <div class="card-body">
                                        <div class="chart-area">
                                            <canvas id="myAreaChart"></canvas><!-- comment -->
                                            <div>
                                                <input type="hidden" id="thang12" name="number" value="<%=listMoneyInMonth.get(11)%>"/>
                                            </div><!-- id thang12 trỏ tới chart-area -->

                                            <div>
                                                <input type="hidden" id="thang11" name="number" value="<%=listMoneyInMonth.get(10)%>"/>
                                            </div><!-- id thang11 trỏ tới chart-area -->

                                            <div>
                                                <input type="hidden" id="thang10" name="numbejr" value="<%=listMoneyInMonth.get(9)%>"/>
                                            </div><!-- id thang10 trỏ tới chart-area -->
                                            <div>
                                                <input type="hidden" id="thang9" name="number" value="<%=listMoneyInMonth.get(8)%>"/>
                                            </div><!-- id thang9 trỏ tới chart-area -->

                                            <div>
                                                <input type="hidden" id="thang8" name="number" value="<%=listMoneyInMonth.get(7)%>"/>
                                            </div><!-- id thang8 trỏ tới chart-area -->

                                            <div>
                                                <input type="hidden" id="thang7" name="number" value="<%=listMoneyInMonth.get(6)%>"/>
                                            </div><!-- id thang7 trỏ tới chart-area -->

                                            <div>
                                                <input type="hidden" id="thang6" name="number" value="<%=listMoneyInMonth.get(5)%>"/>
                                            </div><!-- id thang6 trỏ tới chart-area -->

                                            <div>
                                                <input type="hidden" id="thang5" name="number" value="<%=listMoneyInMonth.get(4)%>"/>
                                            </div><!-- id thang5 trỏ tới chart-area -->
                                            <div>
                                                <input type="hidden" id="thang4" name="number" value="<%=listMoneyInMonth.get(3)%>"/>
                                            </div><!-- id thang4 trỏ tới chart-area -->
                                            <div>
                                                <input type="hidden" id="thang3" name="number" value="<%=listMoneyInMonth.get(2)%>"/>
                                            </div><!-- id thang3 trỏ tới chart-area -->
                                            <div>
                                                <input type="hidden" id="thang2" name="number" value="<%=listMoneyInMonth.get(1)%>"/>
                                            </div><!-- id thang2 trỏ tới chart-area -->
                                            <div>
                                                <input type="hidden" id="thang1" name="number" value="<%=listMoneyInMonth.get(0)%>"/>
                                            </div><!-- id thang1 trỏ tới chart-area -->
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Pie Chart -->
                            <div class="col-xl-4 col-lg-5">
                                <div class="card shadow mb-4">
                                    <!-- Card Header - Dropdown -->
                                    <div
                                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Loại dịch vụ ưa thích</h6>
                                        <div class="dropdown no-arrow">
                                            <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                                 aria-labelledby="dropdownMenuLink">
                                                <div class="dropdown-header">Dropdown Header:</div>
                                                <a class="dropdown-item" href="#">Action</a>
                                                <a class="dropdown-item" href="#">Another action</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">Something else here</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Card Body -->
                                    <%
                                        ArrayList listNumberServiceType = (ArrayList) request.getAttribute("LIST_NUMBER_SERVICE_TYPE");
                                        ArrayList listServiceTypeNameByNumber = (ArrayList) request.getAttribute("LIST_SERVICE_TYPE_NAME_FOR_NUMBER");
                                    %>
                                    <div class="card-body">
                                        <div class="chart-pie pt-4 pb-2">
                                            <canvas id="myPieChart"></canvas>
                                            <div>
                                                <input type="hidden" id="serviceType0" name="number" value="<%=listNumberServiceType.get(0)%>"/>
                                                <input type="hidden" id="serviceTypeName0" name="number" value="<%=listServiceTypeNameByNumber.get(0)%>"/>
                                            </div><!-- id serviceType0 trỏ tới chart-pie -->
                                            <div>
                                                <input type="hidden" id="serviceType1" name="number" value="<%=listNumberServiceType.get(1)%>"/>
                                                <input type="hidden" id="serviceTypeName1" name="number" value="<%=listServiceTypeNameByNumber.get(1)%>"/>
                                            </div><!-- id serviceType1 trỏ tới chart-pie -->
                                            <div>
                                                <input type="hidden" id="serviceType2" name="number" value="<%=listNumberServiceType.get(2)%>"/>
                                                <input type="hidden" id="serviceTypeName2" name="number" value="<%=listServiceTypeNameByNumber.get(2)%>"/>
                                            </div><!-- id serviceType2 trỏ tới chart-pie -->
                                            <div>
                                                <input type="hidden" id="serviceType3" name="number" value="<%=listNumberServiceType.get(3)%>"/>
                                                <input type="hidden" id="serviceTypeName3" name="number" value="<%=listServiceTypeNameByNumber.get(3)%>"/>
                                            </div><!-- id serviceType3 trỏ tới chart-pie -->
                                            <div>
                                                <input type="hidden" id="serviceType4" name="number" value="<%=listNumberServiceType.get(4)%>"/>
                                                <input type="hidden" id="serviceTypeName4" name="number" value="<%=listServiceTypeNameByNumber.get(4)%>"/>
                                            </div><!-- id serviceType4 trỏ tới chart-pie -->
                                            <div>
                                                <input type="hidden" id="serviceType5" name="number" value="<%=listNumberServiceType.get(5)%>"/>
                                                <input type="hidden" id="serviceTypeName5" name="number" value="<%=listServiceTypeNameByNumber.get(5)%>"/>
                                            </div><!-- id serviceType5 trỏ tới chart-pie -->
                                        </div>
                                        <div class="mt-4 text-center small">
                                            <span class="mr-2">
                                                <i class="fas fa-circle" style="color: #4e73df"></i> <%=listServiceTypeNameByNumber.get(0)%>
                                            </span>
                                            <span class="mr-2">
                                                <i class="fas fa-circle" style="color: #1cc88a"></i> <%=listServiceTypeNameByNumber.get(1)%>
                                            </span>
                                            <span class="mr-2">
                                                <i class="fas fa-circle" style="color: #36b9cc"></i> <%=listServiceTypeNameByNumber.get(2)%>
                                            </span></br>
                                            <span class="mr-2">
                                                <i class="fas fa-circle" style="color: #8b2bab"></i> <%=listServiceTypeNameByNumber.get(3)%>
                                            </span>
                                            <span class="mr-2">
                                                <i class="fas fa-circle" style="color: #f5c842"></i> <%=listServiceTypeNameByNumber.get(4)%>
                                            </span>
                                            <span class="mr-2">
                                                <i class="fas fa-circle" style="color: #42ad34"></i> <%=listServiceTypeNameByNumber.get(5)%>
                                            </span>




                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Content Row -->
                        <div class="row">

                            <!-- Content Column -->
                            <div class="col-lg-8 mb-4">

                                <!-- Project Card Example -->
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-primary">Lượng phản hồi mới nhất</h6>
                                    </div>
                                    <%
                                        List<FeedbackDTO> Listfeedback = (List<FeedbackDTO>) request.getAttribute("LIST_FEEDBACK");
                                    %>
                                    <div class="card-body">
                                        <div class="review-heading">ĐÁNH GIÁ DỊCH VỤ</div>
                                        <%
                                            int count = 0;
                                            for (FeedbackDTO feedbackService : Listfeedback) {
                                                if (Listfeedback.size() == 0) {
                                        %>
                                        <div><h3>Không có bình luận nào cả</h3></div>
                                        <%} else {
                                            count++;
                                            if (count == 11)
                                                break;
                                        %>
                                        <div class="row" style="overflow-y: scroll; max-height:150px; padding-top: 10px">
                                            <div class="form-group col-md-4 border-primary">
                                                <div >
                                                    <label for="user-name-feedback" style="color: #40407a;align-content: center;text-align: center"><strong><%=feedbackService.getPatientName()%></strong>
                                                        <h6 style="color: gray;align-content: center;text-align: center">(<%=feedbackService.getDateFeedback()%>)</h6></label>

                                                </div>
                                            </div>
                                            <div class="form-group col-md-8 border-primary">
                                                <label for="user-feedback"><%=feedbackService.getContent()%></label>
                                            </div>
                                        </div>
                                        <%}
                                            }%>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 mb-4">

                                <!-- Illustrations -->
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-primary">Top 3 Bác Sĩ Ưu Tú</h6>
                                    </div>
                                    <%
                                        ArrayList<DoctorDTO> listDoctor = (ArrayList<DoctorDTO>) request.getAttribute("LIST_DOCTOR");
                                        ArrayList listNumberBookingDoctor = (ArrayList) request.getAttribute("LIST_NUMBER_BOOKING_DOCTOR");
                                        int top=0;
                                        for (int i = 0; i < listDoctor.size(); i++) {
                                            top++;
                                            if(top==4) break;
                                    %>
                                    <div class="card-body">
                                        <div class="text-center">
                                            <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;"
                                                 src="<%=listDoctor.get(i).getImage()%>" alt="...">
                                        </div>
                                        <div class="col-lg-3 col-md-3 d-flex mb-sm-4 ftco-animate text-center">
                                            <div class="staff">
                                                <div class="img mb-4" style="background-image: url(<%=listDoctor.get(i).getImage()%>);"/></div>
                                            <div class="info text-center">
                                                <h3><a><%=listDoctor.get(i).getFullName()%></a></h3>
                                                <span class="position"><%=listDoctor.get(i).getServiceTypeName()%></span>
                                            </div>
                                            <div class="text-center">
                                                <button class="btn btn-outline-primary" style="border-radius: 25px"><a class=" nav-link text-info"><strong><%=listNumberBookingDoctor.get(i)%></strong></a></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%}%>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->
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
                <a class="btn btn-primary" href="LogoutController">Logout</a>
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
<style>
    .container1,.flip-box,.front,.back {
        width: 100%;
        height: 770px;
    }
    .container1{
        background-image: url('https://assets.hongkiat.com/uploads/minimalist-dekstop-wallpapers/non-4k/original/26.jpg?3');
    }

    .container1,.flip_box {
        position: relative;
    }

    .front,.back {
        position: absolute;
        -webkit-backface-visibility: hidden;
        -moz-backface-visibility: hidden;
        backface-visibility: hidden;
    }

    .flip_box {
        transition: all 0.5s ease-out;
        -webkit-transform-style: preserve-3d;
        -moz-transform-style: preserve-3d;
        transform-style: preserve-3d;
    }
    .back {
        -webkit-transform: rotateY(180deg);
        -moz-transform: rotateY(180deg);
        -ms-transform: rotateY(180deg);
        transform: rotateY(180deg);
    }
    .flipped {
        -webkit-transform: rotateY(-180deg);
        -moz-transform: rotateY(-180deg);
        -ms-transform: rotateY(-180deg);
        transform: rotateY(-180deg);
    }

    .r_wrap {
        position: absolute;
        right: 350px;
        bottom: 650px;
    }

    .b_round,.s_round {
        position: absolute;
        right: 0px;
        bottom: 0px;
        width: 52px;
        height: 52px;
        border-radius: 50%;
        background-color: #D21849;
        transition: all 0.2s linear;
    }

    .b_round {
        opacity: 0;
        background-color: #D21849;
    }

    .b_round_hover {
        transform: scale(1.37);
        opacity: 0.4;
    }

    .b_round_back_hover {
        background-color: #F60044;
    }

    .s_round_click {
        transform: scale(1.7);
    }

    .s_round_back {
        background-color: #C30C3D;
    }

    .s_arrow {
        width: 52px;
        height: 52px;
        background-image: url('https://img-fotki.yandex.ru/get/194549/29644339.5/0_d6c60_1d7815f0_orig');
        background-color: transparent;
        transition: all 0.35s linear;
    }

    .s_arrow_rotate {
        transform: rotate(-180deg);
    }
</style>
</body>

</html>
