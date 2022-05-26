<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://getbootstrap.com/docs/5.0/dist/css/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>내 정보</title>
</head>
<body>
<jsp:include page="components/header.jsp"/>
<h1>정보 페이지입니다.</h1>

<ul>
    <li class="nav-list">
        아이디: <%=session.getAttribute("login_id")%>
    </li>
    <li>
        패스워드: <%=session.getAttribute("login_password")%>
    </li>
    <li>
        등급: <%=session.getAttribute("role")%>
    </li>
    <li>
        이름: <%=session.getAttribute("username")%>
    </li>
    <li>
        이메일: <%=session.getAttribute("email")%>
    </li>
</ul>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>