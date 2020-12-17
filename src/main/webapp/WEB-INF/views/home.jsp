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
    <link href="${pageContext.request.contextPath}resources/lib/owlcarousel/assets/owl.carousel.min.css"
          rel="stylesheet">

    <!-- Main Stylesheet File -->
    <link href="${pageContext.request.contextPath}resources/style/style.css" rel="stylesheet">


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

            <%--<div>--%>
            <%--${userId}--%>
            <%--${currentUser}--%>
            <%--${hello}--%>
            <%--${pass}--%>
            <%--</div>--%>

            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" href="/home">Home</a>
                </li>
                <%--<h2>Hello, ${Request.token}</h2>--%>

                <li class="nav-item">

                    <a class="nav-link" href="/properties">Property</a>
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
                                    <img src="resources/img/user.png" style="height: 30px; width: 30px">
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
<!--/ Nav End /-->

<!--/ Carousel Star /-->
<div class="intro intro-carousel">
    <div id="carousel" class="owl-carousel owl-theme">
        <div class="carousel-item-a intro-item bg-image">

            <div class="overlay overlay-a"><img src="resources/img/slide-1.jpg"></div>
            <div class="intro-content display-table">
                <div class="table-cell">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="intro-body">
                                    <p class="intro-title-top">Kadawatha Rd, Dehiwala
                                        <br> Colombo 06</p>
                                    <h1 class="intro-title mb-4">
                                        <span class="color-b">224 </span> Furnished
                                        <br> Luxury Villa</h1>
                                    <p class="intro-subtitle intro-price">
                                        <a href="/properties"><span class="price-a">rent | Rs. 300,000</span></a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="carousel-item-a intro-item bg-image">
            <div class="overlay overlay-a"><img src="resources/img/slide-2.jpg"></div>
            <div class="intro-content display-table">
                <div class="table-cell">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="intro-body">
                                    <p class="intro-title-top">Colombo 04
                                        <br> </p>
                                    <h1 class="intro-title mb-4">
                                        <span class="color-b">204 </span> Glamorous
                                        <br> Luxury Bungalow</h1>
                                    <p class="intro-subtitle intro-price">
                                        <a href="/properties"><span class="price-a">rent | Rs. 535,000</span></a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="carousel-item-a intro-item bg-image">
            <div class="overlay overlay-a"><img src="resources/img/slide-2.jpg"></div>
            <div class="intro-content display-table">
                <div class="table-cell">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="intro-body">
                                    <p class="intro-title-top">Baseline Road, Colombo 8
                                        <br>153</p>
                                    <h1 class="intro-title mb-4">
                                        <span class="color-b">3BD </span> Trillium
                                        <br> Apartment</h1>
                                    <p class="intro-subtitle intro-price">
                                        <a href="/properties"><span class="price-a">rent | Rs 230,000</span></a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--/ Carousel end /-->

<!--/ Services Star /-->
<section class="section-services section-t8">
    <div class="container">



        <div id="tenants" class="row">

            <div class="col-md-4">
                <div class="card-box-c foo">
                    <div class="card-header-c d-flex">
                        <div class="card-box-ico">
                            <img src="resources/img/house.png">
                        </div>
                        <div class="card-title-c align-self-center">
                            <h2 class="title-c">Landlords</h2>
                        </div>
                    </div>
                    <div class="card-body-c">
                        <p class="content-c">
                           Say goodbye to the stress of managing
                            your property and maximise your
                            investment with our professional property
                            management.
                        </p>
                    </div>

                </div>
            </div>
            <div class="col-md-4">
                <div class="card-box-c foo">
                    <div class="card-header-c d-flex">
                        <div class="card-box-ico">
                            <img src="resources/img/map.png">
                        </div>
                        <div class="card-title-c align-self-center">
                            <h2 class="title-c">Find a Rental</h2>
                        </div>
                    </div>
                    <div class="card-body-c">
                        <p class="content-c">
                            Search through the current listings of our
                            properties throughout the Uptown and find
                            one of you-both short and long-term
                            lease available.
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card-box-c foo">
                    <div class="card-header-c d-flex">
                        <div class="card-box-ico">
                            <img src="resources/img/tenant.png">

                        </div>
                        <div class="card-title-c align-self-center">
                            <h2 class="title-c">Tenant</h2>
                        </div>
                    </div>
                    <div class="card-body-c">
                        <p class="content-c">
                            We value our tenants and provide
                            best quality services.
                        </p>
                    </div>
                   
                </div>
            </div>

        </div>


    </div>
</section>
<!--/ Services End /-->

<!--/ Property Star /-->
<section class="section-property section-t8">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="title-wrap d-flex justify-content-between">
                    <div class="title-box">
                        <h2 class="title-a">Latest Properties</h2>
                    </div>
                    <div class="title-link">
                        <a href="/properties">All Property
                            <span class="ion-ios-arrow-forward"></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
<c:if test="${not empty prop}">

<div id="property-carousel" class="owl-carousel owl-theme">
    <c:forEach var="tempProp" items="${prop}">

    <div class="carousel-item-b" style="width: 350px;height: 460px">
                <div class="card-box-a card-shadow">
                    <div class="img-box-a">
                        <img src="resources/Image/${tempProp.image1}" alt="" class="img-a img-fluid" style="width: 350px;height: 460px">
                    </div>
                    <div class="card-overlay">
                        <div class="card-overlay-a-content">
                            <div class="card-header-a">
                                <h2 class="card-title-a">
                                    <a href="/singleProperty/${tempProp.id}">${tempProp.city}
                                        <br/>${tempProp.heading}</a>
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
</section>

<!--/ Property End /-->

<!--/ Agents Star /-->
<section class="section-agents section-t8">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="title-wrap d-flex justify-content-between">
                    <div class="title-box">
                        <h2 class="title-a">Best Agents</h2>
                    </div>
                    <div class="title-link">
                        <a href="/agents">All Agents
                            <span class="ion-ios-arrow-forward"></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <c:if test="${not empty agent}">
            <div class="row">
                <c:forEach var="tempAgent" items="${agent}">

                    <div class="col-md-4" >
                        <div class="card-box-d" style="width: 350px;height: 460px">
                            <div class="card-img-d">
                                <img src="resources/Image/${tempAgent.image}" alt="" class="img-d img-fluid" style="width: 350px;height: 460px">
                            </div>
                            <div class="card-overlay card-overlay-hover">
                                <div class="card-header-d">
                                    <div class="card-title-d align-self-center">
                                        <h3 class="title-d">
                                            <a href="/agentSingle/${tempAgent.id}"
                                               class="link-two" style="text-transform:capitalize;">${tempAgent.firstName} ${tempAgent.lastName}
                                                </a>
                                        </h3>
                                    </div>
                                </div>
                                <div class="card-body-d">

                                    <p class="content-d color-text-a">
                                        Hello, I'm ${tempAgent.firstName} and I live and
                                        breathe property every day when
                                        acting for property lessor in your
                                        area.

                                    </p>
                                    <br>  <br>  <br>
                                    <div class="info-agents color-a">
                                        <p>
                                            <strong>Email: </strong> ${tempAgent.email}</p>
                                        <p style="text-transform:capitalize;">
                                            <strong>Address: </strong> ${tempAgent.address}</p>
                                    </div>
                                </div>
                                <div class="card-footer-d">
                                    <div class="socials-footer d-flex justify-content-center">
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
                </c:forEach>
            </div>
        </c:if>
    </div>
</section>
<!--/ Agents End /-->


<jsp:include page="footer.jsp"/>

<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
<div id="preloader">

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
