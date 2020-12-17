<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Uptown</title>
    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}resources/img/Capture.PNG" rel="icon">
    <!-- Font Icon -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}resources/regForm/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}resources/style/signIn.css">
</head>
<body>
<div>
    <div class="nav">
        <a class="uptown" href="/home">Up<span class="bg-green">town</span></a>
        <div style="display: flex">
            <ul>
                <li><a href="/home">Home</a></li>
                <li><a href="/properties">Property</a></li>
                <li><a href="/agents">Agents</a></li>
                <li><a href="/contact">Contact</a></li>
            </ul>
            <div class="btn-cls">
                <a  class="link-text" href="/signIn">Sign in</a><label style="margin-top:45px;padding-left: 5px;padding-right: 5px ">or</label><a class="link-text" href="/signUp">Sign up</a>
                <a href="/addProperty"><button class="btn-border" type="submit">Post Your Ad</button></a>
            </div>
        </div>
    </div>
<div class="main">

    <section class="signup">
        <!-- <img src="images/signup-bg.jpg" alt=""> -->
        <div class="container">
            <div class="signup-content">
                <form action="doLogin" method="post" class="form-signin">

                        <h2 class="form-title" >SIGN IN</h2>
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger">
                            <spring:message code="AbstractUserDetailsAuthenticationProvider.badCredentials"/>
                            <br/>
                        </div>
                    </c:if>
                    <div class="form-group">
                        <input type="text" class="form-input" name="username" id="name" placeholder="Username"/>
                    </div>

                    <div class="form-group">
                        <input type="text" class="form-input" name="password" id="password" placeholder="Password"/>
                        <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                    </div>


                    <div class="form-group">
                        <input type="submit" name="submit" id="submit" class="form-submit" value="Login"/>
                    </div>
                </form>
                <p class="loginhere">
                    Don't have an account ? <a href="/signUp" class="loginhere-link">Sign Up Now</a>
                </p>
            </div>
        </div>
    </section>
</div>
</div>

<button onclick="topFunction()" id="myBtn"><img src="resources/img/arrow.png" class="arrow-btn"></button>

<!-- JS -->
<script src="${pageContext.request.contextPath}resources/regForm/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}resources/regForm/js/main.js"></script>
<script>
    //Get the button
    var mybutton = document.getElementById("myBtn");

    // When the user scrolls down 20px from the top of the document, show the button
    window.onscroll = function() {scrollFunction()};

    function scrollFunction() {
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
            mybutton.style.display = "block";
        } else {
            mybutton.style.display = "none";
        }
    }

    // When the user clicks on the button, scroll to the top of the document
    function topFunction() {
        document.body.scrollTop = 0;
        document.documentElement.scrollTop = 0;
    }
</script>
</body>
</html>