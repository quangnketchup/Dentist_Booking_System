
<%@page import="discounts.DiscountDTO"%>
<%@page import="feedbacks.FeedbackDTO"%>
<%@page import="schedule.scheduleDTO"%>
<%@page import="serviceImage.ServiceImageDTO"%>
<%@page import="serviceTypes.ServiceTypeDTO"%>
<%@page import="doctors.DoctorDTO"%>
<%@page import="admins.AdminDTO"%>
<%@page import="services.ServiceDTO"%>
<%@page import="java.util.List"%>
<%@page import="patients.PatientDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>DentaCare</title>
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
        %>
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="index.html">Denta<span>Care</span></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active"><a href="home.jsp" class="nav-link">Trang chủ</a></li>
                        <li class="nav-item"><a href="about.html" class="nav-link">Thông tin</a></li>
                        <li class="nav-item dropdown"><a href="MainController?action=Load" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle">Dịch vụ</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <%
                                    List<ServiceTypeDTO> listServiceType = (List<ServiceTypeDTO>) request.getAttribute("LIST_SERVICE_BY_SVTYPE");
                                    if (listServiceType != null) {
                                        for (ServiceTypeDTO svType : listServiceType) {
                                %>	
                                <a class="dropdown-item nav-link text-primary" href="ServiceTypeHomeController?serviceTypeID=<%=svType.getServiceTypeID()%>"><%=svType.getServiceTypeName()%></a>
                                <%
                                        }
                                    }
                                %>
                            </div>
                        </li>
                        <li class="nav-item"><a href="LoadDoctorController" class="nav-link">Bác sĩ</a></li>
                        <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
                        <li class="nav-item"><a href="contact.html" class="nav-link">Liên hệ</a></li>
                        <li class="nav-item dropdown"><a href="LogoutController" id="navbarDropdown" role="button" data-toggle="dropdown"
                                                         aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle"><%=loginPatient%></a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a href="LogoutController" class="dropdown-item nav-link text-primary text-center">Đăng xuất</a>
                                <a href="admin_Account.jsp" class="dropdown-item nav-link text-primary text-center">Hồ sơ cá nhân</a>
                            </div>
                        </li>
                        <li class="nav-item cta"><a href="ShowBookingController" class="nav-link" ><span>Đặt lịch khám</span></a></li>

                    </ul>
                </div>
            </div>
        </nav>
        <!-- END nav -->

        <section class="home-slider owl-carousel">
            <div class="slider-item" style="background-image: url('images/bg_1.jpg');">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row slider-text align-items-center" data-scrollax-parent="true">
                        <div class="col-md-6 col-sm-12 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
                            <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Hệ thống nha khoa hiện đại trong một môi trường thoải mái và an toàn</h1>
                            <p class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Trang thiết bị hiện đại và đội ngũ nhân viên chuyên nghiệp</p>
                            <p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><a href="#" data-toggle="modal" data-target="#modalRequest" class="btn btn-primary px-4 py-3">Đặt lịch khám</a></p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="slider-item" style="background-image: url('images/bg_2.jpg');">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row slider-text align-items-center" data-scrollax-parent="true">
                        <div class="col-md-6 col-sm-12 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
                            <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Đảm bảo nụ cười đẹp của bạn </h1>
                            <p class="mb-4">Chúng tôi cam kết sẽ đem lại cho bạn một trải nghiệm thoải mái và đạt được kết quả tốt nhất.</p>
                            <p><a href="#"  data-toggle="modal" data-target="#modalRequest" class="btn btn-primary px-4 py-3">Đặt lịch khám</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-intro">
            <div class="container">
                <div class="row no-gutters">
                    <div class="col-md-3 color-1 p-4">
                        <h3 class="mb-4">Tình huống <strong>khẩn cấp</strong></h3>
                        <p>Hãy liên hệ nhanh chóng với đường dây để được tư vấn trực tiếp</p>
                        <span class="phone-number">+ (123) 456 7890</span>
                    </div>
                    <div class="col-md-3 color-2 p-4">
                        <h3 class="mb-4">Giờ mở cửa</h3>
                        <p class="openinghours d-flex">
                            <span>Thứ Hai - Thứ Sáu</span>
                            <span>8:00 - 19:00</span>
                        </p>
                        <p class="openinghours d-flex">
                            <span>Thứ Bảy</span>
                            <span>10:00 - 17:00</span>
                        </p>
                        <p class="openinghours d-flex">
                            <span>Chủ nhật</span>
                            <span>10:00 - 16:00</span>
                        </p>
                    </div>
                    <div class="col-md-6 color-3 p-4">
                        <h3 class="mb-2">Đặt lịch khám</h3>
                        <form action="#" class="appointment-form">
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <div class="select-wrap">
                                            <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                            <select name="" id="" class="form-control">
                                                <option value="" class="text-primary">Teeth Whitening</option>
                                                <option value="" class="text-primary">Teeth CLeaning</option>
                                                <option value="" class="text-primary">Quality Brackets</option>
                                                <option value="" class="text-primary">Modern Anesthetic</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <div class="icon"><span class="icon-user"></span></div>
                                        <input type="text" class="form-control" id="appointment_name" placeholder="Họ tên">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <div class="icon"><span class="icon-paper-plane"></span></div>
                                        <input type="text" class="form-control" id="appointment_email" placeholder="Email">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <div class="icon"><span class="ion-ios-calendar"></span></div>
                                        <input type="text" class="form-control appointment_date" placeholder="Ngày khám">
                                    </div>    
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <div class="icon"><span class="ion-ios-clock"></span></div>
                                        <input type="text" class="form-control appointment_time" placeholder="Giờ khám">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <div class="icon"><span class="icon-phone2"></span></div>
                                        <input type="text" class="form-control" id="phone" placeholder="Số điện thoại">
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <input type="submit" value="Đặt lịch khám" class="btn btn-primary">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section">
            <div class="container">
                <div class="row d-md-flex">
                    <div class="col-md-6 ftco-animate img about-image order-md-last" style="background-image: url(images/about.jpg);">
                    </div>
                    <div class="col-md-6 ftco-animate pr-md-5 order-md-first">
                        <div class="row">
                            <div class="col-md-12 nav-link-wrap mb-5">
                                <div class="nav ftco-animate nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                    <a class="nav-link active" id="v-pills-whatwedo-tab" data-toggle="pill" href="#v-pills-whatwedo" role="tab" aria-controls="v-pills-whatwedo" aria-selected="true">Chúng tôi làm</a>

                                    <a class="nav-link" id="v-pills-mission-tab" data-toggle="pill" href="#v-pills-mission" role="tab" aria-controls="v-pills-mission" aria-selected="false">Nhiệm vụ</a>

                                    <a class="nav-link" id="v-pills-goal-tab" data-toggle="pill" href="#v-pills-goal" role="tab" aria-controls="v-pills-goal" aria-selected="false">Mục tiêu</a>
                                </div>
                            </div>
                            <div class="col-md-12 d-flex align-items-center">

                                <div class="tab-content ftco-animate" id="v-pills-tabContent">

                                    <div class="tab-pane fade show active" id="v-pills-whatwedo" role="tabpanel" aria-labelledby="v-pills-whatwedo-tab">
                                        <div>
                                            <h2 class="mb-4">Chúng tôi cung cấp chất lượng cao</h2>
                                            <p>Với nguyên tắc “Mang đến những giá trị bền vững cho khách hàng” </p>
                                            <p>Nha khoa Quốc tế DentaCare ngay từ những ngày đầu thành lập cho đến nay vẫn luôn không ngừng nâng cao chất lượng dịch vụ, đem đến cho Quý khách hàng sự hài lòng tối cao cả về dịch vụ và chất lượng.</p>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="v-pills-mission" role="tabpanel" aria-labelledby="v-pills-mission-tab">
                                        <div>
                                            <h2 class="mb-4">Tạo kết quả chất lượng nhất cho người dùng</h2>
                                            <p>Quý khách có cơ hội trải nghiệm điều trị nha khoa hoàn toàn khác biệt với dịch vụ “Nha khoa không đau”.</p>
                                            <p>Chúng tôi áp dụng triệt để quan niệm mới của ngành Y tế: “Can thiệp tối thiểu – Hiệu quả tối đa”, cam kết tạo cho Quý khách hàng cảm giác nhẹ nhàng và thoải mái nhất.</p>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="v-pills-goal" role="tabpanel" aria-labelledby="v-pills-goal-tab">
                                        <div>
                                            <h2 class="mb-4">Giúp đỡ và hỗ trợ cho mọi trường hợp</h2>
                                            <p>Chúng tôi luôn đề cao Y đức, nâng cao trình độ chuyên môn, tận tâm trong công việc để mang lại hiệu quả và sự hài lòng cho từng khách hàng.</p>
                                            <p>Sứ mệnh của Nha khoa Nhân Tâm là mang lại nụ cười hoàn hảo, là nơi khơi nguồn niềm hạnh phúc cho mọi người.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <section class="ftco-section ftco-services">
            <div class="container">
                <div class="row justify-content-center mb-5 pb-5">
                    <div class="col-md-7 text-center heading-section ftco-animate">
                        <h2 class="mb-2">Our Service Keeps you Smile</h2>
                    </div>
                </div>
                <!--List service -->
                <%
                    List<ServiceDTO> listService = (List<ServiceDTO>) request.getAttribute("LIST_SERVICE");
                %>

                <div class="row">
                    <!--khai bao de dua service ra-->
                    <%
                        int count = 0;
                        if (listService != null) {
                            for (ServiceDTO service : listService) {
                    %>
                    <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                        <div class="staff media block-6 services d-block text-center">
                            <div class="justify-content-center align-items-center">

                                <section class="ftco-section testimony-section bg-light">
                                    <div class="container">
                                        <div class="row justify-content-center ftco-animate">
                                            <div class="carousel-testimony owl-carousel ftco-owl">
                                                <!--thong bao de dua image ra-->
                                                <%
                                                    List<ServiceImageDTO> listServiceImage = (List<ServiceImageDTO>) request.getAttribute("LIST_SERVICE_IMAGE");
                                                    for (ServiceImageDTO Image : listServiceImage) {
                                                        if (service.getServiceID() != Image.getServiceID()) {
                                                            continue;
                                                        }
                                                %>
                                                <div class="item">
                                                    <div class="testimony-wrap p-4 pb-5">
                                                        <div class="user-img mb-5" style="background-image: url(<%=Image.getImage()%>)">
                                                        </div>
                                                    </div>
                                                </div>
                                                <%}%>
                                            </div>
                                        </div>
                                    </div>
                                </section>

                                <div class="media-body p-2 mt-3">
                                    <div><h3 class="heading"><%=service.getServiceName()%></h3></div>
                                    <div><p><%=service.getServicePrice()%> VND</p></div>
                                </div>
                            </div>
                        </div>      
                    </div>
                    <%
                                count++;
                                if (count == 4) {
                                    break;
                                }
                            }
                        }
                    %>
                </div>
            </div>

            <div class="container-wrap mt-5">
                <div class="row d-flex no-gutters">
                    <div class="col-md-6 img" style="background-image: url(images/about-2.jpg);">
                    </div>
                    <div class="col-md-6 d-flex">
                        <div class="about-wrap">
                            <div class="heading-section heading-section-white mb-5 ftco-animate">
                                <h2 class="mb-2">Dentacare with a personal touch</h2>
                                <p>Sứ mệnh mang đến những giá trị cốt lõi cho khách hàng là làm đẹp nụ cười – thay đổi cuộc sống. Đây là hệ thống chuỗi nha khoa tiêu chuẩn Pháp đầu tiên tại Việt Nam quy tụ đội ngũ bác sĩ – chuyên gia nha khoa hàng đầu.</p>
                            </div>
                            <div class="list-services d-flex ftco-animate">
                                <div class="icon d-flex justify-content-center align-items-center">
                                    <span class="icon-check2"></span>
                                </div>
                                <div class="text">
                                    <h3>Gặp gỡ các bác sĩ chất lượng cao</h3>
                                    <p>Đội ngũ bác sĩ chuyên môn cao – với hơn 20 bác sĩ đã tốt nghiệp loại giỏi , luôn không ngừng học các khóa học chuyên sâu, cập nhật các công nghệ nha khoa mới nhất trên thế giới để có thể đem đến kết quả điều trị tốt nhất cho khách hàng.</p>
                                </div>
                            </div>
                            <div class="list-services d-flex ftco-animate">
                                <div class="icon d-flex justify-content-center align-items-center">
                                    <span class="icon-check2"></span>
                                </div>
                                <div class="text">
                                    <h3>Trang thiết bị hiện đại</h3>
                                    <p>Trang thiết bị máy móc là một trong những điểm mạnh vượt trội của Nha khoa Nhân Tâm mà rất ít địa chỉ nào có thể vượt qua được. Để chăm sóc sức khỏe răng miệng, điều trị và phục hình răng hàm mặt tốt nhất cho khách hàng.</p>
                                </div>
                            </div>
                            <div class="list-services d-flex ftco-animate">
                                <div class="icon d-flex justify-content-center align-items-center">
                                    <span class="icon-check2"></span>
                                </div>
                                <div class="text">
                                    <h3>Phòng khám tiện nghi</h3>
                                    <p>Ứng dụng công nghệ hiện đại vào trong việc điều trị.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center mb-5 pb-5">
                    <div class="col-md-7 text-center heading-section ftco-animate">
                        <h2 class="mb-3">Meet Our Experience Dentist</h2>
                        <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences</p>
                    </div>
                </div>

                <%
                    List<DoctorDTO> listDoctor = (List<DoctorDTO>) request.getAttribute("LIST_DOCTOR");
                    List<scheduleDTO> listSchedule = (List<scheduleDTO>) request.getAttribute("LIST_SCHEDULE_DOCTOR");
                %>
                <div class="row">
                    <%
                        int countDoctor = 0;
                        if (listService
                                != null) {
                            for (DoctorDTO doctor : listDoctor) {
                                for (scheduleDTO schedule : listSchedule) {
                                    if (schedule.getDoctorID() != doctor.getDoctorID()) {
                                        continue;
                                    } else if (doctor.getStatus() == 0) {
                                        continue;
                                    }
                                    countDoctor++;
                                    if (countDoctor == 5)
                                        break;
                    %>
                    <div class="col-lg-3 col-md-6 d-flex mb-sm-4 ftco-animate">
                        <div class="staff">
                            <div class="img mb-4" style="background-image: url(<%=doctor.getImage()%>);"></div>
                            <div class="info text-center">
                                <h3><a href="teacher-single.html"><%=doctor.getFullName()%></a></h3>
                                <span class="position"><%=doctor.getServiceTypeName()%></span>
                                <div class="text">
                                    <div class="text">
                                        <p>Lịch Làm Việc</p>
                                        <%String dayOfWeek = "";
                                            if (schedule.getDayOfWeek().equals("FRI")) {
                                                dayOfWeek = "Thứ 6";%>
                                        <p><%=dayOfWeek%></p></br>
                                        <%} else if (schedule.getDayOfWeek().equals("TUE")) {
                                            dayOfWeek = "Thứ 3";%>
                                        <p><%=dayOfWeek%></p></br>
                                        <% } else if (schedule.getDayOfWeek().equals("MON")) {
                                            dayOfWeek = "Thứ 2";%>
                                        <p><%=dayOfWeek%></p></br>
                                        <%} else if (schedule.getDayOfWeek().equals("THU")) {
                                            dayOfWeek = "Thứ 5";%>
                                        <p><%=dayOfWeek%></p>
                                        <% } else if (schedule.getDayOfWeek().equals("WED")) {
                                            dayOfWeek = "Thứ 4";%>
                                        <p><%=dayOfWeek%></p>
                                        <%}%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                                }
                            }
                        }
                    %>
                </div>
            </div>
        </section>

        <section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url(images/bg_1.jpg);" data-stellar-background-ratio="0.5">
            <div class="container">
                <div class="row d-flex align-items-center">
                    <div class="col-md-3 aside-stretch py-5">
                        <div class=" heading-section heading-section-white ftco-animate pr-md-4">
                            <h2 class="mb-3">THÀNH TỰU</h2>
                            <p>DentaCare luôn là địa chỉ được khách hàng tin tưởng và tìm đến trong suốt thời gian qua. Chúng tôi cam kết sẽ không ngừng nâng cao chất lượng dịch vụ để mang đến những kết quả tốt nhất cho khách hàng.</p>
                        </div>
                    </div>
                    <div class="col-md-9 py-5 pl-md-5">
                        <div class="row">
                            <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                <div class="block-18">
                                    <div class="text">
                                        <strong class="number" data-number="11">0</strong>
                                        <span>Năm kinh nghiệm</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                <div class="block-18">
                                    <div class="text">
                                        <strong class="number" data-number="<%=listDoctor.size()%>">0</strong>
                                        <span>Đội ngũ nha sĩ chất lượng cao</span>
                                    </div>
                                </div>
                            </div>
                            <%
                                int countPatient = (int) request.getAttribute("COUNT_PATIENT");
                            %>
                            <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                <div class="block-18">
                                    <div class="text">
                                        <strong class="number" data-number="<%=countPatient%>">0</strong>
                                        <span>Số lượng bệnh nhân đã thành công</span>
                                    </div>
                                </div>
                            </div>
                            <%
                                int countService = (int) request.getAttribute("COUNT_SERVICE");
                            %>
                            <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                <div class="block-18">
                                    <div class="text">
                                        <strong class="number" data-number="<%=countService%>">0</strong>
                                        <span>Số lượng bệnh nhân trong năm</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="ftco-section-parallax">
            <div class="parallax-img d-flex align-items-center">
                <div class="container">
                    <div class="row d-flex justify-content-center">
                        <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
                            <h2>Subcribe to our Newsletter</h2>
                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in</p>
                            <div class="row d-flex justify-content-center mt-5">
                                <div class="col-md-8">
                                    <form action="#" class="subscribe-form">
                                        <div class="form-group d-flex">
                                            <input type="text" class="form-control" placeholder="Enter email address">
                                            <input type="submit" value="Subscribe" class="submit px-3">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%List<DiscountDTO> listDiscount = (List<DiscountDTO>) request.getAttribute("LIST_DISCOUNT");%>
        <section class="ftco-section testimony-section bg-light">
            <div class="container">
                <div class="row justify-content-center mb-5 pb-3">
                    <div class="col-md-7 text-center heading-section ftco-animate">
                        <h2 class="mb-2">Đại Giảm Giá</h2>
                        <span class="subheading">Khách Hàng Là Niềm Hạnh Phúc Của Chúng Tôi</span>
                    </div>
                </div>


                <div class="row justify-content-center ftco-animate">
                    <div class="col-md-8">
                        <div class="carousel-testimony owl-carousel ftco-owl">
                            <%for (DiscountDTO discount : listDiscount) {
                            %>
                            <div class="item">
                                <div class="testimony-wrap p-4 pb-5">
                                    <div class="user-img mb-5" style="background-image: url(<%=discount.getImage()%>)">
                                        <span class="quote d-flex align-items-center justify-content-center">
                                            <i class="icon-quote-left"></i>
                                        </span>
                                    </div>
                                    <div class="text text-center">
                                        <p class="mb-5"><%=discount.getDescription()%></p>
                                        <p class="name"><%=discount.getTitle()%></p>
                                        <span class="position"><%=discount.getPercentDiscount()%> %</span>
                                    </div>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>

            </div>
        </section>
        <section class="ftco-gallery">
            <div class="container-wrap">
                <div class="row no-gutters">
                    <div class="col-md-3 ftco-animate">
                        <a href="#" class="gallery img d-flex align-items-center" style="background-image: url(images/gallery-1.jpg);">
                            <div class="icon mb-4 d-flex align-items-center justify-content-center">
                                <span class="icon-search"></span>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3 ftco-animate">
                        <a href="#" class="gallery img d-flex align-items-center" style="background-image: url(images/gallery-2.jpg);">
                            <div class="icon mb-4 d-flex align-items-center justify-content-center">
                                <span class="icon-search"></span>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3 ftco-animate">
                        <a href="#" class="gallery img d-flex align-items-center" style="background-image: url(images/gallery-3.jpg);">
                            <div class="icon mb-4 d-flex align-items-center justify-content-center">
                                <span class="icon-search"></span>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3 ftco-animate">
                        <a href="#" class="gallery img d-flex align-items-center" style="background-image: url(images/gallery-4.jpg);">
                            <div class="icon mb-4 d-flex align-items-center justify-content-center">
                                <span class="icon-search"></span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-quote">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 pr-md-5 aside-stretch py-5 choose">
                        <div class="heading-section heading-section-white mb-5 ftco-animate">
                            <h2 class="mb-2">DentaCare Procedure &amp; High Quality Services</h2>
                        </div>
                        <div class="ftco-animate">
                            <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar. Because there were thousands of bad Commas, wild Question Marks and devious Semikoli</p>
                            <ul class="un-styled my-5">
                                <li><span class="icon-check"></span>Consectetur adipisicing elit</li>
                                <li><span class="icon-check"></span>Adipisci repellat accusamus</li>
                                <li><span class="icon-check"></span>Tempore reprehenderit vitae</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-6 py-5 pl-md-5">
                        <div class="heading-section mb-5 ftco-animate">
                            <h2 class="mb-2">Tư vấn miễn phí</h2>
                        </div>
                        <form action="#" class="ftco-animate">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Họ tên">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Email">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Số điện thoại">
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <textarea name="" id="" cols="30" rows="7" class="form-control" placeholder="Lời nhắn"></textarea>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="submit" value="Tư vấn miễn phí" class="btn btn-primary py-3 px-5">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <div id="map"></div>

        <footer class="ftco-footer ftco-bg-dark ftco-section">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-md-3">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">DentaCare</h2>
                            <p>Nha Khoa DentalCare cung cấp đầy đủ các loại hình điều trị như: Tổng quát, Phục hình răng sứ, Cấy ghép implant, Chỉnh nha - niềng răng, Thẩm mỹ nướu.</p>
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
                                <li><a href="#" class="py-2 d-block">Thông tin</a></li>
                                <li><a href="#" class="py-2 d-block">Tính năng</a></li>
                                <li><a href="#" class="py-2 d-block">Dự án</a></li>
                                <li><a href="#" class="py-2 d-block">Blog</a></li>
                                <li><a href="#" class="py-2 d-block">Liên hệ</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4 pr-md-4">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Blog gần đây</h2>
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

                        <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved </a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
            </div>
        </footer>


        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

        <!-- Modal -->
        <div class="modal fade" id="modalRequest" tabindex="-1" role="dialog" aria-labelledby="modalRequestLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalRequestLabel">Đặt lịch khám</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="#">
                            <div class="form-group">
                                <!-- <label for="appointment_name" class="text-black">Full Name</label> -->
                                <input type="text" class="form-control" id="appointment_name" placeholder="Họ tên người đặt">
                            </div>
                            <div class="form-group">
                                <!-- <label for="appointment_email" class="text-black">Email</label> -->
                                <input type="text" class="form-control" id="appointment_email" placeholder="Email">
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <!-- <label for="appointment_date" class="text-black">Date</label> -->
                                        <input type="text" class="form-control appointment_date" placeholder="Ngày đặt">
                                    </div>    
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <!-- <label for="appointment_time" class="text-black">Time</label> -->
                                        <input type="text" class="form-control appointment_time" placeholder="Giờ khám">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <select name="" id="" class="form-control">
                                            <option value="" class="text-primary">Teeth Whitening</option>
                                            <option value="" class="text-primary">Teeth CLeaning</option>
                                            <option value="" class="text-primary">Quality Brackets</option>
                                            <option value="" class="text-primary">Modern Anesthetic</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <select name="" id="" class="form-control">
                                        <option value="" class="text-primary">Service2</option>
                                        <option value="" class="text-primary">Service2</option>
                                        <option value="" class="text-primary">Service2</option>
                                        <option value="" class="text-primary">Service2</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <!-- <label for="appointment_message" class="text-black">Message</label> -->
                                <textarea name="" id="appointment_message" class="form-control" cols="30" rows="10" placeholder="Ghi chú"></textarea>
                            </div>
                            <div class="form-group">
                                <input type="submit" value="Đặt lịch khám" class="btn btn-primary">
                            </div>
                        </form>
                    </div>

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
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="js/google-map.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>
