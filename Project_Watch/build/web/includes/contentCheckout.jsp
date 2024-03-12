<%-- 
    Document   : contentCheckout
    Created on : Mar 7, 2024, 5:36:12 PM
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer">
        <link href="css/checkout.css" rel="stylesheet" />
    </head>
    <body>
        
       
        <form action="checkout" method="post">
            <section
                id="checkout_page"
                class="clearfix checkout"
                style="margin: 50px 0px 50px 0px"
                >
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6 checkout-form">
                            <div class="check_lm clearfix">
                                <div class="check_lm3 clearfix">
                                    <h3>Checkout ở đây:</h3>
                                </div>

                                <div class="check_lm4 clearfix">
                                    <input
                                        class="form-control mb-3"
                                        placeholder="Họ và tên"
                                        type="text"
                                        name="name"
                                        value="${user.full_name}"
                                        />
                                    <input
                                        class="form-control mb-3"
                                        placeholder="Số điện thoại"
                                        type="text"
                                        name="phone"
                                        value="${user.phone_number}"
                                        />
                                    <input
                                        class="form-control mb-3"
                                        placeholder="Email"
                                        type="email"
                                        value="${user.email}"
                                        />
                                    <input
                                        class="form-control mb-3"
                                        placeholder="Địa chỉ"
                                        type="text"
                                        name="address"
                                        value="${user.address}"
                                        />
                                </div>
                                <div class="checkout_1l3 clearfix">
                                    <hr />
                                    <div class="col-sm-12">
                                        <a href="displayCart" class="btn btn-secondary btn-return-cart"
                                           >Quay về giỏ hàng</a
                                        >
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="check_rm clearfix">
                                <h3>Giỏ Hàng</h3>
                                <c:forEach items="${requestScope.data}" var="product" varStatus="loop">
                                    <div class="checkout_1r mgt clearfix">
                                        <div class="checkout_1l2 mgt clearfix">
                                            <div class="row align-items-center">
                                                <div class="col-sm-2">
                                                    <img
                                                        src="image/${product.image_url}"
                                                        alt="abc"
                                                        class="iw img-fluid"
                                                        style="max-width: 110px; height: auto"
                                                        />
                                                </div>
                                                <div class="col-sm-10">
                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <p class="mgt" style="margin-left: 15px">
                                                                <b>${product.name}</b>
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <c:forEach items="${requestScope.dataQuantity}" var="dataQuantity" varStatus="innerLoop">
                                                            <c:if test="${product.product_id eq dataQuantity.product_id}">      
                                                                <div class="col-sm-4">
                                                                    <h6 style="margin-left: 20px">Số lượng: ${dataQuantity.quantity}</h6>
                                                                </div>
                                                            </c:if>
                                                        </c:forEach>

                                                        <div class="col-sm-4">
                                                            <h6>Giá: <fmt:formatNumber value="${product.price}" type="number"/>đ</h6>
                                                        </div>
                                                        <c:forEach items="${requestScope.dataQuantity}" var="dataQuantity" varStatus="innerLoop">
                                                            <c:if test="${product.product_id eq dataQuantity.product_id}">
                                                                <div class="col-sm-4 text-right">
                                                                    <h6>Total: <fmt:formatNumber value="${product.price * dataQuantity.quantity}" type="number" />đ</h6>
                                                                </div>
                                                            </c:if>
                                                        </c:forEach>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                                <div class="checkout_1r1 clearfix">
                                    <div class="checkout_1r1i clearfix">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <h5 class="mgt normal">Total: </h5>
                                            </div>
                                            <div class="col-sm-6 text-right">
                                                <c:set var="total" value="0" />    <!-- Khởi tạo biến total -->
                                                <c:forEach items="${requestScope.data}" var="product" varStatus="loop">
                                                    <c:forEach items="${requestScope.dataQuantity}" var="dataQuantity" varStatus="innerLoop">
                                                        <c:if test="${product.product_id eq dataQuantity.product_id}">      
                                                            <c:set var="total" value="${total + product.price * dataQuantity.quantity}" /> <!-- Cập nhật tổng -->
                                                        </c:if>
                                                    </c:forEach>
                                                </c:forEach>
                                                <h5 class="mgt">
                                                    <span class="col_3"><fmt:formatNumber value="${total}" type="number"/>đ</span>
                                                    <input value="${total}" name="totalPrice" hidden>
                                                </h5>
                                            </div>
                                        </div>
                                    </div>
                                    <hr />
                                </div>
                            </div>

                            <div class="checkout_1r1_wrapper">
                                <div class="checkout_1r1 clearfix">
                                    <div class="checkout_1r1i clearfix">
                                        <div class="col-sm-6 text-right" style="margin-left: 300px">
                                            <h5 class="mgt">
                                                <span class="col_3">
                                                    <button type="submit" class="btn btn-danger custom-button">Hoàn tất thanh toán</button>
                                                </span>
                                            </h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </form>
    </body>
</html>
