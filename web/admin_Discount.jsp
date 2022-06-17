<%@page import="admins.AdminDTO"%>
<%@page import="discounts.DiscountDTO"%>
<%@page import="java.util.List"%>
<%@ page import="java.lang.Math" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

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
                        <li class="nav-item "><a href="ShowServiceController" class="nav-link">Dịch vụ</a></li>
                        <li class="nav-item "><a href="admin_User.jsp" class="nav-link">Bệnh nhân</a></li>
                        <li class="nav-item"><a href="admin_Feedback.html" class="nav-link">Phản hồi</a></li>
                        <li class="nav-item"><a href="ShowDoctorController" class="nav-link">Bác sĩ</a></li>
                        <li class="nav-item"><a href="admin_Booking.html" class="nav-link">Đặt lịch</a></li>
                        <li class="nav-item"><a href="admin_Discount.jsp" class="nav-link">Khuyến mãi</a></li>
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

        <section class="ftco-section contact-section ftco-degree-bg">
            <div class="container">

                <div class="col-md-5 pr-md-5">
                    <div>
                        <h3 class="text-primary">Quản lí khuyến mãi:</h3>
                    </div>
                </div>

                <div class="col-md-5 pr-md-5">
                    <div class="btn-group">
                        <form action="SearchDiscountController">
                            <input type="search" class="form" name="title">
                            <input class="btn" style="background: #2f89fc; color: white; margin-right: 5px " type="submit" value="Tìm kiếm mã giảm giá">
                        </form>                        
                    </div>
                </div>

                <div class="col-md-12">                   
                    <div class="card-body">
                        <%
                            List<discounts.DiscountDTO> listSearchDiscount = (List<DiscountDTO>) request.getAttribute("SEARCH_DISCOUNT");
                            if (listSearchDiscount != null) {
                                List<discounts.DiscountDTO> listDiscount = listSearchDiscount;
                        %>
                        <table id="table_id" class="table table-bordered table-hover text-align-center">
                            <thead class="bg-light align-content-center">
                                <tr>
                                    <th>Mã khuyến mãi</th>
                                    <th>Chủ đề</th>
                                    <th>Mô tả</th>
                                    <th>Phần trăm khuyến mãi</th>
                                    <th>Trạng thái</th>
                                    <th>Hình ảnh</th>
                                    <th>Ngày tạo mã</th>
                                    <th>Ngày hết hạn</th>                                     
                                    <th>Admin quản lí</th>
                                    <th>Cập nhật</th>
                                </tr>
                            </thead>
                            <tbody class="align-content-around">
                                <%
                                    int count = 1;
                                    for (DiscountDTO discount : listDiscount) {
                                %>
                            <form action="UpdateDiscountController">
                                <tr>
                                    <td><input type="text" name="discountID" value="<%=discount.getDiscountID()%>" class="form-control-plaintext" readonly/></td>
                                    <td><input type="text" name="title" value="<%=discount.getTitle()%>" class="form-control-plaintext" readonly/></td>
                                    <td><input type="text" name="description" value="<%=discount.getDescription()%>" class="form-control-plaintext" readonly/></td>
                                    <td><input type="text" name="percentDiscount" value="<%=discount.getPercentDiscount()%>" class="form-control-plaintext" readonly/></td>
                                    <td>
                                        <select name ="status">
                                            <option selected value="<%=discount.getStatus()%>"><%if (discount.getStatus() == 1) {%>Đang khuyến mại<%} else {%>Đã hết hạn<%}%></option>
                                            <option value="<%=Math.abs(discount.getStatus() - 1)%>"><%if (discount.getStatus() == 0) {%>Đang khuyến mại<%} else {%>Đã hết hạn<%}%></option>
                                        </select>    
                                    </td>
                                    <td><input type="text" name="image" value="<%=discount.getImage()%>" class="form-control-plaintext" readonly ></td>

                                    <td><input type="text" name="createDate" value="<%=discount.getCreateDate()%>" class="form-control-plaintext" readonly/></td>
                                    <td><input type="text" name="expiredDate" value="<%=discount.getExpiredDate()%>" class="form-control-plaintext" readonly/></td>
                                    <td>
                                        <%=discount.getAdminID()%>
                                    </td>                                    

                                    <td><input type="submit" class="btn btn-block btn-outline-success" name="action" value="Update Discount"></td>
                                </tr>
                            </form>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                        <%
                        } else {
                            List<DiscountDTO> listDiscount = (List<DiscountDTO>) session.getAttribute("LIST_DISCOUNT");
                            if (listDiscount != null) {
                                if (!listDiscount.isEmpty()) {
                        %>

                        <table id="table_id" class="table table-bordered table-hover text-align-center">
                            <thead class="bg-light align-content-center">
                                <tr>
                                    <th>Mã khuyến mãi</th>
                                    <th>Chủ đề</th>
                                    <th>Mô tả</th>
                                    <th>Phần trăm khuyến mãi</th>
                                    <th>Trạng thái</th>
                                    <th>Hình ảnh</th>
                                    <th>Ngày tạo mã</th>
                                    <th>Ngày hết hạn</th>                                     
                                    <th>Admin quản lí</th>
                                    <th>Cập nhật</th>
                                </tr>
                            </thead>
                            <tbody class="align-content-around">
                                <%
                                    int count = 1;
                                    for (DiscountDTO discount : listDiscount) {
                                %>
                            <form action="UpdateDiscountController">
                                <tr>
                                    <td><input type="text" name="discountID" value="<%=discount.getDiscountID()%>" class="form-control-plaintext" readonly/></td>
                                    <td><input type="text" name="title" value="<%=discount.getTitle()%>" class="form-control-plaintext" readonly/></td>
                                    <td><input type="text" name="description" value="<%=discount.getDescription()%>" class="form-control-plaintext" readonly/></td>
                                    <td><input type="text" name="percentDiscount" value="<%=discount.getPercentDiscount()%>" class="form-control-plaintext"/></td>
                                    <td>
                                        <select name ="status">
                                            <option selected value="<%=discount.getStatus()%>"><%if (discount.getStatus() == 1) {%>Đang khuyến mại<%} else {%>Đã hết hạn<%}%></option>
                                            <option value="<%=Math.abs(discount.getStatus() - 1)%>"><%if (discount.getStatus() == 0) {%>Đang khuyến mại<%} else {%>Đã hết hạn<%}%></option>
                                        </select>    
                                    </td>
                                    <td><input type="text" name="image" value="<%=discount.getImage()%>" class="form-control-plaintext" readonly ></td>

                                    <td><input type="text" name="createDate" value="<%=discount.getCreateDate()%>"/></td>
                                    <td><input type="text" name="expiredDate" value="<%=discount.getExpiredDate()%>"/></td>
                                    <td>
                                        <%=discount.getAdminID()%>
                                    </td>                                    

                                    <td><input type="submit" class="btn btn-block btn-outline-success" name="action" value="Update Discount"></td>
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
        <script type="text/javascript" charset="utf8"
        src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
    <UpdateDiscountscript src="js/jquery.animateNumber.min.js"></script>
    <script src="js/bootstrap-datepicker.js"></script>
    <script src="js/jquery.timepicker.min.js"></script>
    <script src="js/scrollax.min.js"></script>
    <script src="js/main.js"></script>
    <script>
                                $(document).ready(function () {
                                    $('#table_id').DataTable();
                                });
                                function toastClose() {
                                    var toast1 = document.getElementById("toast-msg");
                                    toast1.style.display = "none";
                                }
    </script>
</body>

</html>