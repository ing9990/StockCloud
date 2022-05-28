<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://getbootstrap.com/docs/5.0/dist/css/bootstrap.min.css">
    <title>ADMIN PAGE</title>
</head>
<body>

<table class="table" id="user_table">
    <thead>
    <tr>
        <th scope="col">UID</th>
        <th scope="col">ID</th>
        <th scope="col">PW</th>
        <th scope="col">Name</th>
        <th scope="col">Email</th>
        <th scope="col">Rank</th>
    </tr>
    </thead>

    <tbody id="tbody">


    <script>

        let arr = [
            {
                user_id: 0,
                login_id: "TEST",
                login_password: "TEST",
                username: "TEST",
                email: "TEST@naver.com",
                role: "ADMIN",
            }
        ]

        const table = document.getElementById("user_table")

        fetch
        ("http://localhost:8090/api/v1/users")
            .then((res) => res.json())
            .then((data) => {
                console.log(data)
                data.forEach((item)=>{

                    const newRow = table.insertRow()

                    const user_id = newRow.insertCell(0)
                    const login_id = newRow.insertCell(1)
                    const login_password = newRow.insertCell(2)
                    const username = newRow.insertCell(3)
                    const email = newRow.insertCell(4)
                    const role = newRow.insertCell(5)

                    user_id.innerText = item.user_id
                    login_id.innerText = item.login_id
                    login_password.innerText = item.login_password
                    username.innerText = item.username
                    email.innerText = item.email
                    role.innerText = item.role

                })
            })

    </script>


    </tbody>
</table>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>