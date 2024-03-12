<%-- 
    Document   : navbar
    Created on : Feb 26, 2024, 8:00:19 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NavBar</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
            />

        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
            />
        <link rel="stylesheet" href="css/navbar.css"/>
    </head>
    <body>
        <!--top-bar-->
        <div class="top-bar" style="background-color: gray;">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-9">
                        <div>
                            <span style="color: white;">Chào mừng bạn đến với SmartWatch</span>
                        </div>
                    </div>

                    <div class="col-md-3 text-md-right"> 
                        <div class="d-flex justify-content-between ml-auto"> 
                            <a href="https://www.facebook.com/profile.php?id=100012003163046" class="text-white" style="text-decoration: none;"><i class="fab fa-facebook"></i> <span class="ml-2">Facebook</span></a>
                            <a href="https://www.instagram.com/_thanhntt54_/" class="text-white" style="text-decoration: none;"><i class="fab fa-instagram"></i> <span class="ml-2">Instagram</span></a>
                            <a href="https://www.linkedin.com/in/nguy%E1%BB%85n-trung-th%C3%A0nh/" class="text-white" style="text-decoration: none;"><i class="fab fa-linkedin"></i> <span class="ml-2">Linkedin</span></a>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- header-->
        <header>
            <nav class="navbar navbar-expand-lg" >
                <div class="container-fluid">

                    <!-- elements left -->
                    <a class="navbar-brand" href="homepage"><h3 style="color: white;">SmartWatch</h3></a>
                    <button
                        class="navbar-toggler"
                        type="button"
                        data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent"
                        aria-expanded="false"
                        aria-label="Toggle navigation"
                        >
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div
                        class="collapse navbar-collapse justify-content-between"
                        id="navbarSupportedContent"
                        >

                        <!-- elements middle -->
                        <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="homepage">
                                    <b style="color: white;">Trang Chủ</b>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="watch">
                                    <b style="color: white;">Đồng Hồ</b>
                                </a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link" href="#" role="button" data-bs-toggle="dropdown"  style="color: white;">
                                    <b>Thương Hiệu</b>
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuAvatar" style="background-color: #005A5A;">
                                    <c:forEach items="${requestScope.brand}" var="brand">
                                        <li>
                                            <a class="dropdown-item brand-link" href="#" data-brand-id="${brand.brand_id}" style="color: white;">${brand.name}</a>
                                        </li>
                                    </c:forEach>
                                </ul>

                            </li>
                            <li class="nav-item">
                                <a class="nav-link" style="color: white;">
                                    <b>Blog</b>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" style="color: white;">
                                    <b>Liên Hệ: 0826366855</b>
                                </a>
                            </li>
                        </ul>

                        <!-- elements search -->
                        <div class="search-container ms-auto" style="margin-right: 20px">
                            <form action="search" method="GET">          
                                <input
                                    class="form-control search-input me-2"
                                    type="search"
                                    placeholder="Search"
                                    aria-label="Search"
                                    name="search"
                                    />
                            </form>
                        </div>

                        <!-- elements rights -->
                        <div class="d-flex align-items-center">
                            <!-- Icon cart -->
                            <form action="displayCart" method="get" class="d-flex ml-auto" style="margin-right: 20px;"> 
                                <button class="btn btn-outline-dark" type="submit" style="color: white; border: none;" >
                                    <i class="fas fa-shopping-cart" style="color: white;"></i><b> Cart</b>
                                    <span class="badge bg-dark text-white ms-1 rounded-pill">${requestScope.countProduct}</span>
                                </button>
                            </form>
                            <!-- Avatar -->
                            <div class="dropdown">
                                <a class="dropdown-toggle d-flex align-items-center hidden-arrow" href="#" id="navbarDropdownMenuAvatar" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: white;">
                                    <i class="fas fa-user"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuAvatar" style="background-color: #005A5A;">
                                    <% 
                                        // Kiểm tra xem có session người dùng đang tồn tại hay không
                                        if (session.getAttribute("acc") == null) { 
                                    %>
                                    <!-- Hiển thị liên kết "Login" và "Sign up" nếu không có session người dùng -->
                                    <li><a class="dropdown-item" href="login" style="color: white;">Login</a></li>
                                    <li><a class="dropdown-item" href="signup" style="color: white;">Sign up</a></li>
                                        <% } else { %>
                                    <!-- Nếu có session người dùng, không hiển thị liên kết "Login" và "Sign up" -->
                                    <!-- Các phần tử khác của menu dropdown -->
                                    <li><a class="dropdown-item" href="myorder" style="color: white;">My Order</a></li>
                                    <li><a class="dropdown-item" href="setting" style="color: white;">Settings</a></li>
                                    <li><a class="dropdown-item" href="logout" style="color: white;">Logout</a></li>
                                        <% } %>
                                </ul>
                            </div>

                        </div>
                    </div>
                </div>
            </nav>
        </header>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"
        ></script>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var dropdownMenu = document.querySelector('.nav-item.dropdown');

                dropdownMenu.addEventListener('mouseenter', function () {
                    this.querySelector('.dropdown-menu').classList.add('show');
                });

                dropdownMenu.addEventListener('mouseleave', function () {
                    this.querySelector('.dropdown-menu').classList.remove('show');
                });
            });

            document.addEventListener("DOMContentLoaded", function () {
                var dropdownItems = document.querySelectorAll('.dropdown-item');

                dropdownItems.forEach(function (item) {
                    item.addEventListener('mouseenter', function () {
                        this.style.backgroundColor = '#294F4F'; // Đổi màu nền thành lightgray khi di chuột vào
                    });

                    item.addEventListener('mouseleave', function () {
                        this.style.backgroundColor = ''; // Đặt lại màu nền mặc định khi di chuột ra
                    });
                });
            });

            // Sử dụng JavaScript để thêm sự kiện click cho các liên kết thương hiệu
            document.addEventListener("DOMContentLoaded", function () {
                var brandLinks = document.querySelectorAll(".brand-link");

                brandLinks.forEach(function (link) {
                    link.addEventListener("click", function (event) {
                        event.preventDefault(); // Ngăn chặn hành vi mặc định của liên kết

                        // Lấy brand_id từ thuộc tính data-brand-id
                        var brandId = this.getAttribute("data-brand-id");

                        // Tạo URL chứa brand_id
                        var url = "watch?brand_id=" + brandId;

                        // Chuyển hướng trình duyệt đến URL tương ứng
                        window.location.href = url;
                    });
                });
            });
        </script>

    </body>
</html>
