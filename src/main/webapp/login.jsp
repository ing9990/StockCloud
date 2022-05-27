<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://getbootstrap.com/docs/5.0/dist/css/bootstrap.min.css">
    <title>Insert title here</title>
</head>
<body>
<h1>로그인 페이지</h1>
<form action="http://localhost:8090/login-process" method="post">
    <input type="text" name="id"  required placeholder="Id">
    <input type="password" name="pw" required placeholder="Password">
    <input type="submit" value="로그인">
</form>

<p style="color: red"><%=(String) session.getAttribute("is_login") == null ? "" : (String) session.getAttribute("is_login")%></p>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>


</html>