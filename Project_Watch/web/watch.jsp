<%-- 
    Document   : watch
    Created on : Mar 1, 2024, 10:47:25 PM
    Author     : admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Watch</title>
        <link rel="icon" href="image//Vẽ tay Hình tròn Logo.png" type="images/x-icon">

    </head>
    <body>
        <jsp:include page="includes/navbar.jsp"></jsp:include>
        <jsp:include page="includes/sort.jsp"></jsp:include>

        <c:if test="${not empty requestScope.notification}">
            <h1 style="text-align: center;">${requestScope.notification}</h1>
        </c:if>


        <jsp:include page="includes/contentwatch.jsp"></jsp:include>
        <jsp:include page="includes/footer.jsp"></jsp:include>
    </body>
</html>
