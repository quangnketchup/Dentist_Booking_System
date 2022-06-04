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
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
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
                        <li class="nav-item"><a href="#" class="nav-link">Dịch vụ</a></li>
                        <li class="nav-item"><a href="admin_User.html" class="nav-link">User</a></li>
                        <li class="nav-item"><a href="#" class="nav-link">FeedBack</a></li>
                        <li class="nav-item"><a href="#" class="nav-link">Bác sĩ</a></li>
                        <li class="nav-item"><a href="#" class="nav-link">Booking</a></li>
                        <li class="nav-item"><a href="#" class="nav-link">Đăng xuất</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- END nav -->

        <%
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <%=error%>
        <section class="home-slider owl-carousel">
            <div class="slider-item bread-item" style="background-image: url('images/bg_1.jpg');"
                 data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
            </div>
        </section>

        <section class="ftco-section contact-section ftco-degree-bg">
            <!--service type theo service-->
            <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h2>Category</h2>
                            <div class="card-body"> 
                                <c:forEach items="${sessionScope.LIST_SERVICE_TYPE}" var="serviceType">
                                    <div>
                                        <div>
                                            <h4><a href="ServiceTypeController?serviceTypeID=${serviceType.serviceTypeID}">${serviceType.serviceTypeName}</a></h4>
                                        </div>
                                    </div>				
                                </c:forEach>
                            </div><!--/service Type-service-->
                        </div>
                    </div>
            </div>
            <div class="container">
                <div class="row block-9">
                    <div class="col-md-3 pr-md-5">
                        <form action="#">
                            <div>
                                <h3>Tìm dịch vụ:</h3>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Nhập tên">
                            </div>
                            <div class="form-group">
                                <input type="submit" value="Search" class="btn btn-sm btn-primary py-3 px-5">
                            </div>
                        </form>
                    </div>
                    <div class="col-md-9">
                        <form action="">
                            <div class="card-body">
                                <%
                                    List<ServiceDTO> listService = (List<ServiceDTO>) request.getAttribute("LIST_SERVICE");
                                    if (listService != null) {
                                        if (listService.isEmpty()) {
                                %>

                                <table id="table_id" class="table table-bordered table-hover text-align-center">
                                    <thead class="bg-light align-content-center">
                                        <tr>
                                            <th>Số thứ tự</th>
                                            <th class="col-md-1">ID</th>
                                            <th>Tên dịch vụ</th>
                                            <th>Giá</th>
                                            <th>Mô tả</th>
                                            <th>Link ảnh</th>
                                            <th>Status</th>
                                            <th>Update</th>
                                        </tr>
                                    </thead>
                                    <tbody class="align-content-around">
                                        <%
                                            int count = 1;
                                            for (ServiceDTO service : listService) {
                                        %>
                                    <form action="MainController">
                                        <tr>
                                            <td><%=count++%></td>
                                            <td><%=service.getServiceID()%></td>
                                            <td><%=service.getServiceName()%></td>
                                            <td><%=service.getServicePrice()%></td>
                                            <td><%=service.getDescription()%></td>
                                            <td><%=service.getImage()%></td>
                                            <td><%=service.getStatus()%></td>
                                            <td><button class="btn btn-group">
                                                    <td>
                                                        <input type="hidden" name="serviceID" value="<%=service.getServiceID()%>"/>
                                                        <input type="hidden" name="serviceName" value="<%=service.getServiceName()%>"/>
                                                        <input type="hidden" name="servicePrice" value="<%=service.getServicePrice()%>"/>
                                                        <input type="hidden" name="description" value="<%=service.getDescription()%>"/>
                                                        <input type="hidden" name="image" value="<%=service.getImage()%>"/>
                                                        <input type="hidden" name="status" value="<%=service.getStatus()%>"/>
                                                        <input type="submit"  name="action" value="UpdateService"/>
                                                    </td>
                                                </button></td>
                                        </tr>
                                    </form>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>Rendering engine</th>
                                            <th>Browser</th>
                                            <th>Platform(s)</th>
                                            <th>Engine version</th>
                                            <th>CSS grade</th>
                                        </tr>
                                    </tfoot>
                                    <%
                                        }
                                    %>
                                    </form>
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
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
    <script src="js/aos.js"></script>
    <script src="js/jquery.animateNumber.min.js"></script>
    <script src="js/bootstrap-datepicker.js"></script>
    <script src="js/jquery.timepicker.min.js"></script>
    <script src="js/scrollax.min.js"></script>
    <script src="js/main.js"></script>
    <script>
                            $(document).ready(function () {
                                $('#table_id').DataTable();
                            });
    </script>

</body>
</html>
