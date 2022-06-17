
<%@page import="patients.PatientDTO"%>
<%@page import="services.ServiceDTO"%>
<%@page import="serviceTypes.ServiceTypeDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Service</title>
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
            String loginPatient = ((PatientDTO) session.getAttribute("LOGIN_PATIENT")).getFullName();
            List<ServiceTypeDTO> listServiceType = (List<ServiceTypeDTO>) session.getAttribute("LIST_SERVICE_TYPE");
            
        %>
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="home.jsp">Denta<span>Care</span></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active"><a href="home.jsp" class="nav-link">Trang chủ</a></li>
                        <li class="nav-item"><a href="about.html" class="nav-link">Thông tin</a></li>
                        <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dịch vụ</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                
                                <h1>hello</h1>
                            </div>
                        </li>
                        <li class="nav-item"><a href="DoctorController" class="nav-link">Bác sĩ</a></li>
                        <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
                        <li class="nav-item"><a href="contact.html" class="nav-link">Liên hệ</a></li>
                        <li class="nav-item"><a href="login.html" class="nav-link">Đăng nhập</a></li>
                        <li class="nav-item dropdown"><a href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                                         aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle"><%=loginPatient%></a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a href="LogoutController" class="dropdown-item nav-link text-primary text-center">Đăng xuất</a>
                                <a href="admin_Account.html" class="dropdown-item nav-link text-primary text-center">Hồ sơ cá nhân</a>
                            </div>
                        </li>
                        <li class="nav-item cta"><a href="contact.html" class="nav-link" data-toggle="modal" data-target="#modalRequest"><span>Đặt lịch khám</span></a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- END nav -->

        <section class="home-slider owl-carousel">
            <div class="slider-item bread-item" style="background-image: url('images/bg_1.jpg');" data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
                <div class="container" data-scrollax-parent="true">
                    <div class="row slider-text align-items-end">
                        <div class="col-md-7 col-sm-12 ftco-animate mb-5">
                            <p class="breadcrumbs" data-scrollax=" properties: { translateY: '70%', opacity: 1.6}"><span class="mr-2"><a href="index.html">Trang chủ</a></span> <span>Dịch vụ</span></p>
                            <h1 class="mb-3" data-scrollax=" properties: { translateY: '70%', opacity: .9}">Our Service Keeps you Smile</h1>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section">
            <div class="container">
                <div class="col-md-10 offset-1 mb-3">
                    <div class="btn-group">
                        <form action="SearchServiceHomeController">
                            <input type="search" style="width: 350px" class="form" name="serviceName">
                            <input class="btn" style="background: #2f89fc; color: white; margin-right: 5px " type="submit" value="Tìm kiếm dịch vụ">
                        </form>
                    </div>
                </div>
                <div class="container">
                    <div class="row justify-content-center mb-5 pb-5">
                        <div class="col-md-7 text-center heading-section ftco-animate">
                            <h2 class="mb-2">Our Service Keeps you Smile</h2>
                            <p>Nổ lực để mang tới dịch vụ tốt nhất cho bạn.</p>
                        </div>
                    </div>
                </div>
                <%
                    
                    List<ServiceDTO> listsvbySVType = (List<ServiceDTO>) session.getAttribute("LIST_SERVICE_BY_SVTYPE");
                    if (listsvbySVType != null) {
                    List<ServiceDTO> listService = listsvbySVType;
                %>
                <form>
                    <div class="row">
                        <%
                            if (listService != null) {
                                for (ServiceDTO service : listService) {
                                    if (service.getStatus() != 1) {
                        %>
                        <div class="col-md-3">
                            <div class="card card-body mb-4 border-primary" style="border-radius: 10px ; background-color: #85b0e9;">
                                <div class="services text-center ">
                                    <h5  style="height: 50px ; color: white; font-family: Arial, Helvetica, sans-serif;"><%=service.getServiceName()%></h5>
                                    <div>
                                        <img style="width: 200px;height:150px; vertical-align: middle;margin-bottom: 12px; border-radius: 10px ; " src="<%=service.getImage()%>">
                                    </div>
                                    <p style="color: white"><%=service.getServicePrice()%> VND</p>
                                    <button class="btn btn-light"><a class="nav-link text-info" data-toggle="modal" data-target="#service<%=service.getServiceID()%>"><span>Chi Tiết</span></a></button>

                                </div>
                            </div>

                        </div>
                        <%
                                    }
                                }
                            }
                        %>
                    </div>
                </form>

                <%
                } else {
                    List<ServiceDTO> listService = (List<ServiceDTO>) request.getAttribute("LIST_SERVICE");
                %>
                <form>
                    <div class="row">
                        <%
                            if (listService != null) {
                                for (ServiceDTO service : listService) {
                                    if (service.getStatus() == 1) {
                        %>
                        <div class="col-md-3">
                            <div class="card card-body mb-4 border-primary" style="border-radius: 10px ; background-color: #85b0e9;">
                                <div class="services text-center ">
                                    <h5  style="height: 50px ; color: white; font-family: Arial, Helvetica, sans-serif;"><%=service.getServiceName()%></h5>
                                    <div>
                                        <img style="width: 200px;height:150px; vertical-align: middle;margin-bottom: 12px; border-radius: 10px ; " src="<%=service.getImage()%>">
                                    </div>
                                    <p style="color: white"><%=service.getServicePrice()%> VND</p>
                                    <button class="btn btn-light"><a class="nav-link text-info" data-toggle="modal" data-target="#service<%=service.getServiceID()%>"><span>Chi Tiết</span></a></button>

                                </div>
                            </div>

                        </div>
                        <%
                                    }
                                }
                            }
                        %>
                    </div>
                </form>
                <%
                    }
                %>
            </div>
        </section>


        <!-- Section của sale -->
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center mb-5 pb-5">
                    <div class="col-md-7 text-center heading-section ftco-animate">
                        <h2 class="mb-3">Our Best Pricing</h2>
                        <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 ftco-animate">
                        <div class="pricing-entry pb-5 text-center">
                            <div>
                                <h3 class="mb-4">Basic</h3>
                                <p><span class="price">$24.50</span> <span class="per">/ session</span></p>
                            </div>
                            <ul>
                                <li>Diagnostic Services</li>
                                <li>Professional Consultation</li>
                                <li>Tooth Implants</li>
                                <li>Surgical Extractions</li>
                                <li>Teeth Whitening</li>
                            </ul>
                            <p class="button text-center"><a href="#" class="btn btn-primary btn-outline-primary px-4 py-3">Order now</a></p>
                        </div>
                    </div>
                    <div class="col-md-3 ftco-animate">
                        <div class="pricing-entry pb-5 text-center">
                            <div>
                                <h3 class="mb-4">Standard</h3>
                                <p><span class="price">$34.50</span> <span class="per">/ session</span></p>
                            </div>
                            <ul>
                                <li>Diagnostic Services</li>
                                <li>Professional Consultation</li>
                                <li>Tooth Implants</li>
                                <li>Surgical Extractions</li>
                                <li>Teeth Whitening</li>
                            </ul>
                            <p class="button text-center"><a href="#" class="btn btn-primary btn-outline-primary px-4 py-3">Order now</a></p>
                        </div>
                    </div>
                    <div class="col-md-3 ftco-animate">
                        <div class="pricing-entry active pb-5 text-center">
                            <div>
                                <h3 class="mb-4">Premium</h3>
                                <p><span class="price">$54.50</span> <span class="per">/ session</span></p>
                            </div>
                            <ul>
                                <li>Diagnostic Services</li>
                                <li>Professional Consultation</li>
                                <li>Tooth Implants</li>
                                <li>Surgical Extractions</li>
                                <li>Teeth Whitening</li>
                            </ul>
                            <p class="button text-center"><a href="#" class="btn btn-primary btn-outline-primary px-4 py-3">Order now</a></p>
                        </div>
                    </div>
                    <div class="col-md-3 ftco-animate">
                        <div class="pricing-entry pb-5 text-center">
                            <div>
                                <h3 class="mb-4">Platinum</h3>
                                <p><span class="price">$89.50</span> <span class="per">/ session</span></p>
                            </div>
                            <ul>
                                <li>Diagnostic Services</li>
                                <li>Professional Consultation</li>
                                <li>Tooth Implants</li>
                                <li>Surgical Extractions</li>
                                <li>Teeth Whitening</li>
                            </ul>
                            <p class="button text-center"><a href="#" class="btn btn-primary btn-outline-primary px-4 py-3">Order now</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <footer class="ftco-footer ftco-bg-dark ftco-section">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-md-3">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">DentaCare.</h2>
                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                        </div>
                        <ul class="ftco-footer-social list-unstyled float-md-left float-lft ">
                            <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                            <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                            <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                        </ul>
                    </div>
                    <div class="col-md-2">
                        <div class="ftco-footer-widget mb-4 ml-md-5">
                            <h2 class="ftco-heading-2">Quick Links</h2>
                            <ul class="list-unstyled">
                                <li><a href="about.html" class="py-2 d-block">About</a></li>
                                <li><a href="doctors.html" class="py-2 d-block">Doctors</a></li>
                                <li><a href="blog.html" class="py-2 d-block">Blog</a></li>
                                <li><a href="contact.html" class="py-2 d-block">Contact</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4 pr-md-4">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Recent Blog</h2>
                            <div class="block-21 mb-4 d-flex">
                                <a class="blog-img mr-4" style="background-image: url(images/image_1.jpg);"></a>
                                <div class="text">
                                    <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about</a></h3>
                                    <div class="meta">
                                        <div><a href="#"><span class="icon-calendar"></span> Sept 15, 2018</a></div>
                                        <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                                        <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                                    </div>
                                </div>
                            </div>
                            <div class="block-21 mb-4 d-flex">
                                <a class="blog-img mr-4" style="background-image: url(images/image_2.jpg);"></a>
                                <div class="text">
                                    <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about</a></h3>
                                    <div class="meta">
                                        <div><a href="#"><span class="icon-calendar"></span> Sept 15, 2018</a></div>
                                        <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                                        <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Office</h2>
                            <div class="block-23 mb-3">
                                <ul>
                                    <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
                                    <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
                                    <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center">

                        <p>Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved </a></p>
                    </div>
                </div>
            </div>
        </footer>


        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
            <%
                List<ServiceDTO> listService = (List<ServiceDTO>) request.getAttribute("LIST_SERVICE");
                for (ServiceDTO service : listService) {
            %>
        <div  class="modal fade" id="service<%=service.getServiceID()%>" tabindex="-1" role="dialog" aria-labelledby="modalRequestLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalRequestLabel">Thông Tin Dịch Vụ</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="appointment_name" style="color:black"><%=service.getServiceName()%></label>
                            </div>
                            <div class="form-group">
                                <label for="appointment_email" style="color:black"><%=service.getServicePrice()%> VND</label>
                            </div>
                            <div class="form-group">
                                <img style="width: 200px;height:150px; vertical-align: middle; " src="<%=service.getImage()%>">
                            </div>
                            <div class="form-group">
                                <label for="appointment_email" style="color:black"><%=service.getDescription()%></label>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <%}%>

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

    </body>
</html>
