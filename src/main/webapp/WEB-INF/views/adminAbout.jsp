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

        .sidenav .closebtn {
            position: absolute;
            top: 0;
            right: 25px;
            font-size: 36px;
            margin-left: 50px;
        }

        @media screen and (max-height: 450px) {
            .sidenav {
                padding-top: 15px;
            }

            .sidenav a {
                font-size: 18px;
            }
        }
        div.image{
            background-color: white;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            margin-bottom: 25px;
            border-radius: 4px;
        }

        div.txt {
            text-align: center;
            padding: 10px 20px;
            color: #1c7430;
        }
    </style>
</head>

<body>


<jsp:include page="adminDashboard.jsp"/>
<div id="mySidenav" class="sidenav">
    <a href="/adminPage">Dashboard</a>
    <a href="/adminAbout" style="color: white">Profile</a>
    <a href="/propertyList">Properties</a>
    <a href="/clients">Clients</a>
    <a href="/contacts">Contact</a>
</div>
<section class="contact">
    <div class="container" style="margin-left: 300px;margin-top: 40px;height: 100%;">


            <div style="margin-left: 50px; margin-top: 150px; width: 100%"  >

                    <div >
                        <p style="font-size: 30px ;padding-top: 20px;color: black ; font-weight: 700">My Profile</p>
                        <div class="d-flex justify-content-center" >
                            <div class="image" style="display:inline-block;">
                                <img src="resources/Image/${user.image}" style="width: 300px; height: 350px; border-radius: 4px;" >
                                <div class="txt">
                                    <p>Administrator</p>
                                </div>
                            </div>

                            <div  style="margin-left: 70px; width: 700px">
                                <div class="col-md-12 mb-3">
                                    <div class="form-group">
                                        <label>First Name</label>
                                        <input type="text" name="firstName" value="${user.firstName}"
                                               class="form-control form-control-lg form-control-a"
                                               placeholder="First Name" readonly>

                                    </div>
                                </div>
                                <div class="col-md-12 mb-3">
                                    <div class="form-group">
                                        <label>Last Name</label>

                                        <input name="lastName" type="text" value="${user.lastName}"
                                               class="form-control form-control-lg form-control-a"
                                               placeholder="Last Name" readonly>

                                    </div>
                                </div>
                                <div class="col-md-12 mb-3">
                                    <div class="form-group">
                                        <label>Email</label>

                                        <input type="email" name="email" value="${user.email}"
                                               class="form-control form-control-lg form-control-a" placeholder="Email"
                                               readonly>

                                    </div>
                                </div>
                                <div class="col-md-12 mb-3">
                                    <div class="form-group">
                                        <label>Address</label>

                                        <input type="text" name="address" value="${user.address}"
                                               class="form-control form-control-lg form-control-a" placeholder="Address"
                                               data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject"
                                               readonly>

                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>

            </div>
        </div>



</section>

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
<%--<script>--%>
<%--function openNav() {--%>
<%--document.getElementById("mySidenav").style.width = "250px";--%>
<%--}--%>

<%--function closeNav() {--%>
<%--document.getElementById("mySidenav").style.width = "0";--%>
<%--}--%>
<%--</script>--%>

</body>
</html>
