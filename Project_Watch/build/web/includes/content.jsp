<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Content</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
            integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <link rel="stylesheet" href="css/details.css" />

    </head>
    <body>

        <c:forEach items="${requestScope.brand}" var="brand">
            <section class="py-5 bg-light">
                <div class="container px-4 px-lg-5 mt-5">
                    <h2 class="fw-bolder mb-4">${brand.name}</h2>
                    <div class="row row-cols-1 row-cols-md-4 g-4">
                        <%-- Initialize a counter for the number of products --%>
                        <c:set var="productCount" value="0" />

                        <c:forEach items="${requestScope.product}" var="product">
                            <%-- Check if the product's brand_id matches the current brand's brand_id --%>
                            <c:if test="${product.brand_id == brand.brand_id}">
                                <%-- Check if the number of products for the current brand is less than 4 --%>
                                <c:if test="${productCount < 4}">
                                    <%-- Increase the product count --%>
                                    <c:set var="productCount" value="${productCount + 1}" />

                                    <%-- Display the product --%>
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
                                                <div class="product-action" style="margin-left: 70px">
                                                    <a href="details?id_product=${product.product_id}" class="btn details-btn"><i class="fa fa-eye"></i></a>
                                                    <a href="buy?id_product=${product.product_id}" class="btn buy-btn"><i class="fa fa-shopping-cart"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </section>
        </c:forEach>

    </body>
</html>
