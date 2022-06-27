<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.concurrent.atomic.AtomicReference" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://getbootstrap.com/docs/5.0/dist/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="components/header.jsp"/>


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

            <p class="card-text">무릎에 매수하고 어깨에 매도하라.</p>

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
            <p class="card-text">난 이거 1파로 본다.</p>


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
            <p class="card-text">10년 투자안할 주식, 10분도 보유말라.</p>

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
</body>
</html>