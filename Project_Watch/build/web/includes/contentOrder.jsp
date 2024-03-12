<%-- 
    Document   : contentProfile
    Created on : Mar 9, 2024, 9:44:46 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link
            href="https://fonts.googleapis.com/css2?family=Baloo+2&display=swap"
            rel="stylesheet"
            />
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
        <link rel="stylesheet" href="css/myprofile.css" />
        <style>
            /* CSS */
            .rounded {
                border: 2px solid #ccc; /* Màu và độ dày của viền */
                border-radius: 10px; /* Độ cong của góc */
                padding: 20px; /* Khoảng cách nội dung với viền */
            }

            /* Tùy chỉnh màu nền khi chọn từ dropdown */
            select[name="status"] {
                background-color: #fff; /* Màu nền mặc định */
            }

        </style>
    </head>
    <body>
        <div class="container-fluid" style="margin: 30px 0px 30px 0px">
            <div class="main-body">
                <div class="row justify-content-center">

                    <div class="col-lg-8">

                        <div class="rounded">

                            <div class="table-responsive table-borderless">
                                <h1 style="text-align: center">Order History</h1>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th class="text-center">
                                                <div class="toggle-btn">
                                                    <div class="inner-circle"></div>
                                                </div>
                                            </th>
                                            <th>OrderID</th>
                                            <th>Total</th>
                                            <th>Date</th>
                                            <th>Status</th>
                                            <th>Details</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-body">
                                        <c:set var="previousOrderId" value="" />
                                        <c:forEach items="${requestScope.order}" var="order" varStatus="loop">
                                            <tr class="cell-1">
                                                <c:if test="${order.order_id != previousOrderId}">
                                                    <td class="text-center">
                                                        <div class="toggle-btn">
                                                            <div class="inner-circle"></div>
                                                        </div>
                                                    </td>
                                                    <td>${order.order_id}</td>
                                                    <td><fmt:formatNumber value="${order.total_price}" type="number" />đ</td>
                                                    <td>${order.order_date}</td>
                                                    <td>
                                                        <form action="myorder" method="post">
                                                            <select class="form-select form-select-sm" name="status" onchange="changeStatus(this)">
                                                                <c:choose>
                                                                    <c:when test="${order.status == 1}">
                                                                        <option value="1" ${order.status == 1 ? 'selected' : ''}>Completed</option>
                                                                    </c:when>
                                                                    <c:when test="${order.status == 2}">
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
                                                    <th><a href="detailsOrder?id=${order.order_id}">See Order</a></th>
                                                    </c:if>
                                            </tr>
                                            <c:set var="previousOrderId" value="${order.order_id}" />
                                        </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
