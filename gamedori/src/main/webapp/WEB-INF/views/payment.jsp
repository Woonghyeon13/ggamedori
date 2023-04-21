<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/head.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
        var IMP = window.IMP; 
        IMP.init("imp32745085"); 
    
        function requestPay() {
        	IMP.request_pay({
        	    pg : 'nice',
        	    pay_method : 'card',
        	    merchant_uid: "order_no_0001", //상점에서 생성한 고유 주문번호
        	    name : '주문명:결제테스트',
        	    amount : 14000,
        	    buyer_email : 'iamport@siot.do',
        	    buyer_name : '구매자이름',
        	    buyer_tel : '010-1234-5678',
        	    buyer_addr : '서울특별시 강남구 삼성동',
        	    buyer_postcode : '123-456',
        	    m_redirect_url : '{모바일에서 결제 완료 후 리디렉션 될 URL}', // 예: https://www.my-service.com/payments/complete/mobile
        		niceMobileV2 : true // 신규 모바일 버전 적용 시 설정
        	}, function (rsp) { // callback
                if (rsp.success) {
                    console.log(rsp);
                } else {
                    console.log(rsp);
                }
            });
        }
    </script>
    <meta charset="UTF-8">
    <title>Sample Payment</title>
</head>
<body>
    <button onclick="requestPay()">결제하기</button> <!-- 결제하기 버튼 생성 -->
</body>
</html>