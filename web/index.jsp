<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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

        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="index.html">Denta<span>Care</span></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                        aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active"><a href="index.html" class="nav-link">Trang chủ</a></li>
                        <li class="nav-item"><a href="about.html" class="nav-link">Thông tin</a></li>
                        <li class="nav-item dropdown"><a href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                                         aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle">Dịch vụ</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a href="services.html" class="dropdown-item nav-link text-primary text-center">serviceType1</a>
                                <a href="" class="dropdown-item nav-link text-primary text-center">serviceType2</a>
                                <a href="" class="dropdown-item nav-link text-primary text-center">serviceType2</a>
                            </div>

                        </li>
                        <li class="nav-item"><a href="doctors.html" class="nav-link">Bác sĩ</a></li>
                        <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
                        <li class="nav-item"><a href="contact.html" class="nav-link">Liên hệ</a></li>
                        <li class="nav-item"><a href="login.html" class="nav-link">Đăng nhập</a></li>
                        <li class="nav-item dropdown"><a href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                                         aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle">Quang</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a href="" class="dropdown-item nav-link text-primary text-center">Đăng xuất</a>
                                <a href="admin_Account.html" class="dropdown-item nav-link text-primary text-center">Hồ sơ cá nhân</a>
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
            <div class="slider-item" style="background-image: url('images/bg_1.jpg');">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row slider-text align-items-center" data-scrollax-parent="true">
                        <div class="col-md-6 col-sm-12 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
                            <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Hệ thống nha khoa hiện đại
                                trong một môi trường thoải mái và an toàn</h1>
                            <p class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Trang thiết bị hiện đại và
                                đội ngũ nhân viên chuyên nghiệp</p>
                            <p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><a href="#" data-toggle="modal"
                                                                                                  data-target="#modalRequest" class="btn btn-primary px-4 py-3">Đặt lịch khám</a></p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="slider-item" style="background-image: url('images/bg_2.jpg');">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row slider-text align-items-center" data-scrollax-parent="true">
                        <div class="col-md-6 col-sm-12 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
                            <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Đảm bảo nụ cười đẹp của bạn
                            </h1>
                            <p class="mb-4">Chúng tôi cam kết sẽ đem lại cho bạn một trải nghiệm thoải mái và đạt được kết quả tốt nhất.
                            </p>
                            <p><a href="#" data-toggle="modal" data-target="#modalRequest" class="btn btn-primary px-4 py-3">Đặt lịch
                                    khám</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-intro">
            <div class="container">
                <div class="row no-gutters">
                    <div class="col-md-3 color-1 p-4">
                        <h3 class="mb-4">Tình huống <strong>Khẩn Cấp</strong></h3>
                        <p>Hãy liên hệ nhanh chóng với đường dây để được tư vấn trực tiếp</p>
                        <span class="phone-number">+ (123) 456 7890</span>
                    </div>
                    <div class="col-md-3 color-2 p-4">
                        <h3 class="mb-4">Giờ Mở Cửa</h3>
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
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <div class="icon"><span class="icon-phone2"></span></div>
                                        <input type="text" class="form-control" id="phone" placeholder="Số điện thoại">
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
                            </div>

                            <div class="form-group">
                                <input type="submit" value="Đặt lịch khám" class="btn btn-primary">
                            </div>
                        </form>
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
                <div class="row">
                    <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services d-block text-center">
                            <div class="icon d-flex justify-content-center align-items-center">
                                <span class="flaticon-tooth-1"></span>
                            </div>
                            <div class="media-body p-2 mt-3">
                                <h3 class="heading">Tẩy trắng răng</h3>
                                <p>Với công nghệ làm sạch tân tiến của phòng khám sẽ đem lại cho bạn một nụ cười trắng sáng </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services d-block text-center">
                            <div class="icon d-flex justify-content-center align-items-center">
                                <span class="flaticon-dental-care"></span>
                            </div>
                            <div class="media-body p-2 mt-3">
                                <h3 class="heading">Teeth Cleaning</h3>
                                <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services d-block text-center">
                            <div class="icon d-flex justify-content-center align-items-center">
                                <span class="flaticon-tooth-with-braces"></span>
                            </div>
                            <div class="media-body p-2 mt-3">
                                <h3 class="heading">Quality Brackets</h3>
                                <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services d-block text-center">
                            <div class="icon d-flex justify-content-center align-items-center">
                                <span class="flaticon-anesthesia"></span>
                            </div>
                            <div class="media-body p-2 mt-3">
                                <h3 class="heading">Modern Anesthetic</h3>
                                <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic.</p>
                            </div>
                        </div>
                    </div>
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
                                <p>Sứ mệnh mang đến những giá trị cốt lõi cho khách hàng là làm đẹp nụ cười – thay đổi cuộc sống.
                                    Đây là hệ thống chuỗi nha khoa tiêu chuẩn Pháp đầu tiên tại Việt Nam quy tụ đội ngũ bác sĩ
                                    – chuyên gia nha khoa hàng đầu.</p>
                            </div>
                            <div class="list-services d-flex ftco-animate">
                                <div class="icon d-flex justify-content-center align-items-center">
                                    <span class="icon-check2"></span>
                                </div>
                                <div class="text">
                                    <h3>Gặp gỡ các bác sĩ chất lượng cao</h3>
                                    <p>Đội ngũ bác sĩ chuyên môn cao – với hơn 20 bác sĩ đã tốt nghiệp loại giỏi , luôn không ngừng học các
                                        khóa học chuyên sâu, cập nhật các công nghệ nha khoa mới nhất trên thế giới để có thể đem đến kết quả
                                        điều trị tốt nhất cho khách hàng.</p>
                                </div>
                            </div>
                            <div class="list-services d-flex ftco-animate">
                                <div class="icon d-flex justify-content-center align-items-center">
                                    <span class="icon-check2"></span>
                                </div>
                                <div class="text">
                                    <h3>Trang thiết bị hiện đại</h3>
                                    <p>Trang thiết bị máy móc là một trong những điểm mạnh vượt trội của Nha khoa Nhân Tâm mà rất ít địa chỉ
                                        nào có thể vượt qua được. Để chăm sóc sức khỏe răng miệng, điều trị và phục hình răng hàm mặt tốt nhất
                                        cho khách hàng.</p>
                                </div>
                            </div>
                            <div class="list-services d-flex ftco-animate">
                                <div class="icon d-flex justify-content-center align-items-center">
                                    <span class="icon-check2"></span>
                                </div>
                                <div class="text">
                                    <h3>Phòng khám tiện nghi</h3>
                                    <p>Ứng dụng công nghệ hiện đại vào trong việc điều trị cùng với các dịch vụ hỗ trợ trong quá trình khám.
                                    </p>
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
                        <h2 class="mb-3">Gặp Gỡ Các Bác Sĩ </h2>
                        <p>Tư vấn và lời khuyên khi đến với DentaCare</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-6 d-flex mb-sm-4 ftco-animate">
                        <div class="staff">
                            <div class="img mb-4" style="background-image: url(images/person_5.jpg);"></div>
                            <div class="info text-center">
                                <h3><a href="teacher-single.html">Tom Smith</a></h3>
                                <span class="position">Dentist</span>
                                <div class="text">
                                    <p>Far far away, behind the word mountains, far from the countries Vokalia</p>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 d-flex mb-sm-4 ftco-animate">
                        <div class="staff">
                            <div class="img mb-4" style="background-image: url(images/person_6.jpg);"></div>
                            <div class="info text-center">
                                <h3><a href="teacher-single.html">Mark Wilson</a></h3>
                                <span class="position">Dentist</span>
                                <div class="text">
                                    <p>Far far away, behind the word mountains, far from the countries Vokalia</p>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 d-flex mb-sm-4 ftco-animate">
                        <div class="staff">
                            <div class="img mb-4" style="background-image: url(images/person_7.jpg);"></div>
                            <div class="info text-center">
                                <h3><a href="teacher-single.html">Patrick Jacobson</a></h3>
                                <span class="position">Dentist</span>
                                <div class="text">
                                    <p>Far far away, behind the word mountains, far from the countries Vokalia</p>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 d-flex mb-sm-4 ftco-animate">
                        <div class="staff">
                            <div class="img mb-4" style="background-image: url(images/person_8.jpg);"></div>
                            <div class="info text-center">
                                <h3><a href="teacher-single.html">Ivan Dorchsner</a></h3>
                                <span class="position">System Analyst</span>
                                <div class="text">
                                    <p>Far far away, behind the word mountains, far from the countries Vokalia</p>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>

        <section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url(images/bg_1.jpg);"
                 data-stellar-background-ratio="0.5">
            <div class="container">
                <div class="row d-flex align-items-center">
                    <div class="col-md-3 aside-stretch py-5">
                        <div class=" heading-section heading-section-white ftco-animate pr-md-4">
                            <h2 class="mb-3">Achievements</h2>
                            <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
                        </div>
                    </div>
                    <div class="col-md-9 py-5 pl-md-5">
                        <div class="row">
                            <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                <div class="block-18">
                                    <div class="text">
                                        <strong class="number" data-number="14">0</strong>
                                        <span>Years of Experience</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                <div class="block-18">
                                    <div class="text">
                                        <strong class="number" data-number="4500">0</strong>
                                        <span>Qualified Dentist</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                <div class="block-18">
                                    <div class="text">
                                        <strong class="number" data-number="4200">0</strong>
                                        <span>Happy Smiling Customer</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                <div class="block-18">
                                    <div class="text">
                                        <strong class="number" data-number="320">0</strong>
                                        <span>Patients Per Year</span>
                                    </div>
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
                            <p class="button text-center"><a href="#" class="btn btn-primary btn-outline-primary px-4 py-3">Order
                                    now</a></p>
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
                            <p class="button text-center"><a href="#" class="btn btn-primary btn-outline-primary px-4 py-3">Order
                                    now</a></p>
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
                            <p class="button text-center"><a href="#" class="btn btn-primary btn-outline-primary px-4 py-3">Order
                                    now</a></p>
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
                            <p class="button text-center"><a href="#" class="btn btn-primary btn-outline-primary px-4 py-3">Order
                                    now</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>




        <section class="ftco-gallery">
            <div class="container-wrap">
                <div class="row no-gutters">
                    <div class="col-md-3 ftco-animate">
                        <a href="about.html" class="gallery img d-flex align-items-center"
                           style="background-image: url(images/gallery-1.jpg);">
                            <div class="icon mb-4 d-flex align-items-center justify-content-center">
                                <span class="icon-search"></span>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3 ftco-animate">
                        <a href="services.html" class="gallery img d-flex align-items-center"
                           style="background-image: url(images/gallery-2.jpg);">
                            <div class="icon mb-4 d-flex align-items-center justify-content-center">
                                <span class="icon-search"></span>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3 ftco-animate">
                        <a href="doctors.html" class="gallery img d-flex align-items-center"
                           style="background-image: url(images/gallery-3.jpg);">
                            <div class="icon mb-4 d-flex align-items-center justify-content-center">
                                <span class="icon-search"></span>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3 ftco-animate">
                        <a href="contact.html" class="gallery img d-flex align-items-center"
                           style="background-image: url(images/gallery-4.jpg);">
                            <div class="icon mb-4 d-flex align-items-center justify-content-center">
                                <span class="icon-search"></span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section">
            <div class="container">

            </div>
        </section>



        <div id="map"></div>

        <footer class="ftco-footer ftco-bg-dark ftco-section">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-md-3">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">DentaCare</h2>
                            <p>Nha Khoa DentalCare cung cấp đầy đủ các loại hình điều trị như: Tổng quát, Phục hình răng sứ, Cấy ghép
                                implant, Chỉnh nha - niềng răng, Thẩm mỹ nướu.</p>
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
                                    <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San
                                            Francisco, California, USA</span></li>
                                    <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
                                    <li><a href="#"><span class="icon icon-envelope"></span><span
                                                class="text">info@yourdomain.com</span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center">

                        <p>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;
                            <script>document.write(new Date().getFullYear());</script> All rights reserved </a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
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

        <!-- Modal -->
        <div class="modal fade" id="modalRequest" tabindex="-1" role="dialog" aria-labelledby="modalRequestLabel"
             aria-hidden="true">
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
                            <div class="form-group">
                                <!-- <label for="appointment_email" class="text-black">Email</label> -->
                                <input type="text" class="form-control" id="appointment_email" placeholder="Số điện thoại">
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
                                        <option value="" class="text-primary">Service1</option>
                                        <option value="" class="text-primary">Service2</option>
                                        <option value="" class="text-primary">Service3</option>
                                        <option value="" class="text-primary">Service4</option>
                                    </select>
                                </div>
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
        <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="js/google-map.js"></script>
        <script src="js/main.js"></script>

    </body>

</html>