<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>결제 테스트</title>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script>
        

        function requestPay() {
        	const IMP = window.IMP; // 생략 가능
            IMP.init("imp32745085"); // 예: imp00000000a
            
            IMP.request_pay({
                pg: "payco",
                pay_method: "card",
                merchant_uid: "ORD" + new Date().getTime(), // 주문번호를 중복되지 않게 설정합니다.
                name: "노르웨이 회전 의자",
                amount: 64900, // 숫자 타입
                buyer_email: "gildong@gmail.com",
                buyer_name: "홍길동",
                buyer_tel: "010-4242-4242",
                buyer_addr: "서울특별시 강남구 신사동",
                buyer_postcode: "01181"
            }, function (rsp) { // callback
                if (rsp.success) {
                    // 결제 성공 시 로직
                    console.log("결제 성공");
                } else {
                    // 결제 실패 시 로직
                    console.log("결제 실패");
                }
            });
        }
    </script>
</head>
<body>
    <h1>결제 테스트</h1>
    <button onclick="requestPay()">결제하기</button>
</body>
</html>