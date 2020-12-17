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
    <link href="${pageContext.request.contextPath}resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Main Stylesheet File -->
    <link href="${pageContext.request.contextPath}resources/style/style.css" rel="stylesheet">


</head>

<body>


<jsp:include page="search.jsp"/>
<jsp:include page="advertiserNav.jsp"/>
<!--/ Nav End /-->
<div style="margin-top: 200px">

    <h3 style="margin-left: 60px;margin-bottom: 50px;">Enquiries</h3>
    <div style="margin-left: 50px; margin-right: 50px">
    <c:if test="${not empty enquiry}">
    <table class="table" >
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Phone</th>
            <th scope="col">Comment</th>
            <th scope="col">Property Id</th>
            <th scope="col">Property Heading</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${enquiry}" var="tempEnq">
        <tr>
            <th scope="row">${tempEnq.id}</th>
            <td>${tempEnq.name}</td>
            <td>${tempEnq.email}</td>
            <td>${tempEnq.phone}</td>
            <td>${tempEnq.comment}</td>
            <td>${tempEnq.property.id}</td>
            <td>${tempEnq.property.heading}</td>
            <td><a href="/deleteEnquiry/${tempEnq.id}"><button type="button" class="btn btn-outline-danger">
                <span class="ion-ios-trash"></span>
            </button></a></td>


        </tr>
        </c:forEach>
        </tbody>
    </table>
    </c:if>
        <c:if test="${empty enquiry}"  >
            <div style="background-color: #f5f5f5; height: 400px; text-align: center">
                <img src="resources/img/enquiry.png" style=" margin-top: 100px" width="120px" height="120px">

                <h4 style="margin-top: 12px">No Enquiries Available</h4>
            </div>
        </c:if>
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
