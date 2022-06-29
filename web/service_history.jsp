<%-- 
    Document   : service_history
    Created on : Jun 28, 2022, 8:43:01 PM
    Author     : Doan
--%>

<%@page import="services.ServiceDTO"%>
<%@page import="doctors.DoctorDTO"%>
<%@page import="schedule.scheduleDTO"%>
<%@page import="java.lang.Object"%>
<%@page import="bookingdetail.BookingDetailDTO"%>
<%@page import="java.util.List"%>
<%@page import="patients.PatientDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DentaCare</title>
    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/aos.css">
    <link rel="stylesheet" href="css/ionicons.min.css">
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/product.css">
    <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@10.10.1/dist/sweetalert2.min.css'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="css/menu.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css"
        integrity="sha512-wnea99uKIC3TJF7v4eKk4Y+lMz2Mklv18+r4na2Gn1abDRPPOeef95xTzdwGD9e6zXJBteMIhZ1+68QC5byJZw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        .app-color-blue-1 {
            color: #346EE1;
        }

        .app-color-blue-3 {
            color: #A0B4D6;
        }

        .app-color-black {
            color: #0d0f13;
        }

        .app-color-gray-1 {
            color: #0f1011;
        }

        .app-color-red {
            color: #949AA7;
        }

        .app-bg-blue-1 {
            background: #346EE1;
        }

        .app-bg-blue-2 {
            background: #F5F9FC;
        }

        .app-button-shadow {
            box-shadow: 0px 5px 10px 0px rgb(145 167 210 / 25%);
        }

        .app-bg-blue-3 {
            background: #4A7AE5;
        }

        .app-bg-blue-4 {
            background: #518AEA;
        }

        .app-bg-white-1 {
            background: #F4F8F9;
        }

        .app-color-yellow-1 {
            color: #D7AC67;
        }

        .app-bg-yellow-2 {
            background: #FFF9EB;
        }

        .app-bg-yellow-3 {
            background: #FFBE4E;
        }

        .app-color-red-1 {
            color: #d3274c;
        }

        .app-bg-red-2 {
            background: #FEF5F6;
        }

        .app-color-green {
            color: #0CBDA8;
        }
        table{
            overflow-y: scroll;
        }
    </style>
</head>

