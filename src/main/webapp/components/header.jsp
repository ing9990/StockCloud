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
<div class="container">

    <header class="d-flex flex-wrap justify-content-between py-3 mb-4 border-bottom">

        <a href="main.jsp" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
            <span class="fs-4">StockCloud</span>
        </a>

        <ul class="nav nav-pills">

            <li class="nav-item">
                <a href="invest.jsp" class="nav-link">
                    모의 투자
                </a>
            </li>

            <li class="nav-item">
                <a href="../get-demo.jsp" class="nav-link">
                    클라우드
                </a>
            </li>

            <li class="nav-item">
                <a href="../user-info.jsp" class="nav-link">
                    내 정보
                </a>
            </li>

            <li class="nav-item">
                <form action="http://192.168.241.181:7777/logout-process" id="form-logout" method="post">
                    <a href="javascript:document.getElementById('form-logout').submit()" class="nav-link">로그 아웃</a>
                </form>
            </li>

        </ul>

    </header>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/demo-script.js"></script>
</body>
</html>