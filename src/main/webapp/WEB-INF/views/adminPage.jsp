<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
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
            .sidenav {
                padding-top: 15px;
            }

            .sidenav a {
                font-size: 18px;
            }
        }

        .card {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            padding: 16px;
            text-align: center;
            background-color: #f1f1f1;
            height: 210px;
        }

        .card2 {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.1);
            padding: 16px;
            background-color: #fafafa;
            height: 260px;
        }

        .date {
            text-align: center;
            margin-top: 30px;
        }
        .time{
            text-align: center;
            margin-top: 80px;
        }

        .text {
            color: white;
            text-align: center;
            font-size: 18px;
            padding-top: 10px;
        }

        .num {
            font-size: 50px;
            color: #1d2124;
            font-family: Helvetica Neue, Helvetica, Arial, sans-serif;

            font-weight: 100;
        }

        /* Float four columns side by side */
        .column {
            float: left;
            width: 25%;
            padding: 0 10px;
        }

        .row {
            margin: 0 -5px;
        }

        /* Clear floats after the columns */
        .row:after {
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

        .img {
            width: 60px;
            height: 60px;
            margin-right: auto;
            margin-left: auto;
            margin-top: 10px;
        }

        .txt {
            padding-top: 20px;
        }
    </style>

</head>

<body>


<jsp:include page="adminDashboard.jsp"/>
<div id="mySidenav" class="sidenav">
    <a href="/adminPage" style="color: white">Dashboard</a>
    <a href="/adminAbout">Profile</a>
    <a href="/propertyList">Properties</a>
    <a href="/clients">Clients</a>
    <a href="/contacts">Contact</a>
</div>

<div style="margin-left: 280px;margin-top: 160px;">

    <div class="row">
        <div class="column">
            <div class="card">
                <img src="resources/img/house.png" class="img">
                <h4 class="txt">${propCount}</h4>
                <div style="height: 50px; background-color: #bd8802; bottom: 10px;">
                    <p class="text">Properties</p>
                </div>
            </div>

        </div>

        <div class="column">
            <div class="card">
                <img src="resources/img/support.png" class="img">
                <h4 class="txt">${agentsCount}</h4>

                <div style="height: 50px; background-color: #9e4444; bottom: 10px;">
                    <p class="text">Agents</p>
                </div>

            </div>
        </div>

        <div class="column">
            <div class="card">
                <img src="resources/img/promotion.png" class="img">
                <h4 class="txt">${advertiserCount}</h4>

                <div style="height: 50px; background-color: #44649e; bottom: 10px;">
                    <p class="text">Advertisers</p>
                </div>

            </div>
        </div>

        <div class="column">
            <div class="card">
                <img src="resources/img/group.png" class="img">
                <h4 class="txt">${userCount}</h4>

                <div style="height: 50px; background-color: #449e7a; bottom: 10px;">
                    <p class="text">User</p>
                </div>

            </div>
        </div>
    </div>

    <div class="row">

        <img src="resources/img/world.jpg" height="250px" width="500px" >

        <div class="column" style="margin-left: 40px">
            <div class="card2">
                <p style="font-size: 18px">Date :</p>
                <div class="date">
                    <%
                        Date dNow = new Date();
                        SimpleDateFormat ft = new SimpleDateFormat("MMM");
                    %>
                    <h3><%=ft.format(dNow)%>
                    </h3>
                    <%
                        SimpleDateFormat ft2 =
                                new SimpleDateFormat("dd");
                    %>
                    <h1><%=ft2.format(dNow)%>
                    </h1>
                    <%
                        SimpleDateFormat ft3 = new SimpleDateFormat("yyyy");
                    %>
                    <h3><%=ft3.format(dNow)%>
                    </h3>
                </div>
            </div>
        </div>

        <div class="column">
            <div class="card2">

                <p style="font-size: 18px">Time :</p>
                <div class="time">
                    <%
                        SimpleDateFormat time = new SimpleDateFormat("EEE, hh:mm:ss a");
                    %>
                    <h4><%=time.format(dNow)%>
                    </h4>

                </div>

            </div>
        </div>

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
