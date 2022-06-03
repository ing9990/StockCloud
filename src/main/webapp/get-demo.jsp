<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://getbootstrap.com/docs/5.0/dist/css/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>데모 신청</title>
</head>
<body style="text-align: center;">
<jsp:include page="components/header.jsp"/>
<%--
<script>
    demoEvent()
</script>--%>

<img style="border: 1px solid black;" id="cloud-img" class="img-thumbnail"
     src="./img/<%=new SimpleDateFormat("yyyyMMdd").format(Calendar.getInstance().getTime())+".png"%>"
     alt="클라우드를 불러오지 못했습니다. 잠시만 기다려주세요.">

<div class="alert alert-primary" style="margin-top: 20px;" role="alert">
    오늘의 거래량 1등은 삼성전자입니다.
</div>

<script src="js/demo-script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>