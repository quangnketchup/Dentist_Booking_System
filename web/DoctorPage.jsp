<%-- 
    Document   : DoctorPage
    Created on : Jun 26, 2022, 3:50:38 PM
    Author     : Doan
--%>

<%@page import="doctors.DoctorDTO"%>
<%@page import="schedule.scheduleDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Bác sĩ</title>
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
        <link rel="stylesheet" href="css/menu.css">
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
       <link rel="stylesheet" href="css/dentistPage.css">
    </head>
    <body>
        <%DoctorDTO login = (DoctorDTO) session.getAttribute("LOGIN_DOCTOR");%>
         <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="home.jsp">Denta<span>Care</span></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                        aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item "><a href="#" class="nav-link sa">Thời gian biểu</a></li>
                        <li class="nav-item dropdown"><a href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                                         aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle"><%=login.getFullName()%></a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a href="LogoutController" class="dropdown-item nav-link text-primary text-center">Đăng xuất</a>
                                <a href="admin_Account.jsp" class="dropdown-item nav-link text-primary text-center">Hồ sơ cá nhân</a>
                            </div>
                        </li>
                         
                    </ul>
                </div>
            </div>
        </nav>       
          <section class="home-slider owl-carousel">
            <div class="slider-item bread-item" style="background-image: url('images/bg_1.jpg');"
                 data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
            </div>
        </section>
              <!<!-- Toast thông báo đăng ký lịch thành công -->

            <%
                String msg = (String) request.getAttribute("ADD_SLOT_SUCCES");
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
                            
        <% List<scheduleDTO>  scheduleList= (List<scheduleDTO>)request.getAttribute("listScheduleDTO");
        int dem=0;
        %>
        
        <div class="schedule ">
            <%
            
            for(scheduleDTO schedule:scheduleList){
            dem++;%>
            <div id="schedule-day<%=dem%>"><%=schedule.getDay()%> </div>       
            <div id="schedule-slot<%=dem%>"><%=schedule.getSlot()%> </div>    
            <%
              }%>
              
               <div id="size-schedule"><%=dem%></div>
        </div>
        <div class="container">
            <div class="title-table" style="font-size:24px; color: black">Lịch làm việc của bác sĩ</div>
              <table class="fl-table table">
        <thead>
            <tr >
                <th></th>
                <th>MON</th>
                <th>TUE</th>
                <th>WED</th>
                <th>THU</th>
                <th>FRI</th>
                <th>SAT</th>
                <th>SUN</th>
            </tr>
            <tr id="day" >
                <th class="day"></th>
                                        <th class="day"></th>
                                        <th class="day"></th>
                                        <th class="day"></th>
                                        <th class="day"></th>
                                        <th class="day"></th>
                                        <th class="day"></th>
                                        <th class="day"></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    7:00 - 9:00 am
                </td>
                <td class="ngay1 slot1" ></td>
                <td class="ngay2 slot1"></td>
                <td class="ngay3 slot1" ></td>
                <td class="ngay4 slot1"></td>
                <td class="ngay5 slot1"></td>
                <td class="ngay6 slot1"></td>
                <td class="ngay7 slot1"></td>
            </tr>
            <tr>
                <td>
                    9:00 - 11:00 am
                </td>
                <td class="ngay1 slot2" ></td>
                <td class="ngay2 slot2"></td>
                <td class="ngay3 slot2" ></td>
                <td class="ngay4 slot2"></td>
                <td class="ngay5 slot2"></td>
                <td class="ngay6 slot2"></td>
                <td class="ngay7 slot2"></td>
            </tr>
            <tr >
                <td>
                    13:00 - 15:00 am
                </td>
                <td class="ngay1 slot3" ></td>
                <td class="ngay2 slot3"></td>
                <td class="ngay3 slot3"></td>
                <td class="ngay4 slot3"></td>
                <td class="ngay5 slot3"></td>
                <td class="ngay6 slot3"></td>
                <td class="ngay7 slot3"></td>
            </tr>
            <tr >
                <td>
                    15:00 - 17:00 am
                </td>
                <td class="ngay1 slot4"></td>
                <td class="ngay2 slot4"></td>
                <td class="ngay3 slot4" ></td>
                <td class="ngay4 slot4"></td>
                <td class="ngay5 slot4"></td>
                <td class="ngay6 slot4"></td>
                <td class="ngay7 slot4"></td>
            </tr>                                      
        </tbody>
    </table>
        </div>
        
        
        
    
        
         <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
            <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
            <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
                    stroke="#F96D00" />
            </svg></div>
        
        <!-- Modal -->
        
         <div id="myModal" class="modal">
            <div class="modal-dialog " role="document">
                <!-- Modal content -->
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Bác sĩ muốn đăng ký lịch vào:</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="RegisterSlot" id="form-submit">
                        <div class="modal-body">
                            <input class="doctorID" name="doctorID" value="<%=login.getDoctorID()%>" type="hidden">
                            <div id="schedule-view"></div>
                        </div>  
                        <div class="modal-footer">
                            <input class="btn btn-primary" type="submit" value="Đăng kí đặt lịch" onclick="">
                            <input class="btn btn-danger" type="button" value="Hủy" onclick="cancel()">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
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
        <script src="js/dentistPage.js"></script>
        
    </body>
</html>
