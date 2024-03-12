<%-- 
    Document   : admin
    Created on : Mar 8, 2024, 10:47:35 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>


        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap"
            rel="stylesheet"
            />

        <!-- Icon Font Stylesheet -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
            rel="stylesheet"
            />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
            rel="stylesheet"
            />

        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
            />
        <link rel="icon" href="image//Vẽ tay Hình tròn Logo.png" type="images/x-icon">
        <link href="css/adminHome.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <div class="container-fluid position-relative bg-white d-flex p-0">
            <!-- Sidebar Start -->
            <div class="sidebar pe-4 pb-3">
                <nav class="navbar bg-light navbar-light">
                    <a href="adminHome" class="navbar-brand mx-4 mb-3">
                        <h3 class="text-primary">DASHBOARD</h3>
                    </a>
                    <div class="d-flex align-items-center ms-4 mb-4">
                        <div class="position-relative">
                            <img class="rounded-circle" src="image/snapedit_1707235130251.png" alt="" style="width: 40px; height: 40px;">
                            <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                        </div>
                        <div class="ms-3">
                            <h6 class="mb-0">${u.full_name}</h6>
                            <span>Admin</span>
                        </div>
                    </div>
                    <div class="navbar-nav w-100">
                        <a href="adminHome" class="nav-item nav-link"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                        <a href="adminTable" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Tables</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Pages</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="login" class="dropdown-item">Login</a>
                                <a href="adminSignUp" class="dropdown-item">Sign Up</a>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
            <!-- Sidebar End -->


            <!-- Content Start -->
            <div class="content">
                <!-- Navbar Start -->
                <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                    <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                        <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                    </a>
                    <div class="navbar-nav align-items-center ms-auto">
                        
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <img class="rounded-circle me-lg-2" src="image/snapedit_1707235130251.png" alt="" style="width: 40px; height: 40px;">
                                <span class="d-none d-lg-inline-flex">${u.full_name}</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <a href="adminSetting" class="dropdown-item">Settings</a>
                                <a href="logout" class="dropdown-item">Log Out</a>
                            </div>
                        </div>
                    </div>
                </nav>
                <!-- Navbar End -->
                <!-- Recent Sales Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light text-center rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h4 class="mb-0">Order</h4>
                            <a href="">Show All</a>
                        </div>
                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0">
                                <thead>
                                    <tr class="text-dark">
                                        <th scope="col">OrderId</th>
                                        <th scope="col">Customer</th>
                                        <th scope="col">Date</th>
                                        <th scope="col">Address</th>
                                        <th scope="col">Total</th>
                                        <th scope="col">Status</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:set var="previousOrderId" value="" />
                                    <c:forEach items="${requestScope.data}" var="order" varStatus="loop">
                                        <c:if test="${order.order_id != previousOrderId}">
                                            <tr>
                                                <td>${order.order_id}</td>
                                                <td>${order.user.full_name}</td>
                                                <td>${order.order_date}</td>
                                                <td>${order.address}</td>
                                                <td><fmt:formatNumber value="${order.total_price}" type="number" />đ</td>
                                                <td>
                                                    <form  action="confirmStatus" method="post">
                                                        <select class="form-select form-select-sm" name="status" onchange="changeStatus(this)">
                                                            <c:choose>
                                                                <c:when test="${order.status == 1}">
                                                                    <option value="1" ${order.status == 1 ? 'selected' : ''}>Completed</option>
                                                                </c:when>
                                                                <c:when test="${order.status == 2}">
                                                                    <option value="1">Completed</option>
                                                                    <option value="2" ${order.status == 2 ? 'selected' : ''}>Processing</option>
                                                                    <option value="3">Cancel</option>
                                                                </c:when>
                                                                <c:when test="${order.status == 3}">
                                                                    <option value="1">Completed</option>
                                                                    <option value="2">Processing</option>
                                                                    <option value="3" ${order.status == 3 ? 'selected' : ''}>Cancel</option>
                                                                </c:when>
                                                            </c:choose>
                                                        </select>
                                                        <input type="hidden" name="orderId" value="${order.order_id}">
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:if>
                                        <c:set var="previousOrderId" value="${order.order_id}" />
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light text-center rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h4 class="mb-0">OrderDetails</h4>
                            <a href="">Show All</a>
                        </div>
                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0">
                                <thead>
                                    <tr class="text-dark">
                                        <th scope="col">OrderId</th>
                                        <th scope="col">ProductId</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Price</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:forEach items="${requestScope.dataDetails}" var="orderDetails" varStatus="loop">
                                        <tr>
                                            <td>${orderDetails.order_id}</td>
                                            <td>${orderDetails.product_id}</td>
                                            <td>${orderDetails.product.name}</td>
                                            <td>${orderDetails.quantity}</td>
                                            <td><fmt:formatNumber value="${orderDetails.product.price}" type="number" />đ</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/chart/chart.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <script>
                        function changeStatus(selectBox) {
                            var form = selectBox.parentElement;
                            var statusValue = selectBox.value;
                            var hiddenInput = document.createElement('input');
                            hiddenInput.type = 'hidden';
                            hiddenInput.name = 'status';
                            hiddenInput.value = statusValue;
                            form.appendChild(hiddenInput);
                            form.submit();
                        }
        </script>

    </body>
</html>