<body>
    <%
            String loginPatient = ((PatientDTO) session.getAttribute("LOGIN_PATIENT")).getFullName();
        List<BookingDetailDTO> listBooking= (List<BookingDetailDTO>)request.getAttribute("ListBooking");
     List<scheduleDTO> listSchedule =(List<scheduleDTO>)request.getAttribute("listSchedule");
     List<DoctorDTO>listDoctor = (List<DoctorDTO>) request.getAttribute("listDoctor");
     List<ServiceDTO>listService = (List<ServiceDTO>) request.getAttribute("listService");
     int demm=0;
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
                    <li class="nav-item active"><a href="home.jsp" class="nav-link">Trang chủ</a></li>
                    <li class="nav-item"><a href="about.html" class="nav-link">Thông tin</a></li>
                    <li class="nav-item dropdown"><a href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle">Dịch vụ</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a href="" class="dropdown-item nav-link text-primary">serviceType1</a>
                            <a href="" class="dropdown-item nav-link text-primary">serviceType2</a>
                            <a href="" class="dropdown-item nav-link text-primary">serviceType2</a>
                        </div>

                    </li>
                    <li class="nav-item"><a href="doctors.html" class="nav-link">Bác sĩ</a></li>
                    <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
                    <li class="nav-item"><a href="contact.html" class="nav-link">Liên hệ</a></li>
                    <li class="nav-item dropdown"><a href="LogoutController" id="navbarDropdown" role="button" data-toggle="dropdown"
                                                         aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle"><%=loginPatient%></a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a href="LogoutController" class="dropdown-item nav-link text-primary text-center">Đăng xuất</a>
                                <a href="admin_Account.jsp" class="dropdown-item nav-link text-primary text-center">Hồ sơ cá nhân</a>
                            </div>
                        </li>
                    <li class="nav-item cta"><a href="contact.html" class="nav-link" data-toggle="modal"
                            data-target="#modalRequest"><span>Đặt lịch khám</span></a></li>
                </ul>
            </div>
        </div>
    </nav>
                            
    <!-- END nav -->

    <section class="home-slider owl-carousel">
        <div class="slider-item bread-item" style="background-image: url('images/bg_1.jpg');"
            data-stellar-background-ratio="0.5">
            <div class="overlay"></div>
            <div class="container" data-scrollax-parent="true">
                <div class="row slider-text align-items-end">
                    <div class="col-md-7 col-sm-12 ftco-animate mb-5">
                        <p class="breadcrumbs" data-scrollax=" properties: { translateY: '70%', opacity: 1.6}"><span
                                class="mr-2"><a href="index.html">Trang chủ</a></span> <span>Dịch vụ</span></p>
                        <h1 class="mb-3" data-scrollax=" properties: { translateY: '70%', opacity: .9}">Our Service
                            Keeps you Smile</h1>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!<!-- Toast thông báo đăng ký lịch thành công -->

        <%
            String msg = (String) request.getAttribute("CANCEL_SUCCES");
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
         <!<!-- Toast đánh giá feedback thành công -->

        <%
            String msg1 = (String) request.getAttribute("CREATE_FB_SUCCES");
            if (msg1 == null) {
                msg1 = "";
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
                <%=msg1%>
            </div>
        </div>

        <%}%>    
        
    <section class="ftco-section">
        <div class="container overflow-hidden rounded-2xl">
            <div class="flex flex-row bg-white items-center">
                <div class="app-bg-blue-1 px-6 py-3">
                    <span class="text-lg text-white font-bold"><%=loginPatient%></span>
                </div>

                <div class="flex flex-row pl-5 items-center mr-auto">
                    <div class="h-9 w-9 app-bg-blue-2 flex justify-center items-center rounded-xl">
                        <svg class="w-6 h-6 app-color-blue-1" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                            xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z">
                            </path>
                        </svg>
                    </div>
                    <div class="flex flex-col pl-5">
                        <span class="font-semibold text-lg app-color-black">Lịch Hẹn Của Bạn</span>
                    </div>
                </div>
            </div>
            <div class="flex flex-col app-bg-white-1 px-12 pb-10">
                <div class="flex flex-row py-5">
                    <span class="text-lg font-bold app-color-black">Danh Sách:</span>
                </div>

                <div class="flex flex-row bg-white p-10 relative">
                    <div class="absolute app-bg-yellow-3 text-xs font-semibold px-3 py-0.5 rounded-br-md rounded-tl-md text-white"
                        style="top: 76px;">New</div>
                    <table class="w-full table-striped ">
                        <thead>
                            <tr>
                                <th class="text-left text-xs app-color-black pb-5">STT</th>
                                <th class="text-left text-xs app-color-black pb-5">BÁC SĨ</th>
                                <th class="text-left text-xs app-color-black pb-5">DỊCH VỤ</th>
                                <th class="text-left text-xs app-color-black pb-5">NGÀY ĐẶT</th>
                                <th class="text-left text-xs app-color-black pb-5">GIỜ HẸN</th>
                                <th class="text-left text-xs app-color-black pb-5">TRẠNG THÁI</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                             <%for(BookingDetailDTO bk:listBooking){%> 
                                 <%for(scheduleDTO sche:listSchedule){%>
                                 <%if(bk.getScheduleID()==sche.getScheduleID()){%>     
                                 <%for(DoctorDTO dr:listDoctor){  %>                           
                                 <%if(sche.getDoctorID()==dr.getDoctorID()){%>
                                 <%for(ServiceDTO sv:listService){%>
                                 <%if(bk.getServiceID()==sv.getServiceID()){%>
                                 <%if(bk.getStatus()==1){
                                 demm++;%>
                            <tr>

                                <td>
                                    <div
                                        class="flex justify-center items-center rounded-md w-8 h-8 app-bg-yellow-2 app-color-yellow-1 text-lg font-semibold">
                                        <%=demm%></div>
                                </td>
                                  <form class="form<%=demm-1%>" action = "DeleteBookingDetailController">
                                 <input type="hidden" name ='scheduleID' value="<%=sche.getScheduleID()%>">
                                
                                  </form>
                                <td>
                                    <div class="flex flex-row py-3">
                                        <div class="flex flex-col">
                                            <span class="font-semibold text-sm app-color-black"><%=dr.getFullName()%></span>
                                            <span class="font-semibold text-xs app-color-gray-1"><%=dr.getServiceTypeName()%></span>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <span class="font-semibold text-sm app-color-gray-1"><%=sv.getServiceName()%></span>
                                </td>
                                <td>
                                    <span class="font-semibold text-sm app-color-gray-1"><%=sche.getDay()%></span>
                                </td>
                                <td>
                                    <span class="font-semibold text-sm app-color-gray-1"><%int slot= sche.getSlot();
                                        switch (slot) {
                                                case 1:
                                                    %>7:00 - 9:00 am<%
                                                    break;
                                                    case 2:
                                                    %>9:00 - 11:00 am<%
                                                    break;
                                                    case 3:
                                                    %>13:00 - 15:00 pm<%
                                                    break;
                                                    case 4:
                                                    %>15:00 - 17:00 pm<%
                                                    break;
                                                default:
                                                    throw new AssertionError();
                                            }
                                       %></span>
                                </td>
                                <td>
                                    <div
                                        class="app-bg-red-2 h-8 w-28 font-semibold text-sm flex justify-center items-center app-color-red-1 rounded-md">
                                        Đang Đặt
                                    </div>
                                </td>
                                <td>
                                    <button class="btn btn-danger delete1">Hủy</button>
                                </td>
                            </tr>
                             <%}}}}}}}}%>
                             <%for(BookingDetailDTO bk:listBooking){%> 
                                 <%for(scheduleDTO sche:listSchedule){%>
                                 <%if(bk.getScheduleID()==sche.getScheduleID()){%>     
                                 <%for(DoctorDTO dr:listDoctor){%>   
                                 <%if(sche.getDoctorID()==dr.getDoctorID()){%>
                                 <%for(ServiceDTO sv:listService){%>
                                 <%if(bk.getServiceID()==sv.getServiceID()){%>
                                 <%if(bk.getStatus()==2){
                                 demm++;%>
                                 <tr>
                                <td>
                                    <div
                                        class="mr-4 w-8 h-8 rounded-md flex items-center justify-center app-bg-yellow-2 app-color-yellow-1 text-lg font-semibold">
                                        <%=demm%></div>
                                </td>
                                <td>
                                    <div class="flex flex-row items-center py-3">
                                        <div class="flex flex-col">
                                            <span class="font-semibold text-sm app-color-black"><%=dr.getFullName()%></span>
                                            <span class="font-semibold text-xs app-color-gray-1"><%=dr.getServiceTypeName()%></span>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <span class="font-semibold text-sm app-color-gray-1"><%=sv.getServiceName()%></span>
                                </td>
                                <td>
                                    <span class="font-semibold text-sm app-color-gray-1"><%=sche.getDay()%></span>
                                </td>
                                <td>
                                     <span class="font-semibold text-sm app-color-gray-1"><%int slot= sche.getSlot();
                                        switch (slot) {
                                                case 1:
                                                    %>7:00 - 9:00 am<%
                                                    break;
                                                    case 2:
                                                    %>9:00 - 11:00 am<%
                                                    break;
                                                    case 3:
                                                    %>13:00 - 15:00 pm<%
                                                    break;
                                                    case 4:
                                                    %>15:00 - 17:00 pm<%
                                                    break;
                                                default:
                                                    throw new AssertionError();
                                            }
                                       %></span>
                                </td>
                                <td>
                                    <div
                                        class="h-8 w-28 font-semibold text-sm app-bg-blue-2 flex items-center justify-center app-color-blue-1 rounded-md">
                                        Hoàn Thành
                                    </div>
                                </td>
                                <td>
                                    <button class="btn btn-success" data-toggle="modal" data-target="#form">Đánh
                                        Giá</button>
                                </td>
                            </tr>
                            
                            <!-- Modal -->
    <div class="modal fade" id="form" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog  modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header border-bottom-0">
                    <h5 class="modal-title" id="exampleModalLabel" style="color: white;">Đánh Giá Dịch Vụ</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <form class="review-form" action="CreateFeedBackController">
                        <div class="form-group">
                            <label style="color:#518AEA; font-size: 20px;">Đánh giá mức độ hài lòng của bạn:</label>
                            <div class="reviews-counter" style="text-align: center;">
                                <div class="rate" name="rateStart">
                                    <input type="radio" id="star5" name="rate" value="5" />
                                    <label for="star5" title="text">5 stars</label>
                                    <input type="radio" id="star4" name="rate" value="4" />
                                    <label for="star4" title="text">4 stars</label>
                                    <input type="radio" id="star3" name="rate" value="3" />
                                    <label for="star3" title="text">3 stars</label>
                                    <input type="radio" id="star2" name="rate" value="2" />
                                    <label for="star2" title="text">2 stars</label>
                                    <input type="radio" id="star1" name="rate" value="1" />
                                    <label for="star1" title="text">1 star</label>
                                    <input type="hidden" name ="serviceID" value="<%=sv.getServiceID()%>">
                                    
                                </div>
                            </div>
                           
                        </div>
                        <div class="form-group" style="padding:15px 0;">
                            <h4 style="color:#518AEA; font-size: 20px;">Lời nhận xét:</h4>
                            <textarea name="content" id="content" class="form-control" rows="4"></textarea>
                        </div>

                        <button class="btn btn-outline-primary">Gửi đánh giá</button>
                        <button data-dismiss="modal" aria-label="Close" class="btn btn-outline-danger">Hủy đánh
                            giá</button>
                    </form>
                </div>
            </div>
        </div>

                               <%}}}}}}}}%>
                            
                             

                        </tbody>
                    </table>
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
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia,
                            there live the blind texts.</p>
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
                                <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about</a>
                                </h3>
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
                                <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about</a>
                                </h3>
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
                                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain
                                        View, San Francisco, California, USA</span></li>
                                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929
                                            210</span></a></li>
                                <li><a href="#"><span class="icon icon-envelope"></span><span
                                            class="text">info@yourdomain.com</span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 text-center">

                    <p>Copyright &copy;
                        <script>document.write(new Date().getFullYear());</script> All rights reserved </a>
                    </p>
                </div>
            </div>
        </div>
    </footer>
    
       <script src="ckeditor/ckeditor.js"></script>
       <script>
            
            var editor = CKEDITOR.replace('content');
            CKFinder.setupCKEditor(editor, 'ckfinder/');
            data["content"] = editor.getData();
            CKEDITOR.editorConfig = function( config ) {
    config.removePlugins = 'elementspath,save,font';
    };
            CKEDITOR.replace( 'editor', {
            extraPlugins: 'testplugin'
                } );
        </script>                          
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
    <script src="js/scrollax.min.js"></script>
    <script src="js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.1/dist/sweetalert2.all.min.js"></script>
   
      
         <script>
                const formatDate = (xx) => {
                const d = new Date(xx);
                let mm = d.getMonth() + 1; // Months start at 0!
                let dd = d.getDate();
                if (dd < 10) dd = "0" + dd;
                if (mm < 10) mm = "0" + mm;
                 return (m = [d.getFullYear(),mm,dd  ].join("-"));
        };
//// Add input currentDay into form modal for feedback
                 var day= new Date();
                 var m= formatDate(day);
                 const curr=document.createElement("input");
                 curr.type='hidden';
                 curr.name='currentDay';
                 curr.value=m;
                 var formFeedBack=document.getElementsByClassName('review-form');
                 formFeedBack[0].appendChild(curr);
                 
        function toastClose() {
                                    var toast1 = document.getElementById("toast-msg");
                                    toast1.style.display = "none";
                                }
       
        var list = document.querySelectorAll(".delete1");
        for(let i=0;i<list.length;i++){
            list[i].addEventListener("click", function () {
            Swal.fire({
                title: "Bạn chắc muốn hủy lịch đặt",
                type: "info",
                confirmButtonText: "Hủy",
                showCancelButton: true, 
                confirmButtonColor: "#ff0055",
                cancelButtonColor: "#999999",
                reverseButtons: true,
                focusConfirm: false,
                focusCancel: true
            }).then(function (isConfirm){
                if(isConfirm){
                 var form =document.getElementsByClassName("form"+i);
                 form[0].submit();
            }
            })
        });
        }
         
    </script>
</body>

</html>