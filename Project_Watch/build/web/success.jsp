<%-- 
    Document   : success
    Created on : Mar 7, 2024, 10:45:34 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success</title>
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
        <link rel="icon" href="image//Vẽ tay Hình tròn Logo.png" type="images/x-icon">

        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f8f9fa;
                margin: 0;
                padding: 0;
            }

            .cd__intro {
                background-color: #343a40;
                color: #fff;
                padding: 20px;
                text-align: center;
            }

            .jumbotron {
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
                width: 70%;
                margin: auto; /* Đặt lề tự động để căn giữa */
                margin-top: 50px; /* Thêm lề trên */
                margin-bottom: 50px; /* Thêm lề dưới */
                padding: 40px; /* Thêm lề nội dung bên trong */
            }

            .jumbotron h1 {
                font-size: 3rem;
                margin-bottom: 20px;
            }

            .jumbotron p {
                font-size: 1.2rem;
                margin-bottom: 20px;
            }

            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
            }

            .btn-primary:hover {
                background-color: #0069d9;
                border-color: #0062cc;
            }
        </style>
    </head>
    <body>
        <jsp:include page="includes/navbar.jsp"></jsp:include>

            <main class="cd__main">
                <div class="jumbotron text-center">
                    <h1 class="display-3">Thank You!</h1>
                    <p class="lead">
                        <strong>Cảm ơn bạn đã mua hàng của chúng tôi</strong>
                    </p>
                    <hr />

                    <p class="lead">
                        <a class="btn btn-primary btn-sm" href="homepage" role="button"
                           >Continue to homepage</a
                        >
                    </p>
                </div>
            </main>

        <jsp:include page="includes/footer.jsp"></jsp:include>
    </body>
</html>
