<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/head.jsp" %>
<main>
	<h3 class="mt-4 mb-3 text-center container" style="font-weight: bold; padding-top: 100px; padding-bottom: 50px;">주문서</h3>
	<section id="join_Main" class="d-flex p-2 " >
	<div id="join_box" class="container" >
		<div class="input-form-backgroud row">
		  <div class="input-form col-md-12">
			<h4 class="mb-3">주문하신분</h4><hr/>
			  <div class="row">
				<div class="col-md-6 mb-3">
					<label for="MEMBER_NAME">이름</label>
					<input type="hidden" id="ord_memIdx" value="${memvo.member_idx}">
					<input value="${memvo.member_name}" type="text" class="form-control input_s" id="mem_name" disabled>
				</div>
				<hr/>
			  </div>
			 	<div class="mb-3">
					<label for="formGroupExampleInput2" class="form-label">휴대전화</label>
					<div class="input-group">
						<input value="${memvo.member_phone}" id="mem_phone" type="text" class="form-control"aria-label="Recipient's username" aria-describedby="button-addon2" disabled>
					</div>
				</div>
				<hr/>
				<!-- 주소검색 api -->
				<label for="ADDR_1">우편번호</label>
				<div class="input-group">
					<input value="${adr.addr_1}" id="mem_addr1" type="text" class="form-control" placeholder="우편번호">
					<button class="btn btn-outline-secondary" onclick="sample5_execDaumPostcode()" type="button" id="button-addon2">우편번호 찾기</button>
				</div>
				<br/>
				<label for="ADDR_2">주소</label>
				<input value="${adr.addr_2}" type="text" class="form-control col-md-6 input_s" id="mem_addr2" placeholder="주소">
				<br>
				<input value="${adr.addr_3}" type="text" class="form-control col-md-6 input_s" id="mem_addr3" placeholder="상세주소">
			<!----------------------------------------------------------------------------------------------------------------------------->
				<div id="orderpage_Recipient">
					<h4 class="mb-3" >받으시는분  <span style="font-size: 14px; color: rgb(168, 168, 168);"><input id="memAddrBtn" type="checkbox"> 주문자와 동일</span> </h4><hr/>
					<div class="row">
					<input type="hidden" name="member_idx" value="${memvo.member_idx}">
					<div class="col-md-6 mb-3">
						<label for="MEMBER_NAME">*수령인/배송지명</label>
						<input type="text" class="form-control input_s" name="order_name" id="ord_name" required>
						<div class="invalid-feedback mt-3">
							수령인/배송지명을 입력해주세요
						</div>
					</div>
					<hr/>
					</div>
					<div class="mb-3">
						<label for="formGroupExampleInput2" class="form-label">*휴대전화</label>
						<div class="input-group">
							<input type="text" name="order_phone" id="ord_phone" class="form-control"aria-label="Recipient's username" aria-describedby="button-addon2" required>
							<div class="invalid-feedback">
								전화번호를 입력해주세요
							</div>
						</div>
					</div>
					<hr/>
					<!-- 주소검색 api -->
					<label for="ADDR_1">*우편번호</label>
					<div class="input-group">
						<input id="ord_addr1" type="text" class="form-control" placeholder="우편번호">
						<button class="btn btn-outline-secondary" onclick="sample6_execDaumPostcode()" type="button" id="button-addon2">우편번호 찾기</button>
					</div>
					<div class="invalid-feedback">
						우편번호를 입력해주세요
					</div><br/>
					<label for="ADDR_2" class="">*배송지 주소</label>
					<input type="text" name="order_addr2" class="form-control col-md-6 input_s" id="ord_addr2" placeholder="주소" required>
					<div class="invalid-feedback mt-3">
						주소를 입력해주세요
					</div>
					<br>
					<input type="text" name="order_addr3" class="form-control col-md-6 mb-3 input_s" id="ord_addr3" placeholder="상세주소">
					<label for="ordermemo">배송메모</label><br>
					<textarea class="form-control" name="order_memo" id="ordermemo" style="width: 475px; height: 40px;"></textarea>
				</div>
			<br/>
			  <div class="mb-4"></div>
		  </div>
		</div>
	</div>
		<!-- 주문 -->
		<div id="order_inner" class="mx-auto mt-4">
			<div id="order_left">
				<h4 class="mb-3" style="font-weight: bold;">주문상품</h4>
				<hr/>
				<table class="table table-borderless">
					<thead>
						<th colspan="2">상세정보</th><th>판매가</th><th>수량</th>
					</thead>
					<tbody>
					<c:forEach var="optvo" items="${optlist}" varStatus="status">
						<tr class="table-light text-center" style="border-bottom:1px solid #bdbdbd;">
							<td><img src="./images/HOT1.jpg" style="width: 100px; height: 100px;"></td>
							<td class="pbb3">
								<input type="hidden" id="optName${status.count}" value="${optvo.prod_name}">
								<input type="hidden" id="ord_optIdx" name="opt_tb_idx" value="${optvo.opt_idx}">
								<input type="hidden" id="ord_optQty" name="orderd_qty" value="${optvo.opt_qty}">
								<input type="hidden" id="ord_optPrice" name="orderd_price" value="${optvo.opt_price * optvo.opt_qty}">
								<p>${optvo.prod_name}</p><br>
								<p>${optvo.opt_name} (+[수량:${optvo.opt_qty}개])</p>
							</td>
							<td class="pbb3">
								<fmt:formatNumber var="optPricesCom" value="${optvo.opt_price * optvo.opt_qty}" pattern="#,###"/>
							${optPricesCom}원
							</td>
							<td class="pbb3">${optvo.opt_qty}</td>
						</tr>
					</c:forEach>
					<c:set var="orderPrices" value="0"/>
					<c:forEach var="orderPrice" items="${optlist}">
						<c:set var="orderPrices" value="${orderPrices + orderPrice.opt_price*orderPrice.opt_qty}"/>
					</c:forEach>
						<tr class="pbb" >
						<td class="pbb2" colspan="4">
							<h4 class="mb-1" style="font-weight: bold;">포인트 사용</h4>
								<fmt:formatNumber var="savePointt" value="${savePoint}" pattern="#,###"/>
							<p style="font-size: 14px;">보유 적립금 : ${savePointt}점</p>
							<input type="hidden" id="savePoint" value="${savePoint}">
							<div class="input-group mb-3">
								<input id="usePoint" name="use_point" type="text" style="width:600px;" min="1" max="${savePoint}" class="form-control col-md-6 input_s">
								<button class="btn btn-outline-secondary" type="button" onclick="usingPoint()" id="button-addon2">전액사용</button>
							</div>							
						</td>
						</tr>
						<tr class="pbb" >
							<td class="pbb2">총 상품구매금액</td>
							<td colspan="3">
								<fmt:formatNumber var="orderPricesCom" value="${orderPrices}" pattern="#,###"/>
								${orderPricesCom}원
							</td>
						</tr>
						<tr class="pbb">
							<td class="pbb2">배송비</td>
							<td colspan="3">3,000원</td>
						</tr>
						<tr class="pbb" style="border-bottom:1px solid #bdbdbd;">
							<td class="pbb2">적립금</td>
							<td colspan="3">
							<fmt:parseNumber var="orderPoint" value="${orderPrices/10}" integerOnly="true" />
							<fmt:formatNumber var="orderPointCom" value="${orderPoint}" pattern="#,###"/>
							${orderPointCom}원
							</td>
						</tr>
						<tr class="pbb" style="height: 80px; vertical-align: middle;">
							<fmt:formatNumber var="orderPointCal" value="${orderPrices - use_point}" pattern="#,###"/>
							<td class="pbb2">
								<input type="hidden" id="ordPric" value="${orderPrices}">
								총 결제금액
							</td>
							<td colspan="3" id="priCalResult">
							<input id="priceCalResult" name="priceCalResult" type="hidden" class="form-control col-md-6 input_s">
							${orderPointCal}원
							</td>
							<fmt:parseNumber var="orderPointCalNumber" value="${orderPointCal}" integerOnly="true" />
						</tr>
					</tbody>
				</table>
			</div>
			<div id="orderForm_rufwp">
				<h4 class="mb-3" style="font-weight: bold;">결제</h4>
				<hr/>
				<h5 style="font-size: 20px; font-weight: bold;">결제수단    <span class="badge bg-success">신용카드</span></h5>
			</div>
			<div class="d-grid gap-2">
				<input type="hidden" id="memName" value="${memvo.member_name}">
				<input type="hidden" id="memPhone" value="${memvo.member_phone}">
				<input type="hidden" id="memEmail" value="${memvo.member_email}">
				<input type="hidden" id="memAddr1" value="${adr.addr_1}">
				<input type="hidden" id="memAddr2" value="${adr.addr_2}">
				<input type="hidden" id="backUrl" value="<c:url value='/list.do' />">
				<button class="btn btn-danger btn-block mt-4" onclick="requestPay()" style="font-weight: bold">주문하기</button>
				<button type="button" class="btn btn-danger btn-block mt-4" onclick="orderAjax()" style="font-weight: bold">주문테스트</button>
			</div>
		</div>
	</section>
