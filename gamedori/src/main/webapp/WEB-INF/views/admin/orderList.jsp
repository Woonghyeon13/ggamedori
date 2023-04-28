<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>

<script>

	function updateOrderState(obj,idx){
	      $.ajax({
	        type: 'POST',
	        url: 'updateOrderState.do',
	        data: {
				order_state:obj.value
			   ,order_idx : idx
	        },
	        success: function() {
	          console.log('상태 업데이트 완료');
	          alert("상태 업데이트 완료");
	        },
	        error: function() {
	          console.log('상태 업데이트 실패');
	          alert("상태 업데이트 완료");
	        }
	      });
	}    
</script>

<main>
	<div class="container d-flex justify-content-center mt-2">
		<h3 class="fw-bold">관리자 페이지</h3>
	</div>
	<div class="container">
		<div class="container mt-5">
			<ul class="nav justify-content-center nav-fill nav-tabs text-black">
				<li class="nav-item">
					<!-- 선택시 클래스 fw-bold --> 
					<a class="nav-link text-reset active fw-bold" href="<c:url value='/admin/orderList.do' />">주문 관리</a>
				</li>
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/prod.do' />">상품 관리</a></li>
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/mainPageModify.do' />">화면 관리</a></li>
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/qaprod.do' />">문의/공지관리</a></li>
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/member.do' />">회원 관리</a></li>
			</ul>
		</div>
	</div>
	<!-- a/s 탭  -->
	<div class="container mt-4">
		<ul class="nav justify-content-end text-black">
			<li class="nav-item"><a class="nav-link text-reset active fw-bold" href="<c:url value='/admin/orderList.do' />">주문 내역</a></li>
			<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/asreturn.do' />">반품 관리</a></li>
			<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/asrefund.do' />">환불 관리</a></li>
		</ul>
	</div>
	
	<div class="container mt-1">
	
		<div class="container">
			<table class="table table-sm">
				<thead class="table-light">
					<tr>
						<th class="text-center">주문번호</th>
						<th class="text-center">주문자 이메일</th>
						<th class="text-center">주문자명</th>
						<th class="text-center">주문일</th>
						<th class="text-center">주문금액</th>
						<th class="text-center">주문상태</th>
						<th class="text-center">상세보기</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="olist" items="${orderList }">
					<tr>
						<td class="text-center">${olist.order_idx }</td>
						<td class="text-center">${olist.member_email }</td>
						<td class="text-center">${olist.member_name }</td>
						<td class="text-center">${olist.order_date }</td>
						<td class="text-center">${olist.pay_price_real }</td>
						<td class="text-center">
							<select class="form-select" onchange="updateOrderState(this,'${olist.order_idx }');">
								<option value="1" <c:if test="${olist.order_state == 1}">selected</c:if>>주문접수</option>
								<option value="2" <c:if test="${olist.order_state == 2}">selected</c:if>>결제완료</option>
								<option value="3" <c:if test="${olist.order_state == 3}">selected</c:if>>상품 준비중</option>
								<option value="4" <c:if test="${olist.order_state == 4}">selected</c:if>>발송 준비중</option>
								<option value="5" <c:if test="${olist.order_state == 5}">selected</c:if>>발송 완료</option>
								<option value="6" <c:if test="${olist.order_state == 6}">selected</c:if>>주문 취소</option>
							</select>
						</td>
						<td class="text-center">
							<button type="button" class="btn btn-secondary btn-sm"
								data-bs-toggle="modal" data-bs-target="#orderdetail">상세보기</button>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>

		<!-- 주문 상세 모달창-->
		<div class="modal fade" id="orderdetail">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header d-flex flex-column logo">
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						<h4 class="modal-title fs-5">주문내역 상세보기</h4>
					</div>
					<div class="modal-body">
						<div class="row container m-0">
							<p class="mb-0 col p-0">주문번호 : 12345678</p>
							<p class="mb-0 col text-end p-0">주문일자 : 2023-03-27</p>
						</div>
						<div class="container mt-4">
							<div>
								<h5>주문 정보</h5>
							</div>
							<hr>
							<div class="row">
								<div id="p_left" class="col-3">
									<img src="<c:url value='/images/mario.png'/>" style="width:85px; height:85px;">
								</div>
								<div id="p_right" class="col-9">
									<p>닌텐도 스위치 마리오 + 래비드 반짝이는 희망 은하계 에디션</p>
									<div class="row">
										<p class="col">가격 : 64800원</p>
										<p class="col">주문 수량 : 1개</p>
									</div>
								</div>
							</div>
						</div>
						<div class="container mt-4">
							<div>
								<h5>배송지 정보</h5>
							</div>	
							<hr>
							<table class="table">
								<tbody>
									<tr>
										<td class="col-2" style="color: #8f8f8f;">수령인</td>
										<td class="col-8" style="border-bottom: 0px">
											[이름 표시 ex ) 홍길동 ]
										</td>
									</tr>
									<tr>
										<td class="col-2" style="color: #8f8f8f;">연락처</td>
										<td class="col-8" style="border-bottom: 0px">
											[연락처 표시] ex ) 010-0000-0000 ]
										</td>
									</tr>
									<tr>
										<td class="col-2" style="color: #8f8f8f;">배송지</td>
										<td class="col-8" style="border-bottom: 0px">
											[주소 표시 ex ) 전라북도 전주시 덕진구 백제대로 572 5층 이젠컴퓨터학원 ]
										</td>
									</tr>
									<tr>
										<td class="col-2" style="color: #8f8f8f;">배송 메모</td>
										<td class="col-8" style="border-bottom: 0px">
											[메모 표시 ex ) 부재시 경비실에 맡겨주세요. ]
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<div class="container mt-4">
							<div class="row">
								<h5 class="col mb-0">최종 주문 금액</h5>
								<p class="col text-end mb-0 fs-5" style="color: #ee4a44;">77,777원</p>
							</div>
							<hr>
							<table class="table">
								<tr>
									<td style="color: #8f8f8f;">상품 금액</td>
									<td style="text-align: right">64,800원</td>
								</tr>
								<tr>
									<td style="color: #8f8f8f;">배송비</td>
									<td style="text-align: right">0원</td>
								</tr>
								<tr>
									<td style="color: #8f8f8f;">적립금 사용</td>
									<td style="text-align: right">100원</td>
								</tr>
								<tr>
									<td style="color: #8f8f8f;">결제 수단</td>
									<td style="text-align: right">신한카드 / 일시불</td>
								</tr>
							</table>
						</div>
				
						<div class="container mt-4">
							<div>
								<h5>포인트 혜택</h5>
							</div>
							<hr>
							<table class="table">
								<tr>
									<td style="color: #8f8f8f;">구매 적립</td>
									<td style="text-align: right">648원</td>
								</tr>
							</table>
						</div>
						
					</div>
				</div>
			</div>
		</div>

		
</main>


<%@ include file="../include/foot.jsp" %>