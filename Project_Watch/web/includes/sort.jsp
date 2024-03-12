<%-- 
    Document   : sort
    Created on : Mar 1, 2024, 11:07:32 PM
    Author     : admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sort</title>
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
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
            />
        <style>
            body {
                margin-top: 0;
            }

            .custom-container {
                background-color: #005a5a; /* Set your desired background color here */
                padding: 20px; /* Adjust padding as needed */
            }
        </style>
    </head>
    <body>
        <div class="container-fluid custom-container">
            <!-- Thêm class "custom-container" và "mt-5" -->
            <div class="row">
                <div class="col">
                    <div class="dropdown button">
                        <button
                            class="btn btn-secondary dropdown-toggle w-100"
                            type="button"
                            id="dropdownSort"
                            aria-expanded="false"
                            >
                            Sắp xếp sản phẩm
                        </button>
                        <ul class="dropdown-menu w-100" aria-labelledby="dropdownSort" style="background-color: #005A5A;">
                            <li>
                                <!-- Tăng dần -->
                                <c:url var="ascUrl" value="watch">
                                    <c:param name="brand_id" value="${param.brand_id}" />
                                    <c:param name="sortType" value="ASC" />
                                </c:url>
                                <a class="dropdown-item" href="${ascUrl}" style="color: white;">Tăng dần</a>
                            </li>
                            <li>
                                <!-- Giảm dần -->
                                <c:url var="descUrl" value="watch">
                                    <c:param name="brand_id" value="${param.brand_id}" />
                                    <c:param name="sortType" value="DESC" />
                                </c:url>
                                <a class="dropdown-item" href="${descUrl}" style="color: white;">Giảm dần</a>
                            </li>

                        </ul>
                    </div>
                </div>

                <div class="col">
                    <div class="dropdown button" >
                        <button
                            class="btn btn-secondary dropdown-toggle w-100"
                            type="button"
                            id="dropdownPrice"
                            aria-expanded="false"
                            >
                            Khoảng giá
                        </button>
                        <ul class="dropdown-menu w-100" aria-labelledby="dropdownPrice" style="background-color: #005A5A;">
                            <li>
                                <c:url var="priceUrl1" value="watch">
                                    <c:if test="${not empty param.brand_id}">
                                        <c:param name="brand_id" value="${param.brand_id}" />
                                    </c:if>
                                    <c:param name="priceRange" value="1" />
                                </c:url>
                                <a class="dropdown-item" href="${priceUrl1}" style="color: white;">Giá dưới 1 triệu</a>
                            </li>
                            <li>
                                <c:url var="priceUrl2" value="watch">
                                    <c:if test="${not empty param.brand_id}">
                                        <c:param name="brand_id" value="${param.brand_id}" />
                                    </c:if>
                                    <c:param name="priceRange" value="2" />
                                </c:url>
                                <a class="dropdown-item" href="${priceUrl2}" style="color: white;">Giá từ 1 triệu đến 5 triệu</a>
                            </li>
                            <li>
                                <c:url var="priceUrl3" value="watch">
                                    <c:if test="${not empty param.brand_id}">
                                        <c:param name="brand_id" value="${param.brand_id}" />
                                    </c:if>
                                    <c:param name="priceRange" value="3" />
                                </c:url>
                                <a class="dropdown-item" href="${priceUrl3}" style="color: white;">Giá từ 5 triệu đến 10 triệu</a>
                            </li>
                            <li>
                                <c:url var="priceUrl4" value="watch">     <c:param name="brand_id" value="${param.brand_id}" />
                                    <c:if test="${not empty param.brand_id}">
                                        <c:param name="brand_id" value="${param.brand_id}" />
                                    </c:if>
                                    <c:param name="priceRange" value="4" />
                                </c:url>
                                <a class="dropdown-item" href="${priceUrl4}" style="color: white;">Giá từ 10 triệu đến 20 triệu</a>
                            </li>
                            <li>
                                <c:url var="priceUrl5" value="watch">
                                    <c:if test="${not empty param.brand_id}">
                                        <c:param name="brand_id" value="${param.brand_id}" />
                                    </c:if>
                                    <c:param name="priceRange" value="5" />
                                </c:url>
                                <a class="dropdown-item" href="${priceUrl5}" style="color: white;">Giá trên 20 triệu</a>
                            </li>
                        </ul>

                    </div>
                </div>
            </div>
        </div>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var dropdownMenus = document.querySelectorAll(".dropdown.button");

                dropdownMenus.forEach(function (menu) {

                    menu.addEventListener("mouseenter", function () {
                        this.querySelector(".dropdown-menu").classList.add("show");
                    });

                    menu.addEventListener("mouseleave", function () {
                        this.querySelector(".dropdown-menu").classList.remove("show");
                    });


                    menu.addEventListener("click", function () {
                        var dropdownMenu = this.querySelector(".dropdown-menu");
                        dropdownMenu.classList.toggle("show");
                    });
                });

                var dropdownItems = document.querySelectorAll(".dropdown-item");

                dropdownItems.forEach(function (item) {
                    item.addEventListener("mouseenter", function () {
                        this.style.backgroundColor = '#294F4F'; // Đổi màu nền thành lightgray khi di chuột vào
                    });

                    item.addEventListener("mouseleave", function () {
                        // Không thực hiện thay đổi màu nền khi rời chuột ra
                    });
                });
            });
        </script>

    </body>
</html>
