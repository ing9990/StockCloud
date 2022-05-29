<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <%--<link rel="stylesheet" href="https://getbootstrap.com/docs/5.0/dist/css/bootstrap.min.css">--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <title>ADMIN PAGE</title>
</head>
<body>

<%--<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-arrow-left"
     viewBox="0 0 16 16" onclick="history.back()">
    <path fill-rule="evenodd"
          d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
</svg>--%>

<table id="user_table" class="table table-bordered"
       style="width: 80%; table: white; margin: 0 auto;">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">ID</th>
        <th scope="col">PW</th>
        <th scope="col">Name</th>
        <th scope="col">Email</th>
        <th scope="col">Rank</th>
        <th scope="col">Upgrade</th>
        <th scope="col">Downgrade</th>
        <th scope="col">Banish</th>
    </tr>
    </thead>

    <tbody id="tbody">


    <script>

        function upbtnOnclick(e) {
            let id = e.name.charAt(e.name.length - 1)
            fetch("http://localhost:8090/api/v1/put/" + id)
                .then((res) => console.log(res))

            location.reload()
        }

        function dnbtnOnclick(e) {
            let id = e.name.charAt(e.name.length - 1)
            fetch("http://localhost:8090/api/v1/uput/" + id)
                .then((res) => console.log(res))

            location.reload()
        }

        function banbtnOnclick(e) {
            let id = e.name.charAt(e.name.length - 1)

            fetch("http://localhost:8090/api/v1/delete/" + id)
                .then((res) => console.log(res))

            location.reload()
        }


        const table = document.getElementById("user_table")
        let n = 0

        fetch
        ("http://localhost:8090/api/v1/users")
            .then((res) => res.json())
            .then((data) => {
                data.forEach((item) => {
                    const newRow = table.insertRow()
                    const user_id = newRow.insertCell(0)
                    const login_id = newRow.insertCell(1)
                    const login_password = newRow.insertCell(2)
                    const username = newRow.insertCell(3)
                    const email = newRow.insertCell(4)
                    const role = newRow.insertCell(5)
                    const Upgrade = newRow.insertCell(6)
                    const DownGrade = newRow.insertCell(7)
                    const Banish = newRow.insertCell(8)

                    const suname = "su" + item.user_id
                    const doname = "do" + item.user_id
                    const bnname = "bn" + item.user_id

                    console.log(suname)

                    let btn1 = "<button type=button name=" + suname + " onclick='upbtnOnclick(this)' class=btn btn-success>UP</button>";
                    let btn1_2 = "<button type=button name=" + doname + " onclick='dnbtnOnclick(this)' class=btn btn-success>DOWN</button>";
                    let btn2 = "<button type=button name=" + bnname + " onclick='banbtnOnclick(this)' class=btn btn-danger>X</button>";


                    user_id.innerText = item.user_id
                    login_id.innerText = item.login_id
                    login_password.innerText = item.login_password
                    username.innerText = item.username
                    email.innerText = item.email
                    role.innerText = item.role
                    Upgrade.innerHTML = btn1
                    DownGrade.innerHTML = btn1_2
                    Banish.innerHTML = btn2
                })
            })
    </script>
    </tbody>
</table>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>