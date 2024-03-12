<%-- 
    Document   : signup
    Created on : Feb 27, 2024, 1:35:44 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SignUp</title>
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
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
            />
        <link rel="icon" href="image//Vẽ tay Hình tròn Logo.png" type="images/x-icon">
        <style>
            body {
                background-color: #005a5a;
            }

        </style>
    </head>
    <body>
        <div class="container-fluid" style="margin-top: 50px">
            <div class="">
                <div class="rounded d-flex justify-content-center">
                    <div class="col-md-4 col-sm-12 shadow-lg p-5 bg-light">
                        <div class="text-center">
                            <h3 class="text-primary">Create Account</h3>
                        </div>
                        <div class="p-4">
                            <form action="signup" method="post">
                                <div class="input-group mb-3">
                                    <span class="input-group-text bg-primary"
                                          ><i class="bi bi-person-plus-fill text-white"></i
                                        ></span>
                                    <input
                                        type="text"
                                        class="form-control"
                                        name="user"
                                        placeholder="Username"
                                        required
                                        value="${requestScope.username}"
                                        />
                                </div>
                                <c:set value="${requestScope.usernameError}" var="c"/>
                                <p style="color: red">${c}</p>
                                <div class="input-group mb-3">
                                    <span class="input-group-text bg-primary"
                                          ><i class="bi bi-key-fill text-white"></i
                                        ></span>
                                    <input
                                        type="password"
                                        class="form-control"
                                        placeholder="Password"
                                        name="pass"
                                        required
                                        value="${requestScope.password}"
                                        />
                                </div>
                                <div class="input-group mb-3">
                                    <span class="input-group-text bg-primary"
                                          ><i class="bi bi-lock-fill text-white"></i>
                                    </span>
                                    <input
                                        type="password"
                                        class="form-control"
                                        placeholder="Repeat Password"
                                        name ="repass"
                                        required
                                        value="${requestScope.repass}"
                                        />
                                </div>
                                <c:set value="${requestScope.passwordError}" var="c"/>
                                <p style="color: red">${c}</p>

                                <div class="input-group mb-3">
                                    <span class="input-group-text bg-primary"
                                          ><i class="bi bi-envelope text-white"></i
                                        ></span>
                                    <input
                                        type="email"
                                        class="form-control"
                                        placeholder="Email"
                                        name="email"
                                        required
                                        value="${requestScope.email}"
                                        />
                                </div>
                                <c:set value="${requestScope.emailError}" var="c"/>
                                <p style="color: red">${c}</p>
                                <div class="input-group mb-3">
                                    <span class="input-group-text bg-primary"
                                          ><i class="bi bi-people text-white"></i>
                                    </span>
                                    <input
                                        type="text"
                                        class="form-control"
                                        placeholder="FullName"
                                        name="fullname"
                                        required
                                        value="${requestScope.fullname}"
                                        />
                                </div>

                                <div class="input-group mb-3">
                                    <span class="input-group-text bg-primary"
                                          ><i class="bi bi-geo-alt text-white"></i>
                                    </span>
                                    <input
                                        type="text"
                                        class="form-control"
                                        placeholder="Address"
                                        name="address"
                                        required
                                        value="${requestScope.address}"
                                        />
                                </div>

                                <div class="input-group mb-3">
                                    <span class="input-group-text bg-primary"
                                          ><i class="bi bi-telephone-fill text-white"></i>
                                    </span>
                                    <input type="text" class="form-control" placeholder="Phone" name="phone" value="${requestScope.phone}" required/>
                                </div>

                                <div class="d-grid col-12 mx-auto">
                                    <button class="btn btn-primary" type="submit">
                                        Sign up
                                    </button>
                                </div>    
                            </form>
                            <a href="homepage">Back HomePage</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
