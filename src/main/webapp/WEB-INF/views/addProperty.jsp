<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <!-- Title Page-->
    <title>Uptown</title>
    <link href="${pageContext.request.contextPath}resources/img/Capture.PNG" rel="icon">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
          rel="stylesheet">

    <!-- Main CSS-->
    <link href="${pageContext.request.contextPath}resources/style/addProperty.css" rel="stylesheet" media="all">
    <style>

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
        }

        .dropdown-content a:hover {
            background-color: #f1f1f1;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown {
        }
    </style>

</head>

<body>

<div class="page-wrapper bg-white p-t-100 p-b-50">
    <div class="nav">
        <a class="uptown" href="/home">Up<span class="bg-green">town</span></a>
        <div style="display: flex">
            <ul>
                <li><a href="/home">Home</a></li>
                <li><a href="/properties">Property</a></li>
                <li><a href="/agents">Agents</a></li>
                <li><a href="/contact">Contact</a></li>
            </ul>
            <sec:authorize access="!isAuthenticated()">

                <div class="btn-cls">
                    <a class="link-text" href="/signIn">Sign in</a><label
                        style="margin-top:45px;padding-left: 5px;padding-right: 5px ">or</label><a class="link-text"
                                                                                                   href="/signUp">Sign
                    up</a>
                    <a href="/addProperty">
                        <button class="btn-border" type="submit">Post Your Ad</button>
                    </a>
                </div>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <%--<div class="btn-cls name dropdown">--%>
                <%--<img src="resources/img/user.png" style="height: 30px; width: 30px; margin-top: 10px" >--%>
                <%--<a href="javascript:void(0)" style="top: -10px"> ${currentUser}</a>--%>
                <%--<div class="dropdown-content">--%>
                <%--<a href="/customerPage">Account</a>--%>
                <%--<a href="/logout">Sign Out</a>--%>

                <%--</div>--%>
                <%--</div>--%>
            </sec:authorize>
            <%--<sec:authorize access="isAuthenticated()">--%>
            <%--<div class="navbar-collapse collapse justify-content-lg-end" id="navbarDefault" style="margin-right: 50px; padding-right: 20px;">--%>

            <%--<ul class="navbar-nav">--%>

            <%--<li class="nav-item dropdown">--%>
            <%--<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
            <%--<img src="resources/img/user.png" style="height: 30px; width: 30px" >--%>
            <%--${currentUser}--%>
            <%--</a>--%>
            <%--<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">--%>
            <%--<a class="dropdown-item" href="/customerPage">Account</a>--%>
            <%--<div class="dropdown-divider"></div>--%>
            <%--<a class="dropdown-item" href="/logout">Sign Out</a>--%>
            <%--</div>--%>
            <%--</li>--%>


            <%--</ul>--%>
            <%--</div>--%>

            <%--</sec:authorize>--%>
        </div>

    </div>
    <div class="wrapper wrapper--w900">
        <div class="card card-6">
            <div class="card-heading">
                <h2 class="title">Add Property</h2>

            </div>
            <div class="card-body">

                <form method="POST" action="${contextPath}addPropertyPost" enctype="multipart/form-data">
                    <div class="form-row">
                        <div class="name">Heading</div>

                        <div class="value">
                            <div class="input-group">
                                <input class="input--style-6" type="text" name="heading">
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">Street</div>
                        <div class="value">
                            <input class="input--style-6" type="text" name="street">
                        </div>
                        <div class="name">City</div>
                        <div class="value">
                            <input class="input--style-6" type="text" name="city">
                        </div>
                        <div class="name">Province</div>
                        <div class="value">
                            <input class="input--style-6" type="text" name="province">
                        </div>
                        <div class="name">Type</div>
                        <div style="display: flex">

                            <div class="custom-select" style="width:200px;">

                                <select name="pType">
                                    <option value="House">House</option>
                                    <option value="Apartment">Apartment</option>
                                    <option value="Villa">Villa</option>
                                    <option value="Bungalow">Bungalow</option>
                                </select>
                            </div>
                            <div class="arrow-background">
                                <img src="/resources/img/down-arrow.png" class="arrow">
                            </div>
                        </div>

                    </div>
                    <div class="form-row">
                        <div class="name">Property Description</div>
                        <div class="value">
                            <div class="input-group">
                                <textarea class="textarea--style-6" name="description"></textarea>
                            </div>
                        </div>
                        <div class="name">Price/Rate</div>
                        <div style="display: flex">
                            <div class="value">
                                <input class="input-price" type="text" name="rate">
                            </div>
                            <div style="display: flex">

                                <div class="custom-select" style="width:200px; margin-left: 10px">

                                    <select name="rateType">
                                        <option value="perDay">Per Day</option>
                                        <option value="perWeek">Per Week</option>
                                        <option value="perMonth">Per Month</option>
                                        <option value="perYear"> Per Year</option>
                                    </select>
                                </div>
                                <div class="arrow-background">
                                    <img src="/resources/img/down-arrow.png" class="arrow">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">Floor Area</div>
                        <div class="value">
                            <input class="input-price" type="text" name="area"> square feet
                        </div>
                        <div class="name">Rooms</div>
                        <div class="value">
                            <input class="input-price" type="text" name="rooms">
                        </div>

                        <div class="name">Baths</div>
                        <div class="value">
                            <input class="input-price" type="text" name="baths">
                        </div>
                        <div class="name">Garage</div>
                        <div class="value">
                            <input class="input-price" type="text" name="garage">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">Property Features</div>
                        <div class="value">

                            <input type="checkbox" id="fullyFurnished" name="features" value="Fully Furnished">
                            <label for="fullyFurnished"> Fully Furnished</label>
                            <input type="checkbox" id="pool" name="features" value="Pool">
                            <label for="pool"> Swimming Pool</label>
                            <input type="checkbox" id="acRooms" name="features" value="AC Rooms">
                            <label for="acRooms"> AC rooms</label>
                            <input type="checkbox" id="internet" name="features" value="Internet">
                            <label for="internet"> Internet</label>
                            <input type="checkbox" id="hotWater" name="features" value="Hot water">
                            <label for="hotWater"> Hot Water</label>
                            <input type="checkbox" id="gym" name="features" value="Gym">
                            <label for="gym"> Gym</label>

                            <input type="checkbox" id="sRooms" name="features" value="Servant Rooms">
                            <label for="sRooms"> Servant's Room</label>
                            <input type="checkbox" id="security" name="features" value="24 hrs Security">
                            <label for="security"> 24 hour security</label>
                            <input type="checkbox" id="electricity" name="features" value="3 Phase electricity">
                            <label for="electricity"> 3 Phase electricity</label>

                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">Upload Images</div>
                        <div class="value">
                            <div class="input-group js-input-file">
                                <input class="input-file" type="file" name="files" id="file" multiple>
                                <label class="label--file" for="file" multiple>Choose file</label>
                                <span class="input-file__info">No file chosen</span>
                            </div>
                            <div class="label--desc">Upload your property images.3 images *</div>
                        </div>
                    </div>

                    <div class="card-footer">
                        <button class="btn btn--radius-2 btn--green" type="submit">Add Property</button>
                    </div>

                </form>
            </div>

        </div>
        <button onclick="topFunction()" id="myBtn"><img src="resources/img/arrow.png" class="arrow-btn"></button>
        <%--<span class="dot"></span>--%>
    </div>
