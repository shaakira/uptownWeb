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

        .done {
            margin-top: 60px;
        }

        .image {
            filter: grayscale(100%);
        }

        .image:hover {
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

        /* Float four columns side by side */
        .column {
            float: left;
            width: 25%;
            padding: 0 10px;
        }

        /* Remove extra left and right margins, due to padding */
        .row1 {
            margin: 0 -5px;
        }

        /* Clear floats after the columns */
        .row1:after {
            content: "";
            display: table;
            clear: both;
        }

        /* Responsive columns */
        @media screen and (max-width: 600px) {
            .column {
                width: 100%;
                display: block;
                margin-bottom: 20px;
            }
        }

        /* Style the counter cards */
        .card1 {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            padding: 16px;
            height: 200px;
            color: white;
        }

        .txt {
            text-align: center;
            margin-top: 40px;
        }
    </style>

</head>

<body>


<jsp:include page="search.jsp"/>
<jsp:include page="customerNav.jsp"/>

<div style="margin-top: 100px; padding: 10px;">
    <div class="row">
        <div class="leftcolumn">
            <div class="card">
                <div class="row1">
                    <div class="column">
                        <div class="card1" style="background-color: #74e393">
                            <h3 style="color: white">Accepted</h3>
                            <div class="txt">
                                <img class="image"
                                     src="resources/img/tick.png" width="40px"
                                     height="40px">
                                <h5 style="color: white;padding-top: 10px">${accCount}</h5>
                            </div>
                        </div>
                    </div>

                    <div class="column">
                        <div class="card1" style="background-color: #e37474">
                            <h3 style="color: white">Declined</h3>
                            <div class="txt">
                                <img class="image"
                                     src="resources/img/close.png" width="40px"
                                     height="40px">
                                <h5 style="color: white;padding-top: 10px">${rejCount}</h5>
                            </div>
                        </div>
                    </div>

                    <div class="column">
                        <div class="card1" style="background-color: #74a8e3">
                            <h3 style="color: white">Pending</h3>
                            <div class="txt"><img class="image"
                                                  src="resources/img/hourglass.png" width="40px"
                                                  height="40px">
                                <h5 style="color: white;padding-top: 10px">${penCount}</h5>
                            </div>
                        </div>
                    </div>

                    <div class="column">
                        <div class="card1" style="background-color: #e3cf74">
                            <h3 style="color: white">All</h3>
                            <div class="txt" style="padding-top: -5px">
                                <img class="image"
                                     src="resources/img/all.png" width="40px"
                                     height="40px">
                                <h5 style="color: white; padding-top: 10px">${allCount}</h5>
                            </div>
                        </div>
                    </div>
                </div>
                <c:if test="${not empty all}">
                    <c:forEach items="${all}" var="temp">
                        <div class="fakeimg" style="height:300px; margin-top: 30px; border-left: 3px solid #1b1b1b ">
                            <div style="padding: 20px">
                                <div class="row" style="margin-left: 620px">
                                    <h5 style="padding-left: 16px"> ${temp.date}</h5>
                                    <h5 style="width: 50%">&nbsp;&nbsp${temp.time}</h5>
                                </div>
                                <div class="row">
                                    <div style="margin-left: 20px; margin-top: -30px"><img
                                            src="resources/Image/${temp.property.user.image}" width="150px"
                                            height="150px" style="border-radius: 50%">
                                    </div>
                                    <div style="margin-left: 20px ; margin-top: -20px">
                                        <h3 style="text-transform:capitalize;">${temp.property.user.firstName} ${temp.property.user.lastName}</h3>
                                        <p>Email: ${temp.property.user.email}</p>
                                        <p>Address: ${temp.property.user.address}</p>
                                        <p>Property: ${temp.property.heading}</p>
                                        <p>Property Id: ${temp.property.id}</p>

                                    </div>

                                    <c:if test="${temp.status == 'Accept'}">

                                        <div style="margin-left: 200px; margin-top: 90px"><img
                                                src="resources/img/accept.png" width="50px"
                                                height="50px"></div>
                                        <div style="margin-left: 20px; padding-top: 100px">

                                            <h6>Accepted by the ${temp.property.user.uType}</h6>
                                        </div>

                                    </c:if>
                                    <c:if test="${temp.status == 'Reject'}">

                                        <div style="margin-left: 200px; margin-top: 90px"><img
                                                src="resources/img/decline.png" width="50px"
                                                height="50px"></div>
                                        <div style="margin-left: 20px; padding-top: 100px">

                                            <h6> Declined by the ${temp.property.user.uType}</h6>
                                        </div>

                                    </c:if>
                                    <c:if test="${temp.status == 'Pending'}">
                                        <div style="margin-left: 200px; margin-top: 100px">
                                            <a href="/deleteAppointment/${temp.id}">
                                                <button type="button" class="btn btn-outline-danger">Remove Appointment
                                                </button></a>
                                        </div>


                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${empty all}">
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

                            <div style="width: 200px; border-right: 5px solid #0c5460; height: 180px; text-align: center; padding-top: 50px;margin-left: 20px">
                                <h3>${tempAccept.date}</h3>
                                <h5 style="color: #2B2A2A">${tempAccept.time}</h5>

                            </div>

                            <div style="margin-left: 30px">
                                <a data-toggle="modal" data-target="#myModal${tempAccept.id}">
                                    <h3>${tempAccept.property.heading}</h3></a>
                                <br>
                                <p style="text-transform:capitalize;">Agent
                                    : ${tempAccept.property.user.firstName} ${tempAccept.property.user.lastName}</p>
                                <p>Email : ${tempAccept.property.user.email}</p>
                                <p>Prop Id : ${tempAccept.property.id}</p>
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
            <c:if test="${not empty cancel}">
                <c:forEach items="${cancel}" var="tempCancel">
            <div class="card">
                <h2>Cancelled Appointments</h2>


                        <div class="fakeimg1 row" style="height:200px; margin-top: 50px; margin-left: 20px">
                            <div class="row">
                            <div class="done">
                                <a href="/deleteAppointment/${tempCancel.id}">
                                    <img class="image"
                                         src="resources/img/cls.png"  width="40px"
                                         height="40px">
                                </a>
                            </div>
                            </div>
                            <div style="width: 200px; border-right: 5px solid #600603; height: 180px; text-align: center; padding-top: 50px;margin-left: 20px">
                                <h3>${tempCancel.date}</h3>
                                <h5 style="color: #2B2A2A">${tempCancel.time}</h5>

                            </div>

                            <div style="margin-left: 30px">
                                <a data-toggle="modal" data-target="#myModal${tempCancel.id}">
                                    <h3>${tempCancel.property.heading}</h3></a>
                                <br>
                                <p style="text-transform:capitalize;">Agent
                                    : ${tempCancel.property.user.firstName} ${tempCancel.property.user.lastName}</p>
                                <p>Email : ${tempCancel.property.user.email}</p>
                                <p>Prop Id : ${tempCancel.property.id}</p>
                            </div>

                        </div>



            </div>
            </c:forEach>
            </c:if>

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
