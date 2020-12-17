<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<body>
<h1>Spring Boot File Upload Example</h1>
<hr/>
<h4>Upload Single File:</h4>
<form action="uploadFile" method="post" enctype="multipart/form-data">
    <input type="file" name="file"/> <br/><br/>
    <button type="submit">Submit</button>
</form>
<hr/>
<div th:if="${message}">
    <h2 th:text="${message}"/>
</div>

<h4>Upload Multiple Files:</h4>
<form action="uploadFiles" method="post" enctype="multipart/form-data">
    <input type="file" name="files" multiple/> <br/><br/>
    <button type="submit">Submit</button>
</form>

<hr/>

</body>
</html>