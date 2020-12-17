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
        <button type="button" class="btn btn-link nav-search navbar-toggle-box-collapse d-md-none" data-toggle="collapse"
                data-target="#navbarTogglerDemo01" aria-expanded="false">
            <span class="fa fa-search" aria-hidden="true"></span>
        </button>

        <div class="navbar-collapse collapse justify-content-center" id="navbarDefault">

            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="/home">Home</a>
                </li>

                <li class="nav-item">

                    <a class="nav-link" href="/properties">Property</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/agents">Agents</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/contact">Contact</a>
                </li>
                <sec:authorize access="!isAuthenticated()">
                    <li class="nav-item">
                        <a  style="color: #2eca6a ; font-size: 0.8rem; " href="/signIn">Sign in</a> or <a style="color: #2eca6a; font-size: 0.8rem;" href="/signUp">Sign up</a>
                        <a href="/addProperty"><button  type="button" class="btn btn-outline-dark" style="margin-left: 20px" >Post Your Ad</button></a>
                    </li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <div class="navbar-collapse collapse justify-content-lg-end" id="navbarDefault" style="margin-right: 50px; padding-right: 20px;">

                        <ul class="navbar-nav" s>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <img src="../../resources/img/user.png" style="height: 30px; width: 30px" >
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
                            <a href="/addProperty"><button  type="button" class="btn btn-outline-dark" style="margin-left: 20px" >Post Your Ad</button></a>
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

<!--/ Nav End /-->

<!--/ Intro Single star /-->
<section class="intro-single">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-lg-8">
                <div class="title-single-box">
                    <h1 class="title-single" style="text-transform:capitalize;">${agent.firstName} ${agent.lastName}</h1>
                    <span class="color-text-a">Agent</span>
                </div>
            </div>
            <div class="col-md-12 col-lg-4">
                <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="/home">Home</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a href="/agents">Agents</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page" style="text-transform:capitalize;">
                           ${agent.firstName} ${agent.lastName}
                        </li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</section>
<!--/ Intro Single End /-->

<!--/ Agent Single Star /-->
<section class="agent-single">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="row">
                    <div class="col-md-6">
                        <div class="agent-avatar-box">
                            <img src="../../../resources/Image/${agent.image}" alt="" class="agent-avatar img-fluid">
                        </div>
                    </div>
                    <div class="col-md-5 section-md-t3">
                        <div class="agent-info-box">
                            <div class="agent-title">
                                <div class="title-box-d">
                                    <h3 class="title-d" style="text-transform:capitalize;">${agent.firstName} ${agent.lastName}
                                       </h3>
                                </div>
                            </div>
                            <div class="agent-content mb-3">
                                <p class="content-d color-text-a">
                                    Hello, I'm ${agent.firstName} and I live and
                                    breathe property every day when
                                    acting for property lessor in your
                                    area.
                                </p>
                                <div class="info-agents color-a">

                                    <p>
                                        <strong>Email: </strong>
                                        <span class="color-text-a"> ${agent.email}</span>
                                    </p>

                                    <p>
                                        <strong>Address: </strong>
                                        <span class="color-text-a"> ${agent.address}</span>
                                    </p>
                                </div>
                            </div>
                            <div class="socials-footer">
                                <ul class="list-inline">
                                    <li class="list-inline-item">
                                        <a href="#" class="link-one">
                                            <i class="fa fa-facebook" aria-hidden="true"></i>
                                        </a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a href="#" class="link-one">
                                            <i class="fa fa-twitter" aria-hidden="true"></i>
                                        </a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a href="#" class="link-one">
                                            <i class="fa fa-instagram" aria-hidden="true"></i>
                                        </a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a href="#" class="link-one">
                                            <i class="fa fa-pinterest-p" aria-hidden="true"></i>
                                        </a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a href="#" class="link-one">
                                            <i class="fa fa-dribbble" aria-hidden="true"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<c:if test="${not empty prop and not empty propCount}">
<div class="col-md-12 section-t8">
                <div class="title-box-d">
                    <h3 class="title-d">My Properties (${propCount})</h3>
                </div>
            </div>
            <div class="row property-grid grid">
                <div class="col-sm-12">
                </div>
                <c:forEach var="tempProp" items="${prop}">
                <div class="col-md-4" >
                    <div class="card-box-a card-shadow">
                        <div class="img-box-a">
                            <img src="../../../resources/Image/${tempProp.image1}" alt="" class="img-a img-fluid" style="width: 600px;height: 460px">
                        </div>
                        <div class="card-overlay">
                            <div class="card-overlay-a-content">
                                <div class="card-header-a">
                                    <h2 class="card-title-a">
                                        <a href="/singleProperty/${tempProp.id}">${tempProp.city}
                                            <br />${tempProp.heading}</a>
                                    </h2>
                                </div>
                                <div class="card-body-a">
                                    <div class="price-box d-flex">
                                        <span class="price-a">rent | Rs. ${tempProp.rate}</span>
                                    </div>
                                    <a href="/singleProperty/${tempProp.id}" class="link-a">Click here to view
                                        <span class="ion-ios-arrow-forward"></span>
                                    </a>
                                </div>
                                <div class="card-footer-a">
                                    <ul class="card-info d-flex justify-content-around">
                                        <li>
                                            <h4 class="card-info-title">Area</h4>
                                            <span>${tempProp.area}m
                          <sup>2</sup>
                        </span>
                                        </li>
                                        <li>
                                            <h4 class="card-info-title">Beds</h4>
                                            <span>${tempProp.rooms}</span>
                                        </li>
                                        <li>
                                            <h4 class="card-info-title">Baths</h4>
                                            <span>${tempProp.baths}</span>
                                        </li>
                                        <li>
                                            <h4 class="card-info-title">Garages</h4>
                                            <span>${tempProp.garage}</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>

            </div>
</c:if>
        </div>
    </div>
</section>
<!--/ Agent Single End /-->

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
