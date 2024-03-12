<%-- 
    Document   : search
    Created on : Mar 2, 2024, 8:38:21 PM
    Author     : admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Result</title>
        <link rel="icon" href="image//Vẽ tay Hình tròn Logo.png" type="images/x-icon">
    </head>
    <body>
        <jsp:include page="includes/navbar.jsp"></jsp:include>

        <c:if test="${not empty requestScope.notification}">
            <h1 style="text-align: center;">${requestScope.notification}</h1>
        </c:if>

        <jsp:include page="includes/contentwatch.jsp"></jsp:include>
        <jsp:include page="includes/footer.jsp"></jsp:include>
    </body>
</html>
