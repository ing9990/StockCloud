let token = 0
let secretbutton = 0
let is_checked = false
const path = "http://192.168.132.181:7777/"
let num = 0

function hiddenbtnclick() {
    secretbutton++

    console.log(secretbutton)

    if (secretbutton > 5) {
        window.location.href = "http://192.168.132.181:7777/review"
    }
}

function sendmail() {
    const username = document.getElementById("username").value
    const email = document.getElementById("email").value

    alert("이메일이 전송되었습니다.")

    let tmpPath = path + "api/v1/mail/" + username + "/" + email

    fetch(tmpPath)
        .then((res) => res.json())
        .then((data) => {
            token = data
        })

}

function add() {
    let progressBar = document.getElementById("progressBar");

    num += 20

    progressBar.setAttribute("style", "width: " + num + "%;");
    progressBar.setAttribute("aria-valuenow", num);
    progressBar.textContent = (num) + "%"
    console.log(num)
}


async function writeReviewButton() {

    // Timer
    let timerInterval
    await Swal.fire({
        title: '리뷰를 남길 준비가 되셨나요???',
        html: '<b></b>',
        timer: 2000,
        timerProgressBar: true,
        didOpen: () => {
            Swal.showLoading()
            const b = Swal.getHtmlContainer().querySelector('b')
            timerInterval = setInterval(() => {
                b.textContent = Swal.getTimerLeft()
            }, 100)
        },
        willClose: () => {
            clearInterval(timerInterval)
        }
    }).then((result) => {
        if (result.dismiss === Swal.DismissReason.timer) {

        }
    })

    //name
    const {value: name} = await Swal.fire({
        title: "당신의 이름은?",
        input: "text",
        inputPlaceholder: "홍길동",
    })


    add()

    // design score
    const {value: design_score} = await Swal.fire({
        title: 'DESIGN',
        input: 'range',
        inputLabel: name + "님이 생각하는 StockCloud의 디자인 점수는?",
        inputAttributes: {
            min: 1,
            max: 5,
            step: 1
        },
        inputValue: 5
    })

    add()
    // idea score
    const {value: idea_score} = await Swal.fire({
        title: 'IDEA',
        input: 'range',
        inputLabel: name + "님이 생각하시는 StockCloud의 아이디어 점수는?",
        inputAttributes: {
            min: 1,
            max: 5,
            step: 1
        },
        inputValue: 5
    })

    add()

    // total score
    const {value: total_score} = await Swal.fire({
        title: 'TOTAL',
        input: 'range',
        inputPlaceholder: name + "님이 생각하시는 StockCloud의 총 점수는?",
        inputAttributes: {
            min: 1,
            max: 5,
            step: 1
        },
        inputValue: 5
    })

    add()

    // letters
    const {value: letter} = await Swal.fire({
        input: "textarea",
        inputLabel: "StockCloud를 평가해주세요.",
        inputPlaceholder: "주식 거래 부분의 디테일이 마음에 들어요!!"
    })

    add()

    const Toast = Swal.mixin({
        toast: true,
        position: 'top-end',
        showConfirmButton: true,
        timer: 3000,
        timerProgressBar: true,
        didOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer)
            toast.addEventListener('mouseleave', Swal.resumeTimer)
        }
    })

    Toast.fire({
        icon: 'success',
        title: '정말 감사해요!!'
    })
        .then(() => {
            let reviewData = {
                "name": name,
                "design_evaluation_score": design_score,
                "idea_evaluation_score": idea_score,
                "letter_evaluation": letter,
                "total_score": total_score
            }

            axios.post(path + "review/write", reviewData)

            window.location.href = path
        })

}

function editUserInfo(e) {

    let infoUserId = document.getElementById("iloginid").value
    let infoUserPassword = document.getElementById("ipassword").value
    let infoUserRole = document.getElementById("irole").value
    let infoUserName = document.getElementById("iusername").value
    let infoUserEmail = document.getElementById("iemail").value


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
        .then((res) => {

        })

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

    if (is_checked) {
        document.getElementById("join-form").submit()
        alert("회원가입이 완료되었습니다.")
    } else {
        alert("모든 입력을 완료해주세요.")
    }
}

