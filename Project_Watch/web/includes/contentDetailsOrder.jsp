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

            .rounded {
                border: 2px solid #ccc;
                border-radius: 10px;
                padding: 20px;
            }


            select[name="status"] {
                background-color: #fff;
            }

            .back-btn {
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                padding: 5px 20px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .back-btn:hover {
                background-color: #0056b3;
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
                                <h1 style="text-align: center">Order Details</h1>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th class="text-center">
                                                <div class="toggle-btn">
                                                    <div class="inner-circle"></div>
                                                </div>
                                            </th>
                                            <th>OrderID</th>
                                            <th>Product</th>
                                            <th>Quantity</th>
                                            <th>Price</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-body">
                                        <c:forEach items="${requestScope.data}" var="order" varStatus="loop">
                                            <tr class="cell-1">
                                                <td class="text-center">
                                                    <div class="toggle-btn">
                                                        <div class="inner-circle"></div>
                                                    </div>
                                                </td>
                                                <td>${order.order_id}</td>
                                                <td>${order.product.name}</td>
                                                <td>${order.quantity}</td>
                                                <td><fmt:formatNumber value="${order.product.price}" type="number" />đ</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th class="text-center">
                                                <div class="toggle-btn">
                                                    <div class="inner-circle"></div>
                                                </div>
                                            </th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th>
                                                <button class="back-btn" onclick="window.location.href = 'myorder'">Back to Home</button>
                                            </th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
        </script>
    </body>
</html>
