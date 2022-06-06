let token = 0
let is_checked = false
const path = "http://192.168.252.181:8090/"


function demoEvent() {
    fetch(path + "api/v1")
        .then((res) => {
            console.log(res)
        })
}

function sendmail() {
    const username = document.getElementById("username").value
    const email = document.getElementById("email").value

    alert("이메일이 전송되었습니다.")

    let tmpPath = path + "api/v1/mail/" + username + "/" + email
    console.log(tmpPath)

    fetch(tmpPath)
        .then((res) => res.json())
        .then((data) => {
            token = data
            console.log("data: " + data)
        })

    console.log(username + "님의 토큰은 " + token + "입니다.")
}


function editUserInfo(e) {

    let infoUserId = document.getElementById("iloginid").value
    let infoUserPassword = document.getElementById("ipassword").value
    let infoUserRole = document.getElementById("irole").value
    let infoUserName = document.getElementById("iusername").value
    let infoUserEmail = document.getElementById("iemail").value

    console.log("id: " + infoUserId.toString())
    console.log("pw: " + infoUserPassword.toString())

    let data = {
        "infoUserId": infoUserId,
        "infoUserPassword": infoUserPassword,
        "infoUserRole": infoUserRole,
        "infoUserName": infoUserName,
        "infoUserEmail": infoUserEmail
    }

    fetch(path + "api/v1/editUserInfo/" + e, {
        method: "put",
        headers: {
            'Accept': '*/*',
            'Accept-Encoding': 'gzip, deflate, br',
            'Connection': 'keep-alive',
            'User-Agent': 'PostmanRuntime/7.29.0',
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data),
    })
        .then((res) => console.log(res))

    alert("변경이 완료되었습니다.")

    window.history.back()
    location.reload()
}


function checkingToken() {
    const c = document.getElementById("token_input").value

    if (c == token) {
        alert("인증 확인")
        is_checked = true
    } else alert("인증번호가 틀립니다.")

}

function clickSubmit() {
    console.log(is_checked)

    if (is_checked) {
        document.getElementById("join-form").submit()
        alert("회원가입이 완료되었습니다.")
    } else {
        alert("모든 입력을 완료해주세요.")
    }
}