</main>
				<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<script>
					function sample6_execDaumPostcode() 
					{
						new daum.Postcode(
							{
							oncomplete: function(data) 
							{
								// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

								// 각 주소의 노출 규칙에 따라 주소를 조합한다.
								// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
								var addr = ''; // 주소 변수
								var extraAddr = ''; // 참고항목 변수

								//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
								if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
									addr = data.roadAddress;
								} else { // 사용자가 지번 주소를 선택했을 경우(J)
									addr = data.jibunAddress;
								}

								// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
								if(data.userSelectedType === 'R')
								{
									// 법정동명이 있을 경우 추가한다. (법정리는 제외)
									// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
									if(data.bname !== '' && /[동|로|가]$/g.test(data.bname))
									{
										extraAddr += data.bname;
									}
									// 건물명이 있고, 공동주택일 경우 추가한다.
									if(data.buildingName !== '' && data.apartment === 'Y')
									{
										extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
									}
								}
								// 우편번호와 주소 정보를 해당 필드에 넣는다.
								document.getElementById('ord_addr1').value = data.zonecode;
								document.getElementById("ord_addr2").value = addr;
								// 커서를 상세주소 필드로 이동한다.
								document.getElementById("ord_addr3").focus();
							}
						}).open();
					}
				</script>
				<script>
					function sample5_execDaumPostcode() 
					{
						new daum.Postcode(
							{
							oncomplete: function(data) 
							{
								var addr = ''; // 주소 변수
								var extraAddr = ''; // 참고항목 변수
								if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
									addr = data.roadAddress;
								} else { // 사용자가 지번 주소를 선택했을 경우(J)
									addr = data.jibunAddress;
								}
								if(data.userSelectedType === 'R')
								{
									if(data.bname !== '' && /[동|로|가]$/g.test(data.bname))
									{
										extraAddr += data.bname;
									}
									if(data.buildingName !== '' && data.apartment === 'Y')
									{
										extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
									}
								}
								document.getElementById('mem_addr1').value = data.zonecode;
								document.getElementById("mem_addr2").value = addr;
								document.getElementById("mem_addr3").focus();
							}
						}).open();
					}
				</script>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
    	function generateOrderNumber() {
    	  const timestamp = new Date().getTime(); // 현재 시간을 밀리초 단위로 가져옵니다.
    	  const randomNum = Math.floor(Math.random() * 100000); // 0 ~ 99999 사이의 랜덤 숫자를 생성합니다.
    	  return "order_" + randomNum;
    	}
    	
	   	var IMP = window.IMP; 
	    IMP.init("imp32745085"); 
	   	var ordName = $("#optName1").val();
 		var memName = $("#memName").val();
 		var memEmail = $("#memEmail").val();
 		var memPhone = $("#memPhone").val().replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/\-{1,2}$/g, "");
 		var memAddr1 = $("#memAddr1").val();
 		var memAddr2 = $("#memAddr2").val();
 		var backUrl = $("#backUrl").val();
 		
 		var member_tb_idx = $("#ord_memIdx").val();
 		var coupon_tb_idx = $("#").val();
 		var order_addr1 = $("#ord_addr1").val();
 		var order_addr2 = $("#ord_addr2").val();
 		var order_addr3 = $("#ord_addr3").val();
 		var order_name = $("#ord_name").val();
 		var order_phone = $("#ord_phone").val();
 		var order_memo = $("#ord_memo").val();
 		
 		var opt_tb_idx = [];
 		var orderd_qty = [];
 		var orderd_price = [];
 		
 		var idxSize = $("input[name='opt_tb_idx']").length;
 		for( i=0; i< idxSize; i++){
 			opt_tb_idx.push($("input[name='opt_tb_idx']").eq(i).attr("value"));
 		}
 		for( i=0; i< idxSize; i++){
 			orderd_qty.push($("input[name='orderd_qty']").eq(i).attr("value"));
 		}
 		for( i=0; i< idxSize; i++){
 			orderd_price.push($("input[name='orderd_price']").eq(i).attr("value"));
 		}
 		console.log(orderd_qty);
 		console.log(orderd_price);
 		
 		var pay_type = 1;
 		var pay_price_real = $('input[id=ordPric]').val();
 		//var pay_price_deposit = $('input[id=ordPric]').val();
 		//var pay_deposit_name ;
 		//var pay_bank;
	
		
		const merchant_uid = generateOrderNumber();
		console.log("merchant_uid: " + merchant_uid);
		
		
		function requestPay() {
		  
			console.log("ㅇㅅㅇ"+$('input[id=ordPric]').val());
        	IMP.request_pay({
        		 pg : 'nice',
         	    pay_method : 'card',
         	    merchant_uid: merchant_uid, //상점에서 생성한 고유 주문번호
         	    name : ordName,
         	    amount : $('input[id=ordPric]').val(),
         	    buyer_email : memEmail,
         	    buyer_name : memName,
         	    buyer_tel : memPhone,
         	    buyer_addr : memAddr2,
         	    buyer_postcode : memAddr1,
         	    m_redirect_url : backUrl, // 예: https://www.my-service.com/payments/complete/mobile
         		niceMobileV2 : true // 신규 모바일 버전 적용 시 설정
        	}, function (rsp) { // callback
        		 if (rsp.success) {
        	            // 결제 성공시 처리 로직
        	            console.log("결제 성공창까지 넘어왔습니다.");
        	            var orderPointCal = $("#orderPointCal").val(); // orderPointCal 값을 가져옵니다.
        	            var ordPric = $("#ordPric").val(); // ordPric 값을 가져옵니다.
        	            var data = {
        	            		member_tb_idx : member_tb_idx,
        	        			coupon_tb_idx : coupon_tb_idx,
        	        			order_addr1 : order_addr1,
        	        			order_addr2 : order_addr2,
        	        			order_addr3 : order_addr3,
        	        			order_name : order_name,
        	        			order_phone : order_phone,
        	        			order_memo : order_memo,
        	        			opt_tb_idx : opt_tb_idx,
        	        			orderd_qty : orderd_qty,
        	        			orderd_price : orderd_price,
        	        			pay_type : pay_type,
        	        			pay_price_real : pay_price_real
        	            };
        	            updateSavedPoints(data);
        	        }
            });
        }
 
