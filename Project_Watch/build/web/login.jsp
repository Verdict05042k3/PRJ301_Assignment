<%-- 
    Document   : login
    Created on : Feb 26, 2024, 8:24:08 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
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
        <link rel="icon" href="image//Vẽ tay Hình tròn Logo.png" type="images/x-icon">
    </head>
    <body>
        <section class="vh-100" style="background-color: #005A5A;
                 background-image: url(images/login-background7.png); background-size: contain;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-xl-10">
                        <div class="card" style="border-radius: 1rem; background-color: whitesmoke">
                            <div class="row g-0">
                                <div class="col-md-6 col-lg-5 d-none d-md-block">
                                    <img src="image/snapedit_1707235130251.png" alt=""/>
                                </div>
                                <div class="col-md-6 col-lg-7 d-flex align-items-center">
                                    <div class="card-body p-4 p-lg-5 text-black">
                                        <!-- Login Form -->
                                        <form action="login" method="post">

                                            <h4 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;"><b>Sign into your account</b></h4>

                                            <div class="form-outline mb-4">
                                                <!-- Username -->
                                                <div class="input-group">
                                                    <span class="input-group-text">
                                                        <i class="fas fa-user"></i>
                                                    </span>
                                                    <input type="text" name="user" id="form2Example17" class="form-control form-control-lg" placeholder="username or email" value="${requestScope.username}"/>
                                                </div>
                                            </div>

                                            <div class="form-outline mb-4">
                                                <!-- Password -->
                                                <div class="input-group">
                                                    <span class="input-group-text">
                                                        <i class="fas fa-lock"></i>
                                                    </span>
                                                    <input type="password" name="pass" id="form2Example27" placeholder="password" class="form-control form-control-lg"/>
                                                </div>
                                            </div>
                                                
                                                
                                            <c:set value="${requestScope.error}" var="c"/>
                                            <p style="color: red">${c}</p>
                                            <div class="pt-1 mb-4">
                                                <input class="btn btn-dark btn-lg btn-block" type="submit" value="Login">
                                            </div>

                                            <a class="small text-muted" href="#!">Forgot password?</a>
                                            <p class="mb-5 pb-lg-2" style="color: #393f81;">Don't have an account? <a href="signup.jsp"
                                                                                                                      style="color: #393f81;">SignUp here</a></p>
                                            <a href="#!" class="small text-muted">Terms of use.</a>
                                            <a href="#!" class="small text-muted">Privacy policy</a>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
