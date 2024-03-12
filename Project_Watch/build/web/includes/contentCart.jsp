<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>contentCart</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
              crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>
        <style>
            .table {
                border: 2px solid #ccc; /* Màu và độ dày của viền */
                border-radius: 10px; /* Độ cong của góc */
            }

            th, td {
                border: 1px solid #ccc; /* Màu và độ dày của đường viền giữa các ô */
                padding: 8px; /* Khoảng cách nội dung với viền */
            }

            th {
                background-color: #f2f2f2; /* Màu nền của tiêu đề cột */
            }

        </style>
    </head>
    <body>
        <div class="container">
            <div class="row justify-content-center"  style="margin: 50px 0px 50px 0px">
                <div class="col-sm-12 col-md-10 col-md-offset-1">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th><h3>Product</h3></th>
                                <th><h3>Quantity</h3></th>
                                <th class="text-center"><h3>Price</h3></th>
                                <th class="text-center"><h3>Total</h3></th>
                                <th> </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.data}" var="product" varStatus="loop">
                                <tr>
                                    <td class="col-md-6">
                                        <div class="media">
                                            <a class="thumbnail pull-left" href="#">
                                                <img class="media-object" src="image/${product.image_url}"
                                                     style="width: 72px; height: 72px"/>
                                            </a>
                                            <div class="media-body">
                                                <h5 class="media-heading">
                                                    <a href="details?id_product=${product.product_id}">${product.name}</a>
                                                </h5>
                                            </div>
                                        </div>
                                    </td>

                                    <c:forEach items="${requestScope.dataQuantity}" var="dataQuantity" varStatus="innerLoop">
                                        <c:if test="${product.product_id eq dataQuantity.product_id}">                                      
                                            <td class="col-md-1" style="text-align: center">
                                                <input type="number" class="form-control" name="quantity" value="${dataQuantity.quantity}" min="0" readonly/>
                                            </td>
                                        </c:if>
                                    </c:forEach>


                                    <td class="col-md-1 text-center"><strong><fmt:formatNumber value="${product.price}" type="number"/>đ</strong></td>
                                    <c:forEach items="${requestScope.dataQuantity}" var="dataQuantity" varStatus="innerLoop">
                                        <c:if test="${product.product_id eq dataQuantity.product_id}">    
                                            <td class="col-md-1 text-center"><strong><fmt:formatNumber value="${product.price * dataQuantity.quantity}" type="number" />đ</strong></td>
                                        </c:if>
                                    </c:forEach>

                                    <td class="col-md-1">
                                        <form action="deleteCart" method="get" >
                                            <button type="submit" class="btn btn-danger">
                                                <input type="hidden" id="productIdInput" name="product_id" value="${product.product_id}">
                                                <span class="glyphicon glyphicon-remove"></span> Remove
                                            </button>
                                        </form>
                                    </td> 
                                </tr>
                            </c:forEach>
                            <tr>
                                <td><h4>Total: </h4></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="text-right">
                                    <c:set var="total" value="0" />    <!-- Khởi tạo biến total -->
                                    <c:forEach items="${requestScope.data}" var="product" varStatus="loop">
                                        <c:forEach items="${requestScope.dataQuantity}" var="dataQuantity" varStatus="innerLoop">
                                            <c:if test="${product.product_id eq dataQuantity.product_id}">      
                                                <c:set var="total" value="${total + product.price * dataQuantity.quantity}" /> <!-- Cập nhật tổng -->
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
                                    <h5><strong><fmt:formatNumber value="${total}" type="number"/>đ</strong></h5>
                                </td>
                            </tr>

                            <tr>
                                <td> <h5 style="color: red">${requestScope.error}</h5></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <form action="checkout" method="get">
                                        <button type="submit" class="btn btn-success">
                                            Checkout <span class="glyphicon glyphicon-play"></span>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>   
                                
    </body>
</html>
