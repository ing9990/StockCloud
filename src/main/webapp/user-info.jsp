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

<table id="user_table" class="table table-striped table-bordered" style="width: 80%; margin: 0 auto;">
    <thead class="table-dark">
    <tr>
        <th scope="col">아이디</th>
        <th scope="col">패스워드</th>
        <th scope="col">등급</th>
        <th scope="col">이름</th>
        <th scope="col">이메일</th>
        <th scope="col"></th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th><%=session.getAttribute("login_id")%>
        </th>
        <th><%=session.getAttribute("login_password")%>
        </th>
        <th><%=session.getAttribute("role")%>
        </th>
        <th><%=session.getAttribute("username")%>
        </th>
        <th><%=session.getAttribute("email")%>
        </th>
        <th></th>
    </tr>
    <tr>
        <th><input class="n" type="hidden" value="<%=session.getAttribute("login_id")%>" id="iloginid"></input></th>

        <th><input class="n" type="text" value="<%=session.getAttribute("login_password")%>" id="ipassword"></input>
        </th>

        <th><input class="n" type="hidden" value="<%=session.getAttribute("role")%>" id="irole"></input></th>

        <th><input class="n" type="text" value="<%=session.getAttribute("username")%>" id="iusername"></input></th>

        <th><input class="n" type="text" value="<%=session.getAttribute("email")%>" id="iemail"></input></th>


        <th>
            <a href="./main.jsp" style="text-decoration: none">
                <button onclick="editUserInfo(<%=session.getAttribute("id")%>)" class="btn btn-success">
                    수정
                </button>
            </a>
        </th>
    </tr>

    </tbody>
</table>


<script src="js/demo-script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>