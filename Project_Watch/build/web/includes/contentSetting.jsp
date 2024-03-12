<%-- 
    Document   : contentSetting
    Created on : Mar 10, 2024, 8:23:23 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    </head>
    <body>
        <div class="container-fluid" style="margin-top: 20px">
            <div class="main-body" >
                <div class="row justify-content-center">

                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-body">
                                <h1 style="text-align: center">My Profile</h1>
                                <form action="setting" method="post">
                                    <div class="row mb-3" hidden>
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Full Name</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="text" class="form-control" name="userid" value="${user.user_id}" />
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">User Name</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="text" class="form-control" name="username" value="${user.username}"  readonly />
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Full Name</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="text" class="form-control" name="fullname" value="${user.full_name}" />
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Email</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input
                                                type="text"
                                                class="form-control"
                                                value="${user.email}"
                                                name="email"
                                                />
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Phone</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input
                                                type="text"
                                                class="form-control"
                                                value="${user.phone_number}"
                                                name="phone"
                                                />
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Address</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input
                                                type="text"
                                                class="form-control"
                                                value="${user.address}"
                                                name="address"
                                                />
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-3"></div>
                                        <div class="col-sm-9 text-secondary">
                                            <input
                                                type="submit"
                                                class="btn btn-primary px-4"
                                                value="Save Changes"
                                                />
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-body">
                                <h1 style="text-align: center">Change Password</h1>
                                <form action="changePassword" method="post">

                                    <div class="row mb-3">
                                        <div class="col-sm-4">
                                            <h6 class="mb-0">Old Password</h6>
                                        </div>
                                        <div class="col-sm-8 text-secondary">
                                            <input type="password" class="form-control" name="oldpass" value="" />
                                        </div>
                                        <c:set value="${requestScope.errorOld}" var="c"/>
                                        <p style="color: red">${c}</p>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-sm-4">
                                            <h6 class="mb-0">New Password</h6>
                                        </div>
                                        <div class="col-sm-8 text-secondary">
                                            <input
                                                type="password"
                                                class="form-control"
                                                value=""
                                                name="newpass"
                                                />
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-sm-4">
                                            <h6 class="mb-0">Repeat Password</h6>
                                        </div>
                                        <div class="col-sm-8 text-secondary">
                                            <input
                                                type="password"
                                                class="form-control"
                                                value=""
                                                name="repass"
                                                />
                                        </div>
                                        <c:set value="${requestScope.errorRe}" var="c"/>
                                        <p style="color: red">${c}</p>
                                    </div>


                                    <div class="row">
                                        <div class="col-sm-4"></div>
                                        <div class="col-sm-8 text-secondary">
                                            <input
                                                type="submit"
                                                class="btn btn-primary px-4"
                                                value="Save Changes"
                                                />
                                            <c:set value="${requestScope.success}" var="c"/>
                                            <p style="color: red">${c}</p>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
