<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

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
        <%--<span style="font-size:30px;cursor:pointer;padding-right: 20px;color: black" onclick="openNav()">&#9776;</span>--%>
        <a class="navbar-brand text-brand" href="#">Up<span class="color-b">town</span></a>
        <button type="button" class="btn btn-link nav-search navbar-toggle-box-collapse d-md-none" data-toggle="collapse"
                data-target="#navbarTogglerDemo01" aria-expanded="false">
            <span class="fa fa-search" aria-hidden="true"></span>
        </button>

        <div class="navbar-collapse collapse justify-content-lg-end" id="navbarDefault" style="margin-right: 50px; padding-right: 20px;">

            <ul class="navbar-nav">

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img src="resources/img/user.png" style="height: 30px; width: 30px" >
                        ${currentUser}
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">

                        <a class="dropdown-item" href="/logout">Sign Out</a>
                    </div>
                </li>

            </ul>
        </div>

    </div>


</nav>


</body>
</html>