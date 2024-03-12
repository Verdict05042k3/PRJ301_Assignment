<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Content Watch</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer">
        <link rel="stylesheet" href="css/details.css">
    </head>
    <body>
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">

                <c:forEach items="${requestScope.product}" var="product" varStatus="loop">
                    <c:if test="${loop.index % 4 == 0}">
                        <div class="row gx-4 gx-lg-5 row-cols-1 row-cols-md-2 row-cols-xl-4 justify-content-center">
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
                                        <a href="details?id_product=${product.product_id}" class="btn details-btn"><i class="fa fa-eye"></i></a>
                                        <a href="buy?id_product=${product.product_id}" class="btn buy-btn"><i class="fa fa-shopping-cart"></i></a>
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

        <!-- Pagination -->
        <nav aria-label="Page navigation example" class="d-flex justify-content-center mt-3">
            <ul class="pagination">
                <c:if test="${startPage > 1}">
                    <li class="page-item">
                        <c:url var="firstPageUrl" value="watch">
                            <c:param name="page" value="1" />
                            <c:if test="${not empty param.brand_id}">
                                <c:param name="brand_id" value="${param.brand_id}" />
                            </c:if>
                        </c:url>
                        <a class="page-link" href="${firstPageUrl}" aria-label="First">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:forEach begin="${startPage}" end="${endPage}" varStatus="loop">
                    <c:if test="${loop.index == thisPage}">
                        <li class="page-item active"><span class="page-link">${loop.index}</span></li>
                        </c:if>
                        <c:if test="${loop.index != thisPage}">
                        <li class="page-item">
                            <c:url var="pageUrl" value="watch">
                                <c:param name="page" value="${loop.index}" />
                                <c:if test="${not empty param.brand_id}">
                                    <c:param name="brand_id" value="${param.brand_id}" />
                                </c:if>
                            </c:url>
                            <a class="page-link" href="${pageUrl}">${loop.index}</a>
                        </li>
                    </c:if>
                </c:forEach>
                <c:if test="${maxPage > endPage}">
                    <li class="page-item">
                        <c:url var="lastPageUrl" value="watch">
                            <c:param name="page" value="${maxPage}" />
                            <c:if test="${not empty param.brand_id}">
                                <c:param name="brand_id" value="${param.brand_id}" />
                            </c:if>
                        </c:url>
                        <a class="page-link" href="${lastPageUrl}" aria-label="Last">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav>
        <!-- Pagination -->

    </body>
</html>
