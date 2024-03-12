<%-- 
    Document   : navBar
    Created on : Feb 5, 2024, 9:48:46 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>navBar</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">       
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
            />
        <link rel="stylesheet" href="./css/navBar.css" />
    </head>
    <body>
        <header>
            <!-- navbar -->
            <div class="container-fluid navBar">
                <div class="row align-items-center">
                    <!-- logo -->
                    <div class="col-12 col-md-4 img logo">
                        <a href="#!">
                            <img src="./image/snapedit_1707235130251.png" alt="" />
                        </a>
                    </div>

                    <!-- search -->
                    <div class="col-12 col-md-4 search">
                        <form
                            class="position-relative d-flex input-group my-auto mb-3 mb-md-0"
                            >
                            <input
                                autocomplete="off"
                                type="search"
                                class="form-control"
                                placeholder="Search"
                                />
                            <button class="button_icon_search">
                                <i class="fas fa-search search_icon"></i>
                            </button>
                        </form>
                    </div>

                    <!-- login, phone, cart -->
                    <div class="col-12 col-md-4 items text-end">
                        <div class="icons">
                            <a href="#">
                                <i class="fas fa-phone-alt"></i>
                                <span>0826366855</span>
                            </a>
                        </div>
                        <div>
                            <a href="#">
                                <i class="fa fa-shopping-bag"></i>
                                <span>Giỏ Hàng</span>
                            </a>
                        </div>
                        <div>
                            <a href="#">
                                <i class="fa fa-user"></i>
                                <span>Tài khoản của tôi</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- menu -->
            <div class="menu">
                <div class="col-12 text-end d-md-none">
                    <div class="col-4 text-end d-md-none bar">
                        <button class="hamburger-menu-icon">
                            <i class="fas fa-bars"></i>
                        </button>
                    </div>

                    <div class="col-4 text-end d-md-none search">
                        <form
                            class="position-relative d-flex input-group my-auto mb-3 mb-md-0"
                            >
                            <input
                                autocomplete="off"
                                type="search"
                                class="form-control"
                                placeholder="Search"
                                />
                            <button class="button_icon_search">
                                <i class="fas fa-search search_icon"></i>
                            </button>
                        </form>
                    </div>

                    <div class="col-4 text-end d-md-none icons">
                        <div class="icons_mobile">
                            <div>
                                <a href="#">
                                    <i class="fas fa-phone-alt"></i>
                                </a>
                            </div>
                            <div>
                                <a href="#">
                                    <i class="fa fa-shopping-bag"></i>
                                </a>
                            </div>
                            <div>
                                <a href="#">
                                    <i class="fa fa-user"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <ul class="nav nav-pills justify-content-center text_menu">
                    <li class="nav-item"><a class="nav-link" href="#">Trang Chủ</a></li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" id="thuong-hieu">Thương Hiệu</a>
                        <div class="sub-menu">
                            <ul>
                                <li><a href="">Apple</a></li>
                                <li><a href="">SamSung</a></li>
                                <li><a href="">Oppo</a></li>
                                <li><a href="">Huawei</a></li>
                            </ul>
                        </div>
                    </li>

                    <li class="nav-item"><a class="nav-link" href="#">Đồng Hồ</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Tin Tức</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Đánh Giá</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Liên Hệ</a></li>
                </ul>
            </div>

            <!-- Overlay menu -->
            <div class="overlay-menu">
                <button class="close-menu-btn"><i class="fas fa-times"></i></button>
                <ul>
                    <li><a href="#">Trang Chủ</a></li>
                    <li><a href="#">Thương Hiệu</a></li>
                    <li><a href="#">Đồng Hồ</a></li>
                    <li><a href="#">Tin Tức</a></li>
                    <li><a href="#">Đánh Giá</a></li>
                    <li><a href="#">Liên Hệ</a></li>
                </ul>
            </div>

            <!-- Carousel -->

            <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
                <ol class="carousel-indicators">
                    <li
                        data-bs-target="#myCarousel"
                        data-bs-slide-to="0"
                        class="active"
                        ></li>
                    <li data-bs-target="#myCarousel" data-bs-slide-to="1"></li>
                    <li data-bs-target="#myCarousel" data-bs-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img
                            src="https://d1hjkbq40fs2x4.cloudfront.net/2017-08-21/files/landscape-photography_1645-t.jpg"
                            class="d-block w-100"
                            alt="Panther"
                            />
                    </div>
                    <div class="carousel-item">
                        <img
                            src="https://media-cdn-v2.laodong.vn/storage/newsportal/2023/8/26/1233821/Giai-Nhi-1--Nang-Tre.jpg"
                            class="d-block w-100"
                            alt="Black Cat"
                            />
                    </div>
                    <div class="carousel-item">
                        <img
                            src="https://vcdn1-dulich.vnecdn.net/2021/07/16/1-1626437591.jpg?w=460&h=0&q=100&dpr=2&fit=crop&s=i2M2IgCcw574LT-bXFY92g"
                            class="d-block w-100"
                            alt="Lion"
                            />
                    </div>
                </div>
                <button
                    class="carousel-control-prev"
                    type="button"
                    data-bs-target="#myCarousel"
                    data-bs-slide="prev"
                    >
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button
                    class="carousel-control-next"
                    type="button"
                    data-bs-target="#myCarousel"
                    data-bs-slide="next"
                    >
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
            <script>
                // JavaScript for toggling the overlay menu
                const hamburgerMenuIcon = document.querySelector(".hamburger-menu-icon");
                const overlayMenu = document.querySelector(".overlay-menu");
                const closeMenuBtn = document.querySelector(".close-menu-btn");

                hamburgerMenuIcon.addEventListener("click", function () {
                    overlayMenu.classList.toggle("active");
                });

                closeMenuBtn.addEventListener("click", function () {
                    overlayMenu.classList.remove("active");
                });

                // Tự động chạy carousel
                $(".carousel").carousel({
                    interval: 100, // Số milliseconds giữa các lần chuyển đổi tự động
                });
            </script>
        </header>
    </body>
</html>
