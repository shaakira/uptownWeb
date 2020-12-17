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
    <link href="../../resources/img/Capture.PNG" rel="icon">
    <link href="../../resources/img/apple-touch-icon.png" rel="apple-touch-icon">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

    <!-- Bootstrap CSS File -->
    <link href="../../resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Libraries CSS Files -->
    <link href="../../resources/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="../../resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="../../resources/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="../../resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Main Stylesheet File -->
    <link href="../../resources/style/style.css" rel="stylesheet">


</head>

<body>

<jsp:include page="search.jsp"/>


<nav class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top">

    <div class="container">


        <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarDefault"
                aria-controls="navbarDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span></span>
            <span></span>
            <span></span>
        </button>
        <a class="navbar-brand text-brand" href="/home">Up<span class="color-b">town</span></a>
        <button type="button" class="btn btn-link nav-search navbar-toggle-box-collapse d-md-none"
                data-toggle="collapse"
                data-target="#navbarTogglerDemo01" aria-expanded="false">
            <span class="fa fa-search" aria-hidden="true"></span>
        </button>

        <div class="navbar-collapse collapse justify-content-center" id="navbarDefault">

            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="/home">Home</a>
                </li>

                <li class="nav-item">

                    <a class="nav-link active" href="/properties">Property</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/agents">Agents</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/contact">Contact</a>
                </li>
                <sec:authorize access="!isAuthenticated()">
                    <li class="nav-item">
                        <a style="color: #2eca6a ; font-size: 0.8rem; " href="/signIn">Sign in</a> or <a
                            style="color: #2eca6a; font-size: 0.8rem;" href="/signUp">Sign up</a>
                        <a href="/addProperty">
                            <button type="button" class="btn btn-outline-dark" style="margin-left: 20px">Post Your Ad
                            </button>
                        </a>
                    </li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <div class="navbar-collapse collapse justify-content-lg-end" id="navbarDefault"
                         style="margin-right: 50px; padding-right: 20px;">

                        <ul class="navbar-nav" s>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <img src="../../resources/img/user.png" style="height: 30px; width: 30px">
                                        ${currentUser}
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                    <a class="dropdown-item" href="/customerPage">Account</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="/logout">Sign Out</a>
                                </div>
                            </li>


                        </ul>
                    </div>
                    <sec:authorize access="hasRole('ROLE_OWNER')||hasRole('ROLE_AGENT')">
                        <li class="nav-item">
                            <a href="/addProperty">
                                <button type="button" class="btn btn-outline-dark" style="margin-left: 20px">Post Your
                                    Ad
                                </button>
                            </a>
                        </li>
                    </sec:authorize>
                </sec:authorize>
            </ul>
        </div>
        <button type="button" class="btn btn-b-n navbar-toggle-box-collapse d-none d-md-block" data-toggle="collapse"
                data-target="#navbarTogglerDemo01" aria-expanded="false">
            <span class="fa fa-search" aria-hidden="true"></span>
        </button>
    </div>


