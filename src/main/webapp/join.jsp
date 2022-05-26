<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://getbootstrap.com/docs/5.0/dist/css/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<h1>회원가입 페이지입니다.</h1>

<form action="http://localhost:8090/join-process" method="post">
    <input type="text" name="id" required placeholder="Id">
    <input type="password" name="pw" required placeholder="Password">
    <input type="text" name="username" required placeholder="username">
    <input type="submit" value="회원가입">
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>