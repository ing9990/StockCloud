<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://getbootstrap.com/docs/5.0/dist/css/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>Join</title>

    <style>
        body {
            text-align: justify-all;
        }
    </style>
</head>
<body>
<h1 style="text-align: center">회원가입</h1>
<hr>
<div style="height: 100px"></div>

<%--<form action="http://localhost:8090/join-process" method="post">
    <input type="text" name="id" required placeholder="Id">
    <input type="password"  name="pw" required placeholder="Password">
</form>--%>

<div style="display: flex">

    <div style="width: 35%; height: 100%;">
        <div></div>
    </div>
    <div style="width: 30%">

        <form action="http://localhost:8090/join-process" method="post" class="row g-4" id="join-form">
            <div class="col-md-12">
                <label for="validationServer01" class="form-label">ID</label>
                <input type="text" class="form-control is-valid" name="id" id="validationServer01" value="" placeholder="ID" required>
                <div class="valid-feedback">
                    로그인에 이용돼요.
                </div>
            </div>

            <div class="col-md-12">
                <label for="validationServer02" class="form-label">Password</label>
                <input type="password" class="form-control is-valid" name="pw" id="validationServer02" value=""
                     placeholder="Password"  required>
                <div class="valid-feedback">
                    로그인에 이용돼요.
                </div>
            </div>

            <div class="col-md-12">
                <label for="validationServer02" class="form-label">Username</label>
                <input id="username" name="username" type="text" class="form-control is-valid" id="validationServer03"
                       value="" placeholder="username" required>
                <div class="valid-feedback">
                    정보수정에 사용돼요.
                </div>
            </div>

            <div class="col-8">
                <label for="email" class="visually-hidden">이메일</label>
                <input type="email" class="form-control" id="email" name="email" required placeholder="이메일">
            </div>

            <div class="col-4">
                <button type="button" onclick="sendmail()" class="btn btn-primary mb-3">인증번호 전송</button>
            </div>


            <div class="col-8">
                <label for="token_input" class="visually-hidden">인증번호</label>
                <input type="text" class="form-control" required id="token_input" placeholder="인증번호">
            </div>

            <div class="col-4">
                <button type="button" onclick="checkingToken()" class="btn btn-primary mb-3">인증번호 확인</button>
            </div>

            <div class="col-12">
                <button class="btn btn-primary" onclick="clickSubmit()" type="button">회원가입</button>
            </div>

        </form>
    </div>
    <div style="width: 35%; height: 100%"></div>
</div>
<script src="js/demo-script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>