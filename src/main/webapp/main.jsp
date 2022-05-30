<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.concurrent.atomic.AtomicReference" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://getbootstrap.com/docs/5.0/dist/css/bootstrap.min.css">

</head>

<body>
<jsp:include page="components/header.jsp"/>
<h1>환영합니다. <%= (String) session.getAttribute("username")%>님 </h1>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>