<%-- 
    Document   : Carousel
    Created on : Feb 28, 2024, 8:02:13 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carousel</title>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
            />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
            />
        <style>
            .carousel-item img {
                height: 300px;
                width: auto;
            }

            .carousel-indicators{
                list-style-type: none;
            }
        </style>
    </head>
    <body>
        <!--Carousel-->

        <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
            <ol class="carousel-indicators">
                <li
                    data-bs-target="#myCarousel"
                    data-bs-slide-to="0"
                    class="active"
                    ></li>
                <li data-bs-target="#myCarousel" data-bs-slide-to="1"></li>
                <li data-bs-target="#myCarousel" data-bs-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img
                        src="https://cdn.techzones.vn/Data/Sites/1/media/tin-cong-nghe/v%E1%BB%9Bi-10-tri%E1%BB%87u-n%C3%AAn-ch%E1%BB%8Dn-%C4%91%E1%BB%93ng-h%E1%BB%93-th%C3%B4ng-minh-n%C3%A0o-ch%E1%BA%A5t-l%C6%B0%E1%BB%A3ng/%C4%91o%CC%82%CC%80ng-ho%CC%82%CC%80-tho%CC%82ng-minh-garmin-venu-2.jpg?w=1920"
                        class="d-block w-100"
                        alt="Panther"
                        />
                </div>
                <div class="carousel-item">
                    <img
                        src="https://hnie-assets.s3-eu-west-1.amazonaws.com/products/010-02172-02/vivo4s-watchline-1-e920a1f5-bf63-4806-be7a-8d3c8035ca04.webp"
                        class="d-block w-100"
                        alt="Black Cat"
                        />
                </div>
                <div class="carousel-item">
                    <img
                        src="https://cdn.techzones.vn/Data/Sites/1/News/2916/techzones-cac-loai-dong-ho-thong-minh.jpg"
                        class="d-block w-100"
                        alt="Lion"
                        />
                </div>
            </div>
            <button
                class="carousel-control-prev"
                type="button"
                data-bs-target="#myCarousel"
                data-bs-slide="prev"
                >
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button
                class="carousel-control-next"
                type="button"
                data-bs-target="#myCarousel"
                data-bs-slide="next"
                >
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div> 
    </body>
</html>
