<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
<main>
	<h3 class="mt-4 mb-3 text-center container" style="font-weight: bold; padding-top: 100px; padding-bottom: 50px;">주문서</h3>
	<section id="join_Main" class="d-flex p-2 " >
	<div id="join_box" class="container" >
		<div class="input-form-backgroud row">
		  <div class="input-form col-md-12">
			<h4 class="mb-3">주문하신분</h4><hr/>
			<form class="validation-form" novalidate>
			  <div class="row">
				<div class="col-md-6 mb-3">
					<label for="MEMBER_NAME">이름</label>
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
			 	<input value="${adr.addr_1}" type="text" class="form-control col-md-6 input_s" id="mem_addr1" placeholder="우편번호">
				 <input type="button" class="btn btn-outline-secondary btn-sm" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
				<br/>
				<label for="ADDR_2" class="mt-3">주소</label>
				<input value="${adr.addr_2}" type="text" class="form-control col-md-6 input_s" id="mem_addr2" placeholder="주소">
				<br>
				<input value="${adr.addr_3}" type="text" class="form-control col-md-6 input_s" id="mem_addr3" placeholder="상세주소">
			<!----------------------------------------------------------------------------------------------------------------------------->
				<div id="orderpage_Recipient">
					<h4 class="mb-3" >받으시는분  <span style="font-size: 14px; color: rgb(168, 168, 168);"><input id="memAddrBtn" type="checkbox"> 주문자와 동일</span> </h4><hr/>
					<form name="orderfrm" action="orderForm.do" method="post" class="validation-form">
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
					<input type="text" name="order_addr1" class="form-control col-md-6 input_s" id="ord_addr1" placeholder="우편번호" required>
					<input type="button" class="btn btn-outline-secondary btn-sm" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
					<div class="invalid-feedback mb-3">
						우편번호를 입력해주세요
					</div><br/>
					<label for="ADDR_2" class="mt-3">*배송지 주소</label>
					<input type="text" name="order_addr2" class="form-control col-md-6 input_s" id="ord_addr2" placeholder="주소" required>
					<div class="invalid-feedback mt-3">
						주소를 입력해주세요
					</div>
					<br>
					<input type="text" name="order_addr3" class="form-control col-md-6 mb-3 input_s" id="ord_addr3" placeholder="상세주소">
					<label for="ordermemo">배송메모</label><br>
					<input class="form-control" type="textarea" name="order_memo" id="ordermemo" style="width: 475px; height: 40px;">
				</div>
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
								document.getElementById('ADDR_1').value = data.zonecode;
								document.getElementById("ADDR_2").value = addr;
								// 커서를 상세주소 필드로 이동한다.
								document.getElementById("ADDR_3").focus();
							}
						}).open();
					}
				</script>
			<br/>
			  <div class="mb-4"></div>
			</form>
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
						<tr class="table-light text-center" style="border-bottom:1px solid #bdbdbd;">
							<td><img src="./images/HOT1.jpg" style="width: 100px; height: 100px;"></td>
							<td class="pbb3">
								<p>${pvo.prod_name}</p><br>
								<p>제품선택 : [선택사항 적어넣으세요] (+[갯수])</p>
							</td>
							<td class="pbb3">${pvo.prod_price}</td>
							<td class="pbb3">[수량]</td>
						</tr>

						<tr class="pbb" >
							<td class="pbb2">총 상품구매금액</td>
							<td colspan="3">[ㅁ]원</td>
						</tr>
						<tr class="pbb">
							<td class="pbb2">배송비</td>
							<td colspan="3">3,000원</td>
						</tr>
						<tr class="pbb" style="border-bottom:1px solid #bdbdbd;">
							<td class="pbb2">적립금</td>
							<td colspan="3">[ㅁ]원</td>
						</tr>
						<tr class="pbb" style="height: 80px; vertical-align: middle;">
							<td class="pbb2">총 결제금액</td>
							<td colspan="3">[ㅁ]원</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="orderForm_rufwp">
				<h4 class="mb-1" style="font-weight: bold;">포인트 사용</h4>
				<input type="text" style="width:600px;" class="mt-3">
				<p style="font-size: 14px;">보유 적립금(**점)중 <b>최대 **점</b>까지 사용 가능(100단위로 입력)</p>
				<h4 class="mb-3" style="font-weight: bold;">결제</h4>
				<hr/>
				<h5 style="font-size: 20px; font-weight: bold;">결제수단    <span class="badge bg-success">신용카드</span></h5>
			</div>

			<div class="d-grid gap-2">
				<button class="btn btn-danger btn-block mt-4" type="submit" style="font-weight: bold">주문하기</button>
			</div>
		</div>
	</section>
</main>

<script>
// 주문자 정보 동일 옮기기
$(document).ready(function(){
	$("#memAddrBtn").change(function(){
		$('input[id=ord_name]').attr('value',$("#mem_name").val());
		$('input[id=ord_phone]').attr('value',$("#mem_phone").val());
		$('input[id=ord_addr1]').attr('value',$("#mem_addr1").val());
		$('input[id=ord_addr2]').attr('value',$("#mem_addr2").val());
		$('input[id=ord_addr3]').attr('value',$("#mem_addr3").val());
	});
});

	window.addEventListener('load', () => {
	  const forms = document.getElementsByClassName('validation-form');
	
	  Array.prototype.filter.call(forms, (form) => {
		form.addEventListener('submit', function (event) {
		  if (form.checkValidity() === false) {
			event.preventDefault();
			event.stopPropagation();
		  }
		  form.classList.add('was-validated');
		}, false);
	  });
	}, false);
</script>


<%@ include file="../include/foot.jsp" %>