</nav>
<c:if test="${not empty prop}">

    <!--/ Intro Single star /-->
    <section class="intro-single">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-8">
                    <div class="title-single-box">
                        <h1 class="title-single">${prop.heading}</h1>
                        <span class="color-text-a">${prop.street}, ${prop.city} ${prop.province}</span>
                    </div>
                </div>
                <div class="col-md-12 col-lg-4">
                    <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="/home">Home</a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="/properties">Properties</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">
                                    ${prop.heading}
                            </li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!--/ Intro Single End /-->

    <!--/ Property Single Star /-->
    <section class="property-single nav-arrow-b">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div id="property-single-carousel" class="owl-carousel owl-arrow gallery-property"
                         style="width: 1100px;height: 500px">
                        <div class="carousel-item-b" style="width: 1100px;height: 500px">
                            <img src="../../../resources/Image/${prop.image1}" alt=""
                                 style="width: 1100px;height: 500px">
                        </div>
                        <div class="carousel-item-b" style="width: 1100px;height: 500px">
                            <img src="../../../resources/Image/${prop.image2}" alt=""
                                 style="width: 1100px;height: 500px">
                        </div>
                        <div class="carousel-item-b" style="width: 1100px;height: 500px">
                            <img src="../../../resources/Image/${prop.image3}" alt=""
                                 style="width: 1100px;height: 500px">
                        </div>
                    </div>

                    <sec:authorize access="!isAuthenticated()">
                        <div style="padding: 30px; margin-left: 780px ">
                            <p style="color: red; font-size: 16px">Sign up as CUSTOMER*</p>
                            <a href="/signIn">
                                <button type="button" class="btn btn-a">Make an Appointment
                                </button>
                            </a>

                        </div>
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
                        <sec:authorize access="hasRole('ROLE_CUSTOMER')">
                            <c:if test="${not listed}">
                                <div style="padding: 30px; margin-left: 590px" class="row">

                                    <a href="/addWishList/${prop.id}">
                                        <button type="button" class="btn btn-a" style="margin-right: 30px">WISH LIST
                                        </button>
                                    </a>

                                    <button type="button" class="btn btn-a"
                                            onclick="document.getElementById('id01').style.display='block'">Make an
                                        Appointment
                                    </button>

                                </div>
                            </c:if>
                            <c:if test="${listed}">

                                <div style="padding: 30px; margin-left: 535px" class="row">
                                    <a href="/wishList">
                                        <button type="button" class="btn btn-a" style="margin-right: 30px">GO TO WISHLIST
                                        </button>
                                    </a>

                                    <button type="button" class="btn btn-a"
                                            onclick="document.getElementById('id01').style.display='block'">Make an
                                        Appointment
                                    </button>

                                </div>
                            </c:if>
                            <div id="id01" class="w3-modal" style=" z-index: 10000">
                                <div class="w3-modal-content" style="margin-bottom: 60px">
                                    <div class="w3-container">
                                        <div style="margin-top: 30px; margin-bottom: 30px">
                                <span onclick="document.getElementById('id01').style.display='none'"
                                      style="padding-left: 820px"> <img src="../../../resources/img/cancel.png"
                                                                        width="30px" height="30px"></span>

                                            <h3>Make an Appointment</h3>
                                        </div>
                                        <div style="margin-top: 30px; margin-bottom: 30px; padding-right: 30px;padding-left: 30px">
                                            <div class="property-contact">
                                                <form class="form-a" method="post" action="/makeAppointment/${prop.id}">
                                                    <div class="row">
                                                        <div class="col-md-6 mb-3">
                                                            <div class="form-group">
                                                                <input type="text" name="name"
                                                                       class="form-control form-control-lg form-control-a"
                                                                       value="${customer.userName}"
                                                                       required>

                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 mb-3">
                                                            <div class="form-group">
                                                                <input name="customerContact" type="text"
                                                                       placeholder="Phone *"
                                                                       class="form-control form-control-lg form-control-a"
                                                                       required>

                                                            </div>
                                                        </div>
                                                        <div class="col-md-12 mb-1">
                                                            <div class="form-group">
                                                                <input type="email"
                                                                       class="form-control form-control-lg form-control-a"
                                                                       name="email" value="${customer.email}"
                                                                       placeholder="Email *" required>

                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 mb-3">
                                                            <div class="form-group">
                                                                <input type="date" name="date"
                                                                       class="form-control form-control-lg form-control-a"
                                                                       required>

                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 mb-3">
                                                            <div class="form-group">
                                                                <input name="time" type="time"
                                                                       class="form-control form-control-lg form-control-a"
                                                                       required>

                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-1">
                                                            <div class="form-group">
                                                         <textarea class="form-control" cols="45" name="note" rows="8"
                                                                   required>Hi! I found your listing on Uptown, and I'd like to book a tour. Can you please confirm this time slot?
                                                         </textarea>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <button type="submit" class="btn btn-a">Send Message
                                                            </button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </sec:authorize>
                    </sec:authorize>
                    <div class="row justify-content-between">
                        <div class="col-md-5 col-lg-4">
                            <div class="property-price d-flex justify-content-center foo">
                                <div class="card-header-c d-flex">
                                    <div class="card-box-ico">
                                        <span class="ion-money">Rs.</span>
                                    </div>
                                    <div class="card-title-c align-self-center">
                                        <h5 class="title-c">${prop.rate}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="property-summary">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="title-box-d section-t4">
                                            <h3 class="title-d">Quick Summary</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="summary-list">
                                    <ul class="list">
                                        <li class="d-flex justify-content-between">
                                            <strong>Property ID:</strong>
                                            <span>${prop.id}</span>
                                        </li>
                                        <li class="d-flex justify-content-between">
                                            <strong>Location:</strong>
                                            <span>${prop.city}</span>
                                        </li>
                                        <li class="d-flex justify-content-between">
                                            <strong>Property Type:</strong>
                                            <span>${prop.pType}</span>
                                        </li>

                                        <li class="d-flex justify-content-between">
                                            <strong>Area:</strong>
                                            <span>${prop.area}m
                        <sup>2</sup>
                      </span>
                                        </li>
                                        <li class="d-flex justify-content-between">
                                            <strong>Beds:</strong>
                                            <span>${prop.rooms}</span>
                                        </li>
                                        <li class="d-flex justify-content-between">
                                            <strong>Baths:</strong>
                                            <span>${prop.baths}</span>
                                        </li>
                                        <li class="d-flex justify-content-between">
                                            <strong>Garage:</strong>
                                            <span>${prop.garage}</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-7 col-lg-7 section-md-t3">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="title-box-d">
                                        <h3 class="title-d">Property Description</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="property-description">
                                <p class="description color-text-a">
                                        ${prop.description}
                                </p>

                            </div>
                            <div class="row section-t3">
                                <div class="col-sm-12">
                                    <div class="title-box-d">
                                        <h3 class="title-d">Amenities</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="amenities-list color-text-a">
                                <ul class="list-a no-margin">
                                    <c:forEach var="tempf" items="${features}">
                                        <li>${tempf}</li>
                                    </c:forEach>


                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="row section-t3">
                        <div class="col-sm-12">
                            <div class="title-box-d">
                                <h3 class="title-d">Contact Agent</h3>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-lg-4">
                            <img src="../../../resources/Image/${agent.image}" alt="" class="img-fluid">
                        </div>
                        <div class="col-md-6 col-lg-4">
                            <div class="property-agent">
                                <h4 class="title-agent"
                                    style="text-transform:capitalize;">${agent.firstName} ${agent.lastName}</h4>
                                <p class="color-text-a">
                                    Hello, I'm ${agent.firstName} and I live and
                                    breathe property every day when
                                    acting for property lessor in your
                                    area.
                                </p>
                                <ul class="list-unstyled">

                                    <li class="d-flex justify-content-between">
                                        <strong>Email:</strong>
                                        <span class="color-text-a">${agent.email}</span>
                                    </li>
                                    <li class="d-flex justify-content-between">
                                        <strong>Address:</strong>
                                        <span class="color-text-a"
                                              style="text-transform:capitalize;">${agent.address}</span>
                                    </li>

                                </ul>
                                <div class="socials-a">
                                    <ul class="list-inline">
                                        <li class="list-inline-item">
                                            <a href="#">
                                                <i class="fa fa-facebook" aria-hidden="true"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#">
                                                <i class="fa fa-twitter" aria-hidden="true"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#">
                                                <i class="fa fa-instagram" aria-hidden="true"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#">
                                                <i class="fa fa-pinterest-p" aria-hidden="true"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="#">
                                                <i class="fa fa-dribbble" aria-hidden="true"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-4">
                            <div class="property-contact">
                                <form class="form-a" method="post" action="/addEnquiry/${prop.id}">
                                    <div class="row">
                                        <div class="col-md-12 mb-1">
                                            <div class="form-group">
                                                <input type="text" class="form-control form-control-lg form-control-a"
                                                       id="inputName" name="name"
                                                       placeholder="Name *" required>
                                            </div>
                                        </div>
                                        <div class="col-md-12 mb-1">
                                            <div class="form-group">
                                                <input type="text" class="form-control form-control-lg form-control-a"
                                                       id="inputPhone" name="phone"
                                                       placeholder="Phone *" required>
                                            </div>
                                        </div>
                                        <div class="col-md-12 mb-1">
                                            <div class="form-group">
                                                <input type="email" class="form-control form-control-lg form-control-a"
                                                       id="inputEmail1" name="email"
                                                       placeholder="Email *" required>
                                            </div>
                                        </div>
                                        <div class="col-md-12 mb-1">
                                            <div class="form-group">
                        <textarea id="textMessage" class="form-control" cols="45" name="comment"
                                  rows="8" required>Is this listing at  ${prop.heading}  still available? I'd love more information about pricing and availability. Thank you!</textarea>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <button type="submit" class="btn btn-a">Send Message</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</c:if>
<!--/ Property Single End /-->

<jsp:include page="footer.jsp"/>

<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
<div id="preloader">

</div>

<!-- JavaScript Libraries -->
<script src="../../resources/lib/jquery/jquery.min.js"></script>
<script src="../../resources/lib/jquery/jquery-migrate.min.js"></script>
<script src="../../resources/lib/popper/popper.min.js"></script>
<script src="../../resources/lib/bootstrap/js/bootstrap.min.js"></script>
<script src="../../resources/lib/easing/easing.min.js"></script>
<script src="../../resources/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="../../resources/lib/scrollreveal/scrollreveal.min.js"></script>
<!-- Contact Form JavaScript File -->
<script src="../../resources/contactForm/contactform.js"></script>

<!-- Template Main Javascript File -->
<script src="../../resources/js/main.js"></script>


</body>
</html>