</div>

<!-- Jquery JS-->
<script src="${pageContext.request.contextPath}resources/propForm/vendor/jquery/jquery.min.js"></script>


<!-- Main JS-->
<script src="${pageContext.request.contextPath}resources/propForm/js/global.js"></script>
<script>
    var x, i, j, l, ll, selElmnt, a, b, c;
    /*look for any elements with the class "custom-select":*/
    x = document.getElementsByClassName("custom-select");
    l = x.length;
    for (i = 0; i < l; i++) {
        selElmnt = x[i].getElementsByTagName("select")[0];
        ll = selElmnt.length;
        /*for each element, create a new DIV that will act as the selected item:*/
        a = document.createElement("DIV");
        a.setAttribute("class", "select-selected");
        a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
        x[i].appendChild(a);
        /*for each element, create a new DIV that will contain the option list:*/
        b = document.createElement("DIV");
        b.setAttribute("class", "select-items select-hide");
        for (j = 1; j < ll; j++) {
            /*for each option in the original select element,
            create a new DIV that will act as an option item:*/
            c = document.createElement("DIV");
            c.innerHTML = selElmnt.options[j].innerHTML;
            c.addEventListener("click", function (e) {
                /*when an item is clicked, update the original select box,
                and the selected item:*/
                var y, i, k, s, h, sl, yl;
                s = this.parentNode.parentNode.getElementsByTagName("select")[0];
                sl = s.length;
                h = this.parentNode.previousSibling;
                for (i = 0; i < sl; i++) {
                    if (s.options[i].innerHTML == this.innerHTML) {
                        s.selectedIndex = i;
                        h.innerHTML = this.innerHTML;
                        y = this.parentNode.getElementsByClassName("same-as-selected");
                        yl = y.length;
                        for (k = 0; k < yl; k++) {
                            y[k].removeAttribute("class");
                        }
                        this.setAttribute("class", "same-as-selected");
                        break;
                    }
                }
                h.click();
            });
            b.appendChild(c);
        }
        x[i].appendChild(b);
        a.addEventListener("click", function (e) {
            /*when the select box is clicked, close any other select boxes,
            and open/close the current select box:*/
            e.stopPropagation();
            closeAllSelect(this);
            this.nextSibling.classList.toggle("select-hide");
            this.classList.toggle("select-arrow-active");
        });
    }

    function closeAllSelect(elmnt) {
        /*a function that will close all select boxes in the document,
        except the current select box:*/
        var x, y, i, xl, yl, arrNo = [];
        x = document.getElementsByClassName("select-items");
        y = document.getElementsByClassName("select-selected");
        xl = x.length;
        yl = y.length;
        for (i = 0; i < yl; i++) {
            if (elmnt == y[i]) {
                arrNo.push(i)
            } else {
                y[i].classList.remove("select-arrow-active");
            }
        }
        for (i = 0; i < xl; i++) {
            if (arrNo.indexOf(i)) {
                x[i].classList.add("select-hide");
            }
        }
    }

    /*if the user clicks anywhere outside the select box,
    then close all select boxes:*/
    document.addEventListener("click", closeAllSelect);
</script>
<script>
    //Get the button
    var mybutton = document.getElementById("myBtn");

    // When the user scrolls down 20px from the top of the document, show the button
    window.onscroll = function () {
        scrollFunction()
    };

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
<!-- end document-->