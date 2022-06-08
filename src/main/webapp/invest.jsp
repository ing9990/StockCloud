<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>모의 투자</title>
    <meta charset="UTF-8">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="sweetalert2.all.min.js"></script>
    <script src="https://code.highcharts.com/stock/highstock.js"></script>
    <script src="https://code.highcharts.com/stock/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/stock/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <style>
        body {
            font-family: "Lato", sans-serif;
        }

        .sidebar {
            height: 100%;
            width: 0;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #111;
            overflow-x: hidden;
            transition: 0.5s;
            padding-top: 60px;
        }

        .sidebar a {
            padding: 4px 4px 4px 32px;
            margin: 20px auto;
            text-decoration: none;
            font-size: 16px;
            color: #818181;
            display: block;
            transition: 0.3s;
        }

        .sidebar a:hover {
            color: #f1f1f1;
        }

        .sidebar .closebtn {
            position: absolute;
            top: 0;
            right: 25px;
            font-size: 36px;
            margin-left: 50px;
        }

        .openbtn {
            font-size: 20px;
            cursor: pointer;
            background-color: #111;
            color: white;
            padding: 10px 15px;
            border: none;
        }

        .openbtn:hover {
            background-color: #444;
        }

        #main {
            transition: margin-left .5s;
        }

        /* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
        @media screen and (max-height: 450px) {
            .sidebar {
                padding-top: 15px;
            }

            .sidebar a {
                font-size: 18px;
            }
        }
    </style>
</head>


<script>
    let search_stockname = "삼성전자"
    let data = [];
</script>

<body>
<jsp:include page="components/header.jsp"/>


<!-- 사이드 바 -->
<div id="mySidebar" class="sidebar" onclick="closeNav()">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>

    <h5 style="color: white; padding: 4px 4px 4px 32px;"><%=session.getAttribute("username")%> 님의 지갑</h5>


    <%--
            1. http://192.168.252.181:8090/api/v2/stock/`2` -> `n`번 User의 보유 종목을 조회.
            2. http://192.168.252.181:8090/api/v2/money/`2` -> `n`번 User의 보유 현금을 조회.
    --%>

    <a href="#" id="my-money-a"></a>

    <script>
        function tmp_change_money() {
            axios.get(path + "api/v2/money/" + <%=session.getAttribute("id")%>)
                .then((res) => document.getElementById("my-money-a").innerText = "소지금: " + res.data + "₩")
        }
    </script>


    <%--    보유 종목 넣기 --%>
    <div id="myStockData">

    </div>

</div>

<!-- 메인 -->
<div id="main">
    <div class="container">

        <button class="openbtn" onclick="openNav()">☰ 지갑</button>


        <span id="setTitleStockname" style="margin:0 30%; font-size:30px">삼성전자</span> <!-- @@ 맨위 종목 Title -->
        <br><br>
        <div class="row">
            <div class="col-9">
                <!-- 종목 검색 -->
                <div class="input-group mb-3">
                    <button id="hokaregButton1" class="btn btn-outline-secondary" type="button" id="button-addon1">
                        종목검색
                    </button>
                    <input type="text" id="inputMessage1" class="form-control" placeholder="삼성전자"
                           aria-label="Example text with button addon" aria-describedby="button-addon1">
                </div>
                <!-- 차트 -->
                <div id="container" style="height: 550px; width : 100%; min-width: 310px;"></div>
            </div>

            <div style="text-align:center; margin:0px 20px;">
                <br>
                <button type="button" onclick=buy() class="btn btn-primary" style="margin:5px 10px;">매수
                </button>
                <button type="button" onclick=sell_stock() class="btn btn-danger" style="margin:5px 10px;">매도
                </button>
            </div>

        </div>
    </div>
</div>
</div>


<!-- 사이드바 스크립트 -->
<script>
    let is_open_Nav = 0;

    let my_stock = []
    tmp_change_money()
    tmp_chagne_stock()

    function tmp_chagne_stock() {
        axios.get(path + "api/v2/stock/" + <%=session.getAttribute("id")%>)
            .then((res) => my_stock = res.data)

        my_stock.map(
            (x) => {
                document.getElementById("myStockData").innerHTML = "";

                my_stock.map(
                    (x) => {
                        document.getElementById("myStockData").innerHTML += '<a href="#">' + x.stockname + ' : ' + x.count + '주 <br>평균 단가 : ' + x.price + '</a>';
                    }
                )
            }
        )
    }

    function openNav() {
        document.getElementById("mySidebar").style.width = "250px";
        document.getElementById("main").style.marginLeft = "250px";

        tmp_change_money()
        tmp_chagne_stock()

        if (is_open_Nav) {
            closeNav();
        } else {
            is_open_Nav = 1;
        }
    }

    function closeNav() {
        document.getElementById("mySidebar").style.width = "0";
        document.getElementById("main").style.marginLeft = "5%";
        is_open_Nav = 0;
    }
</script>

<!-- 매수,매도 스크립트 -->
<script>

    let money = 0

    axios.get(path + "api/v2/money/" +<%=session.getAttribute("id")%>)
        .then((res) => money = res.data)

    function buy() {

        swal({
            title: "몇 주 구매하시겠습니까?",
            text: "",
            content: "input",
            buttons: true,
        })
            .then((value) => {
                if (value) {
                    if (money < document.getElementById("up1").innerText * value) {
                        swal("금액이 부족합니다");
                    } else if (value <= 0) {
                        swal("실패");
                    } else {

                        swal("구매 성공", search_stockname + "를 " + value + "주 구매했습니다.", "success");

                        let data = {
                            "user_id": <%=session.getAttribute("id")%>,
                            "stock_name": search_stockname,
                            "price": 0,
                            "count": value
                        }

                        axios.post(path + "api/v2/stock/buy", data)

                    }
                } else {
                    swal("취소하였습니다.");
                }
            });
    }


    let flag = false
    let haven = 0

    function get_stock_list() {
        axios.get(path + "api/v2/stock/" + <%=session.getAttribute("id")%>)
            .then((res) => {
                my_stock = res.data
                console.log(my_stock)
            })
    }

    function sell_stock() {

        get_stock_list();

        my_stock.forEach((x) => {
            if (x.stockname === search_stockname) {
                flag = true
                haven = x.count
            }
        })


        swal({
            title: "몇 주 판매하시겠습니까?",
            text: search_stockname + "을 " + haven + "주 보유 중입니다.",
            content: "input",
            buttons: true,
        })
            .then((value) => {
                if (value) {
                    if (value <= haven) {
                        swal("판매 성공", search_stockname + "을" + value + "주 판매했습니다.", "success");

                        let data = {
                            "user_id": <%=session.getAttribute("id")%>,
                            "stock_name": search_stockname,
                            "price": 0,
                            "count": value
                        }

                        axios.post(path + "api/v2/stock/sell",
                            data)
                            .then((res) => {
                                console.log("매도 완료.")
                                get_stock_list()
                            })

                    } else {
                        swal("보유 주식보다 많습니다.");
                    }
                } else {
                    swal("취소하였습니다.");
                }
            });
    }
</script>


<!-- 소켓+차트 스크립트 -->
<script>
    window.onload = function () {
        document.getElementById("hokaregButton1").onclick = function () {
            data = []

            let stockcode_tmp = document.getElementById("inputMessage1").value; // 입력받은 데이터
            document.getElementById("setTitleStockname").innerText = stockcode_tmp
            search_stockname = stockcode_tmp

            // ########################
            axios.get(path + "api/v1/get-stockcode/" + stockcode_tmp)
                .then((res) => {
                    stockcode1 = res.data
                    console.log(res.data)
                })
        }
    }

    let myName = document.getElementById("inputMessage1").value;
    Highcharts.stockChart('container', {
        chart: {
            events: {
                load: function () {
                    let series = this.series[0];
                    setInterval(function () {
                        let x = (new Date()).getTime(); // x축
                        let y = 0
                        series.addPoint([x, y], true, true); // 여기가 차트 수정 위치
                    }, 1000);
                }
            }
        },
        accessibility: {
            enabled: true
        },
        time: {
            useUTC: false
        },
        rangeSelector: {
            buttons: [{
                count: 1,
                type: 'minute',
                text: '1M'
            }, {
                count: 5,
                type: 'minute',
                text: '5M'
            }, {
                type: 'all',
                text: 'All'
            }],
            inputEnabled: false,
            selected: 0
        },
        // 풀스크린, 다운로드, 옵션
        exporting: {
            enabled: false
        },

        series: [{
            name: myName,
            data: (function () {
                data = []
                let time = (new Date()).getTime();
                let i;
                // 차트 과거는 0으로 초기화
                for (i = -999; i <= 0; i += 1) {
                    data.push([time + i * 1000, 0]);
                }
                return data;
            }())
        }]
    });
    // y축 단위 default : k , m
    Highcharts.setOptions({
        lang: {
            numericSymbols: null
        }
    });

</script>
<script src="js/demo-script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>