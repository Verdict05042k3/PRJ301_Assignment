<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Content Details</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer">
        <link rel="stylesheet" href="css/details.css">
    </head>
    <body>
        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6">
                        <img
                            class="card-img-top mb-5 mb-md-0"
                            src="image/${products.image_url}"
                            alt="..."
                            />
                    </div>
                    <div class="col-md-6">
                        <div class="text">
                            <h1 class="display-5 fw-bolder">${products.name}</h1>

                            <p class="lead">
                                ${products.description}
                            </p>
                        </div>
                        <div class="fs-5 mb-5">
                            <span>Giá: <fmt:formatNumber value="${products.price}" type="number"/>đ</span>  
                            <span><del><fmt:formatNumber value="${products.old_price}" type="number"/>đ</del></span>
                            <br>
                            <span>Trong kho: ${products.quantity}</span>
                            <span id="quantityErrorMessage" style="color: red; display: none;">Không đủ số lượng</span>
                        </div>
                        <div class="d-flex">
                            <input
                                class="form-control text-center me-3"
                                id="inputQuantity"
                                type="number"
                                min="0"
                                value="1"
                                style="max-width: 3rem"
                                onchange="updateQuantity()"
                                />
                            <form action="addCart" method="post">

                                <input type="hidden" id="productIdInput" name="product_id" value="${products.product_id}">
                                <input type="hidden" id="quantityInput1" name="quantity" value="1">

                                <button class="btn btn-outline-dark flex-shrink-0" type="submit">
                                    <i class="bi-cart-fill me-1"></i>
                                    Thêm vào giỏ
                                </button>
                            </form>
                            <form action="buy" method="get">
                                <input type="hidden" id="productIdInput" name="id_product" value="${products.product_id}">
                                <input type="hidden" id="quantityInput2" name="quantity" value="1">
                                <button
                                    class="btn btn-outline-dark flex-shrink-0"
                                    type="submit"
                                    style="margin-left: 10px"
                                    >
                                    <i class="bi-cart-fill me-1"></i>
                                    Mua
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Related items section-->
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">${brands.name}</h2>

                <c:forEach items="${requestScope.product}" var="product" varStatus="loop">
                    <!-- Start a new row after every 4 products -->
                    <c:if test="${loop.index % 4 == 0}">
                        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                        </c:if>
                        <div class="col mb-5 position-relative">
                            <div class="card h-100">
                                <!-- Sale badge-->
                                <div class="badge text-white position-absolute top-10 start-50 translate-middle" style="background: red; margin-top: 20px">
                                    Sale
                                </div>
                                <!-- Product image-->
                                <img class="card-img-top" src="image/${product.image_url}" alt="...">
                                <!-- Product details-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name-->
                                        <h5 class="fw-bolder">${product.name}</h5>
                                        <fmt:formatNumber value="${product.price}" type="number"/>đ
                                        <del><fmt:formatNumber value="${product.old_price}" type="number"/>đ</del>
                                    </div>
                                </div>
                                <!-- Product actions-->
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <div class="product-action"  style="margin-left: 70px">
                                        <a
                                            href="details?id_product=${product.product_id}"
                                            class="btn details-btn"
                                            ><i class="fa fa-eye"></i>
                                        </a>
                                        <a href="buy?id_product=${product.product_id}" class="btn buy-btn"
                                           ><i class="fa fa-shopping-cart"></i
                                            ></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Close the row after every 4 products -->
                        <c:if test="${loop.index % 4 == 3 or loop.last}">
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </section>
        <script>
            function updateQuantity() {
                var quantity = document.getElementById('inputQuantity').value;
                var availableQuantity = parseInt("${products.quantity}");
                if (parseInt(quantity) > availableQuantity) {
                    document.getElementById('quantityErrorMessage').style.display = "block";
                } else {
                    document.getElementById('quantityErrorMessage').style.display = "none";
                }
                document.getElementById('quantityInput1').value = quantity; // Cập nhật cho form addCart
                document.getElementById('quantityInput2').value = quantity; // Cập nhật cho form buy
            }
        </script>

    </body>
</html>