// 주문자 정보 동일 옮기기
$(document).ready(function(){
	$("#memAddrBtn").click(function(){
		$('input[id=ord_name]').attr('value',$("#mem_name").val());
		$('input[id=ord_phone]').attr('value',$("#mem_phone").val());
		$('input[id=ord_addr1]').attr('value',$("#mem_addr1").val());
		$('input[id=ord_addr2]').attr('value',$("#mem_addr2").val());
		$('input[id=ord_addr3]').attr('value',$("#mem_addr3").val());
	});
	
	$("#usePoint").change(function(){
		var num1 = $("#usePoint").val();
		var num2 = ${orderPrices};
		
		$.ajax({
			url : "priceCal.do",
			typt : 'get',
			data : { num1:num1, num2:num2},
			success : function(data){
				data1 = data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				$('#priCalResult').html(data1+"원");
				$('input[id=ordPric]').prop('value',data);
				console.log(data);
			}
		});
	});
});
$("#usePoint").change(function() {
	  var num1 = $("#usePoint").val();
	  var num2 = ${orderPrices};
	  var savePoint = $("#savePoint").val();
	  
	  // 사용한 포인트를 총 결제 금액에서 빼서 업데이트
	  var updatedPrice = num2 - parseInt(num1);
	  $('input[id=ordPric]').val(updatedPrice);

	  // 포맷팅된 새 결제 금액을 표시
	  var formattedUpdatedPrice = updatedPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	  $('#priCalResult').html(formattedUpdatedPrice + "원");

	  // 남은 포인트 계산
	  var remainingPoints = parseInt(savePoint) - parseInt(num1);
	  
	  // 포맷팅된 남은 포인트를 표시
	  var formattedRemainingPoints = remainingPoints.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	  $('p:contains("보유 적립금")').html("보유 적립금 : " + formattedRemainingPoints + "점");

	  $.ajax({
	    url : "priceCal.do",
	    typt : 'get',
	    data : { num1:num1, num2:num2},
	    success : function(data){
	      data1 = data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	      $('#priCalResult').html(data1+"원");
	      $('input[id=ordPric]').prop('value',data);
	      console.log(data);
	    }
	  });
	});
	
function updateSavedPoints(data) {
    var usedPoints = $("#usePoint").val();

    // AJAX 요청으로 서버에 결제 정보 전송
    $.ajax({
    	url : '<%=request.getContextPath()%>/prod/orderForm.do',
        type: 'POST',
        data: data,
        traditional: true,
        success: function(response) {
            // 서버 처리가 성공적으로 이루어졌을 때
            console.log('결제 및 포인트 처리 완료');
            alert('결제가 완료되었습니다.'); // 이 부분을 추가합니다.
            location.href = '<%=request.getContextPath()%>/'; // 결제 완료 후 이동할 페이지 URL을 입력하세요.
        },
        error: function() {
            // 서버 처리 중 오류 발생 시
            console.log('결제 및 포인트 처리 실패');
            alert('결제 처리에 문제가 발생했습니다. 관리자에게 문의하세요.');
        }
    });
}
</script>



<%@ include file="../include/foot.jsp" %>