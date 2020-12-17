<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<jsp:include page="advertiserNav.jsp"/>
<!--/ Nav End /-->
<div style="margin-top: 150px">
    <nav>
        <div class="nav nav-tabs" id="nav-tab" role="tablist">
            <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab"
               aria-controls="nav-home" aria-selected="true" style="font-size: 20px">Published Properties</a>
            <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab"
               aria-controls="nav-profile" aria-selected="false" style="font-size: 20px">Pending Requests</a>
            <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab"
               aria-controls="nav-contact" aria-selected="false" style="font-size: 20px">Rejected Properties</a>

        </div>
    </nav>

</div>
<div style=" margin-top: 80px; height: 100%">
    <div class="tab-content" id="nav-tabContent">
        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
            <div style="margin-left: 50px; margin-right: 50px">

            <c:if test="${not empty myProperty}">
            <table class="table" style="padding-left: 50px;">

            <thead>
            <tr>
            <th scope="col">Heading</th>
            <th scope="col">Address</th>
            <th scope="col">Description</th>
            <th scope="col">Price</th>
            <th scope="col">Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="tempProp" items="${myProperty}">
            <tr>
            <th scope="row">${tempProp.heading}</th>
            <td>${tempProp.street}, ${tempProp.city}, ${tempProp.province}</td>
            <td>${tempProp.description}</td>
            <td>${tempProp.rate} / ${tempProp.rateType}</td>
            <td>
                <a href="deleteProperty/${tempProp.id}">
            <button type="button" class="btn btn-outline-danger">
            DELETE</span>
            </button></a>
            </td>
            </tr>
            </c:forEach>

            </tbody>
            </table>
            </c:if>
                <c:if test="${empty myProperty}"  >
                    <div style="background-color: #f5f5f5; height: 400px; text-align: center">
                        <img src="resources/img/building.png" style=" margin-top: 100px" width="120px" height="120px">

                        <h4 style="margin-top: 12px">No Published Properties</h4>
                    </div>
                </c:if>
            </div>
        </div>
        <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
            <div style="margin-left: 50px; margin-right: 50px">


            <c:if test="${not empty request}">
                <table class="table" style="padding-left: 50px;">

                    <thead>
                    <tr>
                        <th scope="col">Heading</th>
                        <th scope="col">Address</th>
                        <th scope="col">Description</th>
                        <th scope="col">Price</th>
                        <th scope="col">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="tempProp" items="${request}">
                        <tr>
                            <th scope="row">${tempProp.heading}</th>
                            <td>${tempProp.street}, ${tempProp.city}, ${tempProp.province}</td>
                            <td>${tempProp.description}</td>
                            <td>${tempProp.rate} / ${tempProp.rateType}</td>
                            <td>

                                <a href="deleteProperty/${tempProp.id}">
                                    <button type="button" class="btn btn-outline-danger">
                                        DELETE</span>
                                    </button></a>
                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </c:if>
                <c:if test="${empty request}"  >
                    <div style="background-color: #f5f5f5; height: 400px; text-align: center">
                        <img src="resources/img/pending.png" style=" margin-top: 100px" width="120px" height="120px">

                        <h4 style="margin-top: 12px">No Pending Request</h4>
                    </div>
                </c:if>
        </div>
        </div>
        <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
            <div style="margin-left: 50px; margin-right: 50px">


                <c:if test="${not empty rejectedProperty}">
                    <table class="table" style="padding-left: 50px;">

                        <thead>
                        <tr>
                            <th scope="col">Heading</th>
                            <th scope="col">Address</th>
                            <th scope="col">Description</th>
                            <th scope="col">Price</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="tempProp" items="${rejectedProperty}">
                            <tr>
                                <th scope="row">${tempProp.heading}</th>
                                <td>${tempProp.street}, ${tempProp.city}, ${tempProp.province}</td>
                                <td>${tempProp.description}</td>
                                <td>${tempProp.rate} / ${tempProp.rateType}</td>
                                <td>
                                    <a href="requestAgain/${tempProp.id}"> <button type="button" class="btn btn-outline-success">
                                        REQUEST AGAIN</span>
                                    </button></a>
                                    <a href="deleteProperty/${tempProp.id}">
                                        <button type="button" class="btn btn-outline-danger">
                                            DELETE</span>
                                        </button></a>
                                </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </c:if>
                <c:if test="${empty rejectedProperty}"  >
                    <div style="background-color: #f5f5f5; height: 400px; text-align: center">
                        <img src="resources/img/rejected.png" style=" margin-top: 100px" width="120px" height="120px">

                        <h4 style="margin-top: 12px">No Rejected Properties</h4>
                    </div>
                </c:if>
            </div>
        </div>
    </div>

</div>
<!--/ Agents End /-->


<jsp:include page="footer.jsp"/>

<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>


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
