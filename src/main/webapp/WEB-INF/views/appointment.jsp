<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Uptown</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

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
    <link href="${pageContext.request.contextPath}resources/lib/owlcarousel/assets/owl.carousel.min.css"
          rel="stylesheet">

    <!-- Main Stylesheet File -->
    <link href="${pageContext.request.contextPath}resources/style/style.css" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
        }

        body {

            background: #f8fcf7;
        }

        /* Header/Blog Title */
        .header {
            padding: 30px;
            text-align: center;
            background: white;
        }

        .header h1 {
            font-size: 50px;
        }

        /* Style the top navigation bar */
        .topnav {
            overflow: hidden;
            background-color: #333;
        }

        /* Style the topnav links */
        .topnav a {
            float: left;
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        /* Change color on hover */
        .topnav a:hover {
            background-color: #ddd;
            color: black;
        }

        /* Create two unequal columns that floats next to each other */
        /* Left column */
        .leftcolumn {
            float: left;
            width: 60%;
            padding-left: 10px;
        }

        /* Right column */
        .rightcolumn {
            float: left;
            width: 40%;
            background-color: #f8fcf7;
            padding-left: 20px;
        }

        /* Fake image */
        .fakeimg {
            background-color: white;
            width: 100%;
            padding: 20px;
            padding: 10px;
            box-shadow: 5px 5px 5px 3px #888888;
        }

        /* Fake image */
        .fakeimg1 {
            background-color: white;
            width: 100%;
            padding: 20px;
            padding: 10px;
            border-top: 1px solid #6c757d;
            border-bottom: 1px solid #6c757d;

        }

        /* Add a card effect for articles */
        .card {
            background-color: white;
            padding: 20px;
            margin-top: 20px;
        }

        /* Clear floats after the columns */
        .row:after {
            content: "";
            display: table;
            clear: both;
        }
        .done{
            /*margin-top: 20px;*/
        }
        .image{
            filter: grayscale(100%);
        }
        .image:hover{
            filter: grayscale(0%);
        }

        /* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other */
        @media screen and (max-width: 800px) {
            .leftcolumn, .rightcolumn {
                width: 100%;
                padding: 0;
            }
        }

        /* Responsive layout - when the screen is less than 400px wide, make the navigation links stack on top of each other instead of next to each other */
        @media screen and (max-width: 400px) {
            .topnav a {
                float: none;
                width: 100%;
            }
        }
    </style>

</head>

<body>


<jsp:include page="search.jsp"/>
<jsp:include page="advertiserNav.jsp"/>

<div style="margin-top: 100px; padding: 10px;">
    <div class="row">
        <div class="leftcolumn">
            <div class="card">
                <h2>Pending Appointments</h2>
                <c:if test="${not empty pending}">
                    <c:forEach items="${pending}" var="temp">
                        <div class="fakeimg" style="height:320px; margin-top: 50px; border-left: 10px solid #00a33f; ">
                            <div style="padding: 20px">
                                <div class="row"><p style="width: 50%;padding-left: 16px">Name : ${temp.name}</p>
                                    <p style="width: 50%">Phone : ${temp.customerContact}</p></div>

                                <p>Email : ${temp.email}</p>
                                <div class="row"><p style="width: 50%;padding-left: 16px">Date : ${temp.date}</p>
                                    <p style="width: 50%">Time : ${temp.time}</p></div>
                                <div class="row"><p style="width: 50%;padding-left: 16px">Property Name
                                    : ${temp.property.heading}</p>
                                    <p style="width: 50%">Property Id : ${temp.property.id}</p></div>
                                <p>Description : ${temp.note}</p>
                                <div style="  position: absolute;right: 40px; padding-top: 20px">
                                    <a href="/acceptAppointment/${temp.id}">
                                        <button type="button" class="btn btn-outline-success">Accept</button>
                                    </a>
                                    <a href="/rejectAppointment/${temp.id}">
                                        <button type="button" class="btn btn-outline-danger">Reject</button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${empty pending}">
                    <div style="background-color: #f5f5f5; height: 400px;  margin-top: 50px; text-align: center">
                        <img src="resources/img/req.png" style=" margin-top: 100px" width="120px" height="120px">

                        <h4 style="margin-top: 12px">No Pending Requests</h4>
                    </div>
                </c:if>

            </div>

        </div>
        <div class="rightcolumn">
            <div class="card">
                <h2>Appointments</h2>
                <c:if test="${not empty accept}">
                    <c:forEach items="${accept}" var="tempAccept">

                        <div class="fakeimg1 row" style="height:200px; margin-top: 50px; margin-left: 20px">
                            <div class="row">
                            <div class="done">
                                <a href="/completedAppointment/${tempAccept.id}">
                                    <img class="image"
                                         src="resources/img/done.png"  width="40px"
                                         height="40px">
                                </a>
                                <a href="/cancelAppointment/${tempAccept.id}">
                                    <img style="margin-top: 100px; margin-left: -40px"
                                         src="resources/img/cls.png"  width="40px"
                                         height="40px">
                                </a>
                            </div>
                            <div  style="width: 220px; border-right: 5px solid #0c5460; height: 180px; text-align: center; padding-top: 50px;margin-left: 20px">


                                    <h3>${tempAccept.date}</h3>
                                <h5 style="color: #2B2A2A">${tempAccept.time}</h5>

                            </div>
                            </div>
                            <div style="margin-left: 30px">
                                <a data-toggle="modal" data-target="#myModal${tempAccept.id}"> <h3>${tempAccept.property.heading}</h3></a>
                                <br>
                                <p>Name : ${tempAccept.name}</p>
                                <p>Contact : ${tempAccept.customerContact}</p>
                                <p>Prop Id : ${tempAccept.property.id}</p>
                            </div>

                        </div>

                        <div id="myModal${tempAccept.id}" class="modal" style="z-index:100000; width: 70%;">
                            <div class="modal-content"
                                 style=" position: relative; display: flex;flex-direction: column;margin-top: 200px; margin-left: 400px">
                                <div class="container" style="height: 500px; width: 500px">

                                    <div id="myCarousel${tempAccept.id}" class="carousel slide" data-ride="carousel">
                                        <div style="margin-top: 40px; margin-left: -300px">
                                            <div class="row">

                                                <div style="margin-left: 20px"><img
                                                        src="resources/Image/${tempAccept.user.image}" width="120px"
                                                        height="120px"></div>
                                                <div style="margin-left: 20px">
                                                    <h3 style="text-transform:capitalize;">${tempAccept.user.firstName} ${tempAccept.user.lastName}</h3>
                                                    <p>Phone: 0${tempAccept.customerContact}</p>
                                                    <p>Email: ${tempAccept.email}</p>
                                                </div>
                                            </div>
                                            <div style="margin-top: 10px; padding-right: 100px">
                                                <h5>Note :</h5>
                                                <p>${tempAccept.note}</p>
                                            </div>
                                            <div class="row" style="margin-left: 70px;margin-top: 60px">
                                                <div class="row"
                                                     style="width: 300px; height: 150px; background-color: #e3e3e3;  padding-top: 40px;padding-left: 20px">
                                                    <div style="border-radius: 50%; background-color:#25abcc;height: 60px; width: 60px; padding-top: 20px ">
                                                        <img src="resources/img/date.png" width="50px" height="40px"
                                                             style="padding-left: 12px;margin-top: -13px">
                                                    </div>
                                                    <div style="padding-left: 20px">
                                                        <h5> ${tempAccept.date}</h5>
                                                        <p style="color: black">Time: ${tempAccept.time}</p>
                                                    </div>
                                                </div>
                                                <div class="row"
                                                     style="width: 300px; height: 150px; background-color: #e3e3e3;padding-top: 40px;padding-left: 20px; border-left: 5px solid white">
                                                    <div style="background-color: #fac934; border-radius: 50%; height: 60px; width: 60px;padding-top: 20px ">
                                                        <img src="resources/img/home.png" width="50px" height="40px"
                                                             style="padding-left: 12px;margin-top: -13px ">
                                                    </div>
                                                    <div style="padding-left: 20px">
                                                        <h5> ${tempAccept.property.heading}</h5>
                                                        <p style="color: black">Property
                                                            Id: ${tempAccept.property.id}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                </div>

                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${empty accept}">
                    <div style="background-color: #f5f5f5; height: 200px;  margin-top: 50px; text-align: center">
                        <h4 style="margin-top: 82px">No Scheduled Appointments</h4>
                    </div>
                </c:if>


            </div>

        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>

<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

</div>


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
