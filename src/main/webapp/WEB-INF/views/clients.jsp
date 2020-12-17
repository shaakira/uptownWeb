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
        .contacts{
            color: black;
        }

        * {box-sizing: border-box}

        /* Set height of body and the document to 100% */
        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial;
        }



    </style>
</head>

<body>


<jsp:include page="adminDashboard.jsp"/>
<div id="mySidenav" class="sidenav">
    <a href="/adminPage">Dashboard</a>
    <a href="/adminAbout">Profile</a>
    <a href="/propertyList">Properties</a>
    <a href="/clients" style="color: white">Clients</a>
    <a href="/contacts">Contact</a>
</div>
<div style="margin-left: 250px; margin-top: 150px">
        <nav>
            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true" style="font-size: 20px">Active Users</a>
                <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false" style="font-size: 20px">Blacklisted Users</a>

            </div>
        </nav>

</div>
<div  style="margin-left: 250px; margin-top: 110px; height: 100%">


    <div class="tab-content" id="nav-tabContent">
        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
    <div  style="margin-left: 50px; margin-right: 50px">
            <c:if test="${not empty users}" >
            <table class="table" style="margin-top: 30px">
            <thead class="thead-light">
            <tr>
            <th scope="col">#</th>
            <th scope="col">First Name</th>
            <th scope="col">Last Name</th>
            <th scope="col">Username</th>
            <th scope="col">Email</th>
            <th scope="col">Address</th>
            <th scope="col">User Type</th>
            <th scope="col">Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="tempUser" items="${users}">
            <tr>
            <th scope="row">${tempUser.id}</th>
            <td>${tempUser.firstName}</td>
            <td>${tempUser.lastName}</td>
            <td>${tempUser.userName}</td>
            <td>${tempUser.email}</td>
            <td>${tempUser.address}</td>
            <td>${tempUser.uType}</td>
            <td>
            <a href="/blacklistUser/${tempUser.id}"> <button type="button" class="btn btn-outline-danger">Blacklist</button></a></td>
            </tr>
            </c:forEach>
            </tbody>
            </table>
            </c:if>
        </div>
        </div>
        <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
            <div  style="margin-left: 50px; margin-right: 50px">
            <c:if test="${not empty blacklisted}"  >
                <table class="table" style="margin-top: 30px">
                    <thead class="thead-light">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">First Name</th>
                        <th scope="col">Last Name</th>
                        <th scope="col">Username</th>
                        <th scope="col">Email</th>
                        <th scope="col">Address</th>
                        <th scope="col">User Type</th>
                        <th scope="col">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="tempUser" items="${blacklisted}">
                        <tr>
                            <th scope="row">${tempUser.id}</th>
                            <td>${tempUser.firstName}</td>
                            <td>${tempUser.lastName}</td>
                            <td>${tempUser.userName}</td>
                            <td>${tempUser.email}</td>
                            <td>${tempUser.address}</td>
                            <td>${tempUser.uType}</td>
                            <td>
                                <a href="/activateUser/${tempUser.id}"> <button type="button" class="btn btn-outline-success">Activate</button></a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${empty blacklisted}"  >
                <div style="background-color: #f5f5f5; height: 400px; text-align: center">
                     <img src="resources/img/blocked.png" style=" margin-top: 100px" width="120px" height="120px">

                    <h4 style="margin-top: 12px">No blacklisted users</h4>
                </div>
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
