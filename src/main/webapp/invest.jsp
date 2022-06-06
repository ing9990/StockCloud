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
    <script src=".\crypto-js.min.js"></script>
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


<body>
<!-- Test -->
<%
    session.setAttribute("username", "나영환");
    session.setAttribute("money", 10000);

    session.setAttribute("stock_name1", "휴림로봇");
    session.setAttribute("stock_num1", 24);
    session.setAttribute("stock_price1", 3300);
%>
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
            axios.get("http://192.168.252.181:8090/api/v2/money/" + <%=session.getAttribute("id")%>)
                .then((res) => document.getElementById("my-money-a").innerText = "소지금: " + res.data + "₩")
        }
    </script>

    <a href="#">
        <%=session.getAttribute("stock_name1")%> : <%=session.getAttribute("stock_num1")%>  주
        <br>
        평균 단가 : <%=session.getAttribute("stock_price1")%>
    </a>

    <a href="#">하마 : 100 주<br>평균 단가 : 19140</a>
    <a href="#">삼성 : 10 주<br>평균 단가 : 67740</a>

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
            <!-- 호가창 -->
            <div class="col-3">
                <div class="upPrice" style="background-color:#BFDFFF;">
                    <div class="row">
                        <div class="col" style="text-align:left">
                            <div id="up10_num">10000</div>
                        </div>
                        <div class="col" style="text-align:center; background-color:#A8C8F9;">
                            <div id="up10">5000</div>
                        </div>
                        <div class="col" style="text-align:right"></div>
                    </div>
                    <div class="row">
                        <div class="col" style="text-align:left">
                            <div id="up9_num">10000</div>
                        </div>
                        <div class="col" style="text-align:center; background-color:#A8C8F9;">
                            <div id="up9">5000</div>
                        </div>
                        <div class="col" style="text-align:right"></div>
                    </div>
                    <div class="row">
                        <div class="col" style="text-align:left">
                            <div id="up8_num">10000</div>
                        </div>
                        <div class="col" style="text-align:center; background-color:#A8C8F9;">
                            <div id="up8">5000</div>
                        </div>
                        <div class="col" style="text-align:right"></div>
                    </div>
                    <div class="row">
                        <div class="col" style="text-align:left">
                            <div id="up7_num">10000</div>
                        </div>
                        <div class="col" style="text-align:center; background-color:#A8C8F9;">
                            <div id="up7">5000</div>
                        </div>
                        <div class="col" style="text-align:right"></div>
                    </div>
                    <div class="row">
                        <div class="col" style="text-align:left">
                            <div id="up6_num">10000</div>
                        </div>
                        <div class="col" style="text-align:center; background-color:#A8C8F9;">
                            <div id="up6">5000</div>
                        </div>
                        <div class="col" style="text-align:right"></div>
                    </div>
                    <div class="row">
                        <div class="col" style="text-align:left">
                            <div id="up5_num">10000</div>
                        </div>
                        <div class="col" style="text-align:center; background-color:#A8C8F9;">
                            <div id="up5">5000</div>
                        </div>
                        <div class="col" style="text-align:right"></div>
                    </div>
                    <div class="row">
                        <div class="col" style="text-align:left">
                            <div id="up4_num">10000</div>
                        </div>
                        <div class="col" style="text-align:center; background-color:#A8C8F9;">
                            <div id="up4">5000</div>
                        </div>
                        <div class="col" style="text-align:right"></div>
                    </div>
                    <div class="row">
                        <div class="col" style="text-align:left">
                            <div id="up3_num">10000</div>
                        </div>
                        <div class="col" style="text-align:center; background-color:#A8C8F9;">
                            <div id="up3">5000</div>
                        </div>
                        <div class="col" style="text-align:right"></div>
                    </div>
                    <div class="row">
                        <div class="col" style="text-align:left">
                            <div id="up2_num">10000</div>
                        </div>
                        <div class="col" style="text-align:center; background-color:#A8C8F9;">
                            <div id="up2">5000</div>
                        </div>
                        <div class="col" style="text-align:right"></div>
                    </div>
                    <div class="row">
                        <div class="col" style="text-align:left">
                            <div id="up1_num">1234</div>
                        </div>
                        <div class="col" style="text-align:center; background-color:#A8C8F9;">
                            <div id="up1">0</div>
                        </div>
                        <div class="col" style="text-align:right"></div>
                    </div>
                </div>
                <!-- 매도 -->
                <div style="background-color:#FFDDDD;">
                    <div class="row">
                        <div class="col" style="text-align:left"></div>
                        <div class="col" style="text-align:center; background-color:#FFCCCC;">
                            <div id="down1">0</div>
                        </div>
                        <div class="col" style="text-align:right">
                            <div id="down1_num">1234</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col" style="text-align:left"></div>
                        <div class="col" style="text-align:center; background-color:#FFCCCC;">
                            <div id="down2">5000</div>
                        </div>
                        <div class="col" style="text-align:right">
                            <div id="down2_num">10000</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col" style="text-align:left"></div>
                        <div class="col" style="text-align:center; background-color:#FFCCCC;">
                            <div id="down3">5000</div>
                        </div>
                        <div class="col" style="text-align:right">
                            <div id="down3_num">10000</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col" style="text-align:left"></div>
                        <div class="col" style="text-align:center; background-color:#FFCCCC;">
                            <div id="down4">5000</div>
                        </div>
                        <div class="col" style="text-align:right">
                            <div id="down4_num">10000</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col" style="text-align:left"></div>
                        <div class="col" style="text-align:center; background-color:#FFCCCC;">
                            <div id="down5">5000</div>
                        </div>
                        <div class="col" style="text-align:right">
                            <div id="down5_num">10000</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col" style="text-align:left"></div>
                        <div class="col" style="text-align:center; background-color:#FFCCCC;">
                            <div id="down6">5000</div>
                        </div>
                        <div class="col" style="text-align:right">
                            <div id="down6_num">10000</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col" style="text-align:left"></div>
                        <div class="col" style="text-align:center; background-color:#FFCCCC;">
                            <div id="down7">5000</div>
                        </div>
                        <div class="col" style="text-align:right">
                            <div id="down7_num">10000</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col" style="text-align:left"></div>
                        <div class="col" style="text-align:center; background-color:#FFCCCC;">
                            <div id="down8">5000</div>
                        </div>
                        <div class="col" style="text-align:right">
                            <div id="down8_num">10000</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col" style="text-align:left"></div>
                        <div class="col" style="text-align:center; background-color:#FFCCCC;">
                            <div id="down9">5000</div>
                        </div>
                        <div class="col" style="text-align:right">
                            <div id="down9_num">10000</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col" style="text-align:left"></div>
                        <div class="col" style="text-align:center; background-color:#FFCCCC;">
                            <div id="down10">5000</div>
                        </div>
                        <div class="col" style="text-align:right">
                            <div id="down10_num">10000</div>
                        </div>
                    </div>
                </div>
                <div style="text-align:center; margin:0px 20px;">
                    <br>
                    <button type="button" onclick=sell_stock() class="btn btn-primary" style="margin:5px 10px;">매수
                    </button>
                    <button type="button" onclick=buy_stock() class="btn btn-danger" style="margin:5px 10px;">매도
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Test -->
TEST<br>
<button type="button" class="btn btn-primary" onclick=test1()>500원 up</button>
<button type="button" class="btn btn-primary" onclick=test2()>500원 down</button>
<!-- Test  -->


