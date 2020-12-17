<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}resources/style/signUp.css">
</head>
<body>
<div>
<div class="nav">
    <a class="uptown" href="/home">Up<span class="bg-green">town</span></a>
    <div style="display: flex">
        <ul>

            <li><a href="/home">Home
               </a></li>
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
<div class="main" >

    <section class="signup">

        <div class="container">
            <div class="signup-content">
                <form method="POST" action="${contextPath}api/auth/signUp" class="form-signin" enctype="multipart/form-data">

                    <h2 class="form-title" >Create account</h2>

                    <div class="form-group">
                        <input type="text" class="form-input" name="firstName" id="fName" placeholder="First Name" />
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-input" name="lastName" id="lName" placeholder="Last Name" />
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-input" name="userName" id="uName" placeholder="Username" />
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-input" name="email" id="email" placeholder="Email"/>
                    </div>
                    <div class="form-group">
                    <input type="text" class="form-input" name="address" id="address" placeholder="Address"/>
                </div>
                    <div class="form-group">
                        <div class="inline-image">

                            <label class="text-label">Upload Profile Picture</label>
                            <div class="file-container">
                            <label class="custom-file-upload">
                                <input type="file" name="file"/>
                                 Choose File
                            </label>
                            </div>
                        </div>
                        </div>
                    <div class="form-group">
                    <group class="inline-radio">
                        <div><label class="text-label">I am</label></div>
                    <div class="radio-toolbar"> <input type="radio" name="uType"  value="agent" checked ><label class="text-label">Agent</label></div>
                    <div><input type="radio" name="uType" value="owner" ><label class="text-label">Owner</label>
                    </div>
                        <div><input type="radio" name="uType" value="customer"><label class="text-label">Customer</label>
                        </div>
                    </group>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-input" name="password" id="password" placeholder="Password" />
                        <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-input" name="re_password" id="re_password" placeholder="Repeat your password"/>
                    </div>

                    <div class="form-group">
                        <input type="submit" name="submit" id="submit" class="form-submit" value="Sign up"/>
                    </div>
                </form>
                <p class="loginhere">
                    Have already an account ? <a href="/signIn" class="loginhere-link">Login here</a>
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