<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://getbootstrap.com/docs/5.0/dist/css/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>StockCloud</title>
</head>
<body>

<div class="container">
    <header class="d-flex flex-wrap justify-content-between py-3 mb-4 border-bottom">
        <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
            <span class="fs-4">StockCloud</span>
        </a>

        <ul class="nav nav-pills">
            <li class="nav-item">
                <a href="login.jsp" class="nav-link">
                    로그인
                </a>
            </li>

            <li class="nav-item">
                <a href="join.jsp" class="nav-link">
                    회원가입
                </a>
            </li>
        </ul>
    </header>
</div>



<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel"
     style="width: 80%; margin:auto; text-align:center;">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <!-- item s -->
            <h2 class="card-title">비트 코인</h2><br>
            <div class="card-img-top tradingview-widget-container" style="width:100%; margin:auto;">
                <div id="tradingview_c1ee1"></div>
                <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
                <script type="text/javascript">
                    new TradingView.widget(
                        {
                            "autosize": false,
                            "symbol": "BITSTAMP:BTCUSD",
                            "interval": "1",
                            "timezone": "Asia/Seoul",
                            "theme": "light",
                            "style": "1",
                            "locale": "kr",
                            "toolbar_bg": "#f1f3f6",
                            "enable_publishing": false,
                            "hide_legend": true,
                            "hide_side_toolbar": false,
                            "allow_symbol_change": true,
                            "container_id": "tradingview_9edd1"
                        }
                    );
                </script>
            </div>
            <br>

            <p style="font-size: 30px; opacity: 65%" class="card-text">무릎에 매수하고 어깨에 매도하라.</p>

            <script>
                async function ff(stockName) {
                    const {value: numberOfStock} = await Swal.fire({
                        title: stockName,
                        input: 'text',
                        inputLabel: '몇주 주문하시겠습니까?',
                        inputPlaceholder: '1'
                    })

                    if (numberOfStock * stockPrice > <%=session.getAttribute("money")%>) {
                        Swal.fire("금액이 부족합니다.")
                    } else {
                        Swal.fire(stockName + "을 " + numberOfStock + "주 주문하셨습니다.")
                    }


                }
            </script>

            <!-- item e -->
        </div>
        <div class="carousel-item">
            <!-- item s -->
            <h3 class="card-title">휴림 로봇</h3><br>
            <div class="card-img-top tradingview-widget-container" style="width:100%; margin:auto;">
                <div id="tradingview_c1ee3"></div>
                <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
                <script type="text/javascript">
                    new TradingView.widget(
                        {
                            "autosize": false,
                            "symbol": "KRX:090710",
                            "interval": "1",
                            "timezone": "Asia/Seoul",
                            "theme": "light",
                            "style": "1",
                            "locale": "kr",
                            "toolbar_bg": "#f1f3f6",
                            "enable_publishing": false,
                            "hide_legend": true,
                            "hide_side_toolbar": false,
                            "allow_symbol_change": true,
                            "container_id": "tradingview_9edd1"
                        }
                    );
                </script>
            </div>
            <br>
            <p style="font-size: 30px; opacity: 65%" class="card-text">난 이거 1파로 본다.</p>


            <!-- item e -->
        </div>
        <div class="carousel-item">
            <!-- item s -->
            <h3 class="card-title">삼성 전자</h3><br>
            <div class="tradingview-widget-container">
                <div id="tradingview_23f10"></div>
                <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
                <script type="text/javascript">
                    new TradingView.widget(
                        {
                            "autosize": false,
                            "symbol": "KRX:005930",
                            "interval": "1",
                            "timezone": "Asia/Seoul",
                            "theme": "light",
                            "style": "1",
                            "locale": "kr",
                            "toolbar_bg": "#f1f3f6",
                            "enable_publishing": false,
                            "hide_legend": true,
                            "hide_side_toolbar": false,
                            "allow_symbol_change": true,
                            "container_id": "tradingview_9edd1"
                        }
                    );
                </script>
            </div>
            <br>
            <p style="font-size: 30px; opacity: 65%" class="card-text">10년 투자안할 주식, 10분도 보유말라.</p>

            <!-- item e -->
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true" style="background-color:gray"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true" style="background-color:gray"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

<script src="js/demo-script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>