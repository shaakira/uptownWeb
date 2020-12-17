<%@ page import="java.util.*" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Uptown</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}resources/img/Capture.PNG" rel="icon">
    <link href="${pageContext.request.contextPath}resources/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

    <!-- Bootstrap CSS File -->
    <link href="${pageContext.request.contextPath}resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Libraries CSS Files -->
    <link href="${pageContext.request.contextPath}resources/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}resources/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Main Stylesheet File -->
    <link href="${pageContext.request.contextPath}resources/style/style.css" rel="stylesheet">
    <style>
        body {
            font-family: "Lato", sans-serif;
            margin:0;
        }

        .sidenav {
            height: 100%;
            width: 250px;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #111;
            overflow-x: hidden;
            transition: 0.5s;
            padding-top: 60px;
            margin-top: 100px;
        }

        .sidenav a {
            padding: 30px 8px 8px 32px;
            text-decoration: none;
            font-size: 25px;
            color: #818181;
            display: block;
            transition: 0.3s;
        }

        .sidenav a:hover {
            color: #f1f1f1;
        }
        .sidenav a:active {
            color: #f1f1f1;
        }

        .sidenav .closebtn {
            position: absolute;
            top: 0;
            right: 25px;
            font-size: 36px;
            margin-left: 50px;
        }

        @media screen and (max-height: 450px) {
            .sidenav {padding-top: 15px;}
            .sidenav a {font-size: 18px;}
        }

        * {
            box-sizing: border-box;
        }

        .row > .column {
            padding: 0 8px;
        }

        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        .column {
            float: left;
            width: 25%;
        }

        /* The Modal (background) */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            padding-top: 100px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.7);

        }

        /* Modal Content */
        .modal-content {
            position: relative;
            background-color: #fefefe;
            margin: auto;
            padding: 0;
            width: 90%;
            max-width: 1200px;
        }

        /* The Close Button */
        .close {
            color: white;
            position: absolute;
            top: 10px;
            right: 25px;
            font-size: 35px;
            font-weight: bold;
            z-index:19;
        }

        .close:hover,
        .close:focus {
            color: #999;
            text-decoration: none;
            cursor: pointer;
        }

        .mySlides {
            display: none;
        }

        .cursor {
            cursor: pointer;
        }

        /* Next & previous buttons */
        .prev,
        .next {
            cursor: pointer;
            position: absolute;
            top: 50%;
            width: auto;
            padding: 16px;
            margin-top: -50px;
            color: white;
            font-weight: bold;
            font-size: 20px;
            transition: 0.6s ease;
            border-radius: 0 3px 3px 0;
            user-select: none;
            -webkit-user-select: none;
        }

        /* Position the "next button" to the right */
        .next {
            right: 0;
            border-radius: 3px 0 0 3px;
        }

        /* On hover, add a black background color with a little bit see-through */
        .prev:hover,
        .next:hover {
            background-color: rgba(0, 0, 0, 0.8);
        }

        /* Number text (1/3 etc) */
        .numbertext {
            color: #f2f2f2;
            font-size: 12px;
            padding: 8px 12px;
            position: absolute;
            top: 0;
        }

        img {
            margin-bottom: -4px;
        }

        .caption-container {
            text-align: center;
            background-color: black;
            padding: 2px 16px;
            color: white;
        }

        .demo {
            opacity: 0.6;
        }

        .active,
        .demo:hover {
            opacity: 1;
        }

        img.hover-shadow {
            transition: 0.3s;
        }

        .hover-shadow:hover {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

    </style>
</head>

<body>


<jsp:include page="adminDashboard.jsp"/>
<div id="mySidenav" class="sidenav">
    <a href="/adminPage">Dashboard</a>
    <a href="/adminAbout">Profile</a>
    <a href="/propertyList" style="color: white">Properties</a>
    <a href="/clients">Clients</a>
    <a href="/contacts">Contact</a>
</div>

<div style="margin-left: 250px; margin-top: 150px">
    <nav>
        <div class="nav nav-tabs" id="nav-tab" role="tablist">
            <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true" style="font-size: 20px">Pending Property Request</a>
            <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false" style="font-size: 20px">Published Properties</a>

        </div>
    </nav>

</div>
<div  style="margin-left: 250px; margin-top: 110px; height: 100%">


    <div class="tab-content" id="nav-tabContent">
        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
            <div  style="margin-left: 50px; margin-right: 50px">
                <c:if test="${not empty properties}"  >

                    <table class="table" style="margin-top: 40px">
                        <thead class="thead-light">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Heading</th>
                            <th scope="col">Address</th>
                            <th scope="col">Property Type</th>
                            <th scope="col">Price/Rate</th>
                            <th scope="col">Features</th>
                            <th scope="col">Description</th>
                            <th scope="col">Advertiser</th>
                            <th scope="col">Image</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="tempProp" items="${properties}" varStatus="vs">
                            <tr>
                                <th scope="row">${tempProp.id}</th>
                                <td>${tempProp.heading}</td>
                                <td>${tempProp.street}, ${tempProp.city}, ${tempProp.province}</td>
                                <td>${tempProp.pType}</td>
                                <td>${tempProp.rate} ${tempProp.rateType}</td>
                                <td>${tempProp.features}</td>
                                <td>${tempProp.description}</td>
                                <td>${tempProp.user.userName}</td>
                                    <%--<td><a onclick="openModal();currentSlide(1)" style="color: #2eca6a">View Image</a></td>--%>
                                <td><a data-toggle="modal" data-target="#myModal${tempProp.id}"   style="color: #2eca6a">View Image</a></td>

                                <td>
                                    <a href="/acceptProperty/${tempProp.id}"><button type="button" class="btn btn-outline-success"><span class="ion-ios-checkmark"></span></button></a>
                                    <a href="/rejectProperty/${tempProp.id}"> <button type="button" class="btn btn-outline-danger"><span class="ion-ios-trash"></span></button></a>
                                </td>
                            </tr>

                            <div id="myModal${tempProp.id}" class="modal" style="position: absolute; z-index:100000; ">
                                <div class="modal-content"  >
                                        <div class="container" >

                                            <div id="myCarousel${tempProp.id}" class="carousel slide" data-ride="carousel" >
                                                <!-- Indicators -->
                                                <ol class="carousel-indicators" >
                                                    <li data-target="#myCarousel${tempProp.id}" data-slide-to="0" class="active"></li>
                                                    <li data-target="#myCarousel${tempProp.id}" data-slide-to="1"></li>
                                                    <li data-target="#myCarousel${tempProp.id}" data-slide-to="2"></li>
                                                </ol>

                                                <!-- Wrapper for slides -->
                                                <div class="carousel-inner" >
                                                    <div class="item active" >
                                                        <img src="resources/Image/${tempProp.image1}" alt="Los Angeles" width="1200px" height="600px" style="max-height: 500px; min-height: 500px">
                                                    </div>

                                                    <div class="item">
                                                        <img src="resources/Image/${tempProp.image2}" alt="Chicago" width="1200px" height="600px" style="max-height: 500px;min-height: 500px">
                                                    </div>

                                                    <div class="item"  >
                                                        <img src="resources/Image/${tempProp.image3}" alt="New york" width="1200px" height="600px" style="max-height: 500px;min-height: 500px">
                                                    </div>
                                                </div>
                                                <!-- Left and right controls -->
                                                <a class="left carousel-control" href="#myCarousel${tempProp.id}" data-slide="prev" >
                                                    <span class="glyphicon glyphicon-chevron-left"></span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                                <a class="right carousel-control" href="#myCarousel${tempProp.id}" data-slide="next">
                                                    <span class="glyphicon glyphicon-chevron-right"></span>
                                                    <span class="sr-only">Next</span>
                                                </a>
                                            </div>
                                        </div>

                                </div>
                            </div>
                        </c:forEach>

                        </tbody>
                    </table>


                </c:if>
                <c:if test="${empty properties}"  >
                    <div style="background-color: #f5f5f5; height: 400px; text-align: center">
                        <img src="resources/img/req.png" style=" margin-top: 100px" width="120px" height="120px">

                        <h4 style="margin-top: 12px">No Pending Requests</h4>
                    </div>
                </c:if>
            </div>
        </div>
        <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
            <div  style="margin-left: 50px; margin-right: 50px">
                <c:if test="${not empty published}"  >

                    <table class="table" style="margin-top: 70px">
                        <thead class="thead-light">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Heading</th>
                            <th scope="col">Address</th>
                            <th scope="col">Property Type</th>
                            <th scope="col">Price/Rate</th>
                            <th scope="col">Features</th>
                            <th scope="col">Description</th>
                            <th scope="col">Advertiser</th>

                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="tempProp" items="${published}">
                            <tr>
                                <th scope="row">${tempProp.id}</th>
                                <td>${tempProp.heading}</td>
                                <td>${tempProp.street}, ${tempProp.city}, ${tempProp.province}</td>
                                <td>${tempProp.pType}</td>
                                <td>${tempProp.rate} ${tempProp.rateType}</td>
                                <td>${tempProp.features}</td>
                                <td>${tempProp.description}</td>
                                <td>${tempProp.user.userName}</td>

                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </div></div>

    </div>



</div>
<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>




<!-- JavaScript Libraries -->
<script src="${pageContext.request.contextPath}resources/lib/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}resources/lib/jquery/jquery-migrate.min.js"></script>
<script src="${pageContext.request.contextPath}resources/lib/popper/popper.min.js"></script>
<script src="${pageContext.request.contextPath}resources/lib/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}resources/lib/easing/easing.min.js"></script>
<script src="${pageContext.request.contextPath}resources/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}resources/lib/scrollreveal/scrollreveal.min.js"></script>
<!-- Contact Form JavaScript File -->
<script src="${pageContext.request.contextPath}resources/contactForm/contactform.js"></script>

<!-- Template Main Javascript File -->
<script src="${pageContext.request.contextPath}resources/js/main.js"></script>
</body>
</html>
