<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://getbootstrap.com/docs/5.0/dist/css/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>모의 투자</title>
</head>
<body>
<jsp:include page="components/header.jsp"/>

<!-- TradingView Widget BEGIN -->
<div class="tradingview-widget-container">
    <div id="tradingview_fd401"></div>
    <div class="tradingview-widget-copyright"><a href="https://kr.tradingview.com/symbols/KRX-005930/" rel="noopener"
                                                 target="_blank"><span class="blue-text"></span></a></div>
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
                "hide_top_toolbar": true,
                "hide_legend": true,
                "allow_symbol_change": true,
                "save_image": false,
                "container_id": "tradingview_fd401"
            }
        );
    </script>



</div>
<!-- TradingView Widget END -->

<script src="js/demo-script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>