<!-- 화요일에 확인하고 0%로 바꾸기 -->
<!-- api 호가창 로그 -->
<pre id="output" style="width: 100%; height: 100%; overflow: auto;"></pre>

<!-- api 소켓 로그 -->
<div style="opacity: 0%; width: 0%; height: 0%; box-sizing: border-box">
    <pre id="output3" style="width: 100%; height: 10%; overflow: auto;"></pre>
    <button id="closeButton" type="button" style="width: 0%; height: 0%;"></button>
</div>


<!-- Test 버튼 script -->
<script>
    function test1() {
        y_Value += 500;

        document.getElementById("up1").innerText = y_Value;
        document.getElementById("down1").innerText = y_Value - 500;
        document.getElementById("up1_num").innerText = Math.round(Math.random() * 10000);
        document.getElementById("down1_num").innerText = Math.round(Math.random() * 10000);
    }

    function test2() {
        y_Value -= 500;
        document.getElementById("up1").innerText = y_Value;
        document.getElementById("down1").innerText = y_Value - 500;
        document.getElementById("up1_num").innerText = Math.round(Math.random() * 10000);
        document.getElementById("down1_num").innerText = Math.round(Math.random() * 10000);
    }
</script>

<!-- 사이드바 스크립트 -->
<script>
    var is_open_Nav = 0;

    let my_stock = []

    function tmp_chagne_stock() {
        axios.get(path + "api/v2/stock/" + <%=session.getAttribute("id")%>)
            .then((res) => my_stock = res.data)

        my_stock.map(
            (x) => {
                console.log(x)
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
    <%-- var stockname = <%=session.getAttribute("stock_name1")%>; --%>
    var num = <%=session.getAttribute("stock_num1")%>;
    var price =
    <%=session.getAttribute("stock_price1")%>
    var money = <%=session.getAttribute("money")%>


        async function sell_stock() {
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
                            swal("구매 성공", "<%=session.getAttribute("stock_name1")%>를 " + value + "주 구매했습니다.", "success");
                        }
                    } else {
                        swal("취소하였습니다.");
                    }
                });
        }

    async function buy_stock() {
        swal({
            title: "몇 주 판매하시겠습니까?",
            text: "현재 보유 주식은 " + num + " 주입니다.",
            content: "input",
            buttons: true,
        })
            .then((value) => {
                if (value) {
                    if (value <= num) {
                        swal("판매 성공", "<%=session.getAttribute("stock_name1")%>를 " + value + "주 판매했습니다.", "success");
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
    /* Key : 개인키 ,secretKey, 법인키 */

    var g_app_key = "PSzBwHatpt7f6QlGEHfm8UE7eEDylF8PIgjp"
    var g_appsecret = "cGNrKD2UWdIthk1dayDf6MXVraS/VTQk8+u3+2v5goXDNlp/ctBkKnlwK/56c208Qp/U78Zjzx8bGq5p3k5C9eq+9VhEOfKfQlsksnH+yJp9g1vC5WIE6xQ1Oo/NIoww5fF+jEsJ6lHM3/26kyi0dexVJSPB72vzc8wXJ74RKPp9mpQpILY=";
    var g_personalseckey = "nKVixJKIVll+Ro8PTPHDVssdCX5Y2zA5fsjhclkjBBgHiHYmNoc3aq36pj61GKMqD2XmEExcXd6siqzJM6w0CmkY9UUwSmmFItBjhQh5EdufRZhCRq80Ld0LeMXqTxUZpcOgkghjp26oDQm4SpSIPzY5LH3ObQH0DTgCPjdS8aNzs88KkUk=";	// 테스트 후 삭제

    /* button action 시 stockcode 저장 전역변수 */
    var stockcode1 = "";
    var ping = 0;

    /* 차트 y축 값 */
    var y_Value = 0;

    // 모르겠다
    var escapable = /[\x00-\x1f\ud800-\udfff\u200c\u2028-\u202f\u2060-\u206f\ufff0-\uffff]/g;

    function filterUnicode(quoted) {
        escapable.lastIndex = 0;
        if (!escapable.test(quoted)) return quoted;

        return quoted.replace(escapable, function (a) {
            return '';
        });
    }

    // websocket 접속
    try {
        url = "ws://ops.koreainvestment.com:21000";

        w = new WebSocket(url);
        w.onopen = function () {
            let t = setInterval(function () {
                if (ws.readyState != 1) {
                    clearInterval(t);
                    return;
                }
                w.send('{type:"ping"}');
            }, 55000);
        };
    } catch (e) {
    }

    // 출력처리, 실시간 로그 확인용이라 지워도 상관 없음
    var log = function (s, f) {
        //console.log(s);
        if (document.readyState !== "complete") {
            log.buffer.push(s);
        } else {
            if (f == 1) {
                document.getElementById("output").style.fontSize = "12px";
                document.getElementById("output").innerHTML += (s + "\n");
            } else if (f == 2) {
                document.getElementById("output_1").style.fontSize = "12px";
                document.getElementById("output_1").innerHTML += (s + "\n");
            }
        }
    }
    log.buffer = [];


    // 소켓에서 데이터 전송이 있을 때 function
    w.onmessage = function (e) {
        // unicode 처리
        var recvdata = filterUnicode(e.data);

        // 첫데이터가 0이나 1일경우 수신된 실시간 데이터 이므로 다음 단계를 통해 처리한다.
        if (recvdata[0] == 0 || recvdata[0] == 1) {
            var strArray = recvdata.split('|');	// 구분자로 문자열 자르기

            var trid = strArray[1];		// Tr ID
            var bodydata = (strArray[3]);	// 수신받은 데이터 중 실시간데이터 부분
            if (trid == "H0STCNT0" || trid == "K0STCNT0") {
                console.log(bodydata);
            }

            if (trid == "H0STASP0" && strArray[0] == 0) {	// 주식호가
                // 수신 받은 데이터 처리
                var strResult = bodydata.split('^');
                var screenflag = 0;
                if (stockcode1 == strResult[0]) {
                    screenflag = 1;
                    document.getElementById("output").innerHTML = ("");
                }

                /* test 로그 */
                log("종목코드[" + strResult[0] + "]\n", screenflag);
                log("매수 가격 : " + strResult[3] + "   잔량[" + strResult[23] + "]", screenflag);
                log("매도 가격 : " + strResult[13] + "   잔량[" + strResult[33] + "]", screenflag);
                log("누적거래량 :" + strResult[53], screenflag);
                /* test 끝 */


                document.getElementById("setTitleStockname") = strResult[0] // Title 종목코드 세팅

                y_Value = strResult[3]; // 차트용 y축 데이터

                /* 매도 */
                document.getElementById("up10").innerHTML = strResult[12];
                document.getElementById("up10_num").innerHTML = strResult[32];
                document.getElementById("up9").innerHTML = strResult[11];
                document.getElementById("up9_num").innerHTML = strResult[31];
                document.getElementById("up8").innerHTML = strResult[10];
                document.getElementById("up8_num").innerHTML = strResult[30];
                document.getElementById("up7").innerHTML = strResult[9];
                document.getElementById("up7_num").innerHTML = strResult[29];
                document.getElementById("up6").innerHTML = strResult[8];
                document.getElementById("up6_num").innerHTML = strResult[28];
                document.getElementById("up5").innerHTML = strResult[7];
                document.getElementById("up5_num").innerHTML = strResult[27];
                document.getElementById("up4").innerHTML = strResult[6];
                document.getElementById("up4_num").innerHTML = strResult[26];
                document.getElementById("up3").innerHTML = strResult[5];
                document.getElementById("up3_num").innerHTML = strResult[25];
                document.getElementById("up2").innerHTML = strResult[4];
                document.getElementById("up2_num").innerHTML = strResult[24];
                document.getElementById("up1").innerHTML = strResult[3];
                document.getElementById("up1_num").innerHTML = strResult[23];
                /* 매수 */
                document.getElementById("down1").innerHTML = strResult[13];
                document.getElementById("down1_num").innerHTML = strResult[33];
                document.getElementById("down2").innerHTML = strResult[14];
                document.getElementById("down2_num").innerHTML = strResult[34];
                document.getElementById("down3").innerHTML = strResult[15];
                document.getElementById("down3_num").innerHTML = strResult[35];
                document.getElementById("down4").innerHTML = strResult[16];
                document.getElementById("down4_num").innerHTML = strResult[36];
                document.getElementById("down5").innerHTML = strResult[17];
                document.getElementById("down5_num").innerHTML = strResult[37];
                document.getElementById("down6").innerHTML = strResult[18];
                document.getElementById("down6_num").innerHTML = strResult[38];
                document.getElementById("down7").innerHTML = strResult[19];
                document.getElementById("down7_num").innerHTML = strResult[39];
                document.getElementById("down8").innerHTML = strResult[20];
                document.getElementById("down8_num").innerHTML = strResult[40];
                document.getElementById("down9").innerHTML = strResult[21];
                document.getElementById("down9_num").innerHTML = strResult[41];
                document.getElementById("down10").innerHTML = strResult[22];
                document.getElementById("down10_num").innerHTML = strResult[42];
            }
        }
    }

    window.onload = function () {
        document.getElementById("hokaregButton1").onclick = function () {
            // 입력받은 데이터
            var stockcode_tmp = document.getElementById("inputMessage1").value;


            // ########################
            axios.get("http://localhost:8090/api/v1/get-stockcode/" + stockcode_tmp)
                .then((res) => stockcode_tmp = res.data)


            stockcode1 = stockcode_tmp;
            // 주식호가 등록용 json 데이터를 만드는 부분
            var result = '{"header": {"authoriztion":"","appkey":"' + g_app_key + '","appsecret":"' + g_appsecret + '","personalseckey":"' + g_personalseckey + '","custtype":"P","tr_type":"1","content-type":"utf-8"},"body": {"input": {"tr_id":"H0STASP0","tr_key":"' + stockcode1 + '"}}}';

            try {
                // 만들어진 json 데이터를 websocket으로 전송한다.
                w.send(result);
            } catch (e) {
            }
        }
        // 정지 버튼 처리
        document.getElementById("bidderegButton1").onclick = function () {
            // textbox 에서 종목코드를 가져온다.
            stockcode1 = document.getElementById("inputMessage1").value;
            // 전송할 json
            var result = '{"header":{"authoriztion":"","appkey":"' + g_app_key + '","appsecret":"' + g_appsecret + '","personalseckey":"' + g_personalseckey + '","custtype":"P","tr_type":"2","content-type":"utf-8"},"body": {"input": {"tr_id":"H0STCNT0","tr_key":"' + stockcode1 + '"}}}';
            stockcode1 = "";
            try {
                // json을 연결된 소켓으로 전송한다.
                w.send(result);
            } catch (e) {
            }
        }

        // 웹소켓 해제
        document.getElementById("closeButton").onclick = function () {
            w.close();
        }
    }

    // ############### 차트 스크립트
    var myName = document.getElementById("inputMessage1").value;
    Highcharts.stockChart('container', {
        chart: {
            events: {
                load: function () {
                    var series = this.series[0];
                    setInterval(function () {
                        var x = (new Date()).getTime(); // x축
                        //var y = Math.round(Math.random() * 67000); // 테스트용 랜덤값
                        series.addPoint([x, y_Value], true, true); // 여기가 차트 수정 위치
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
                var data = [];
                var time = (new Date()).getTime();
                var i;
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