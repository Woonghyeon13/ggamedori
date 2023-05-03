<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ include file="../include/head.jsp" %>
<main>

	<!-- 주문상품 전체보기 ------------------------------------------------------ -->
	<div class="container mypage_inner">
		<h4>주문 상품 전체보기</h4>
			<div id="mypage_1" class="col">
				<ul>
					<li>
						<h4>등급</h4>
						<p>
						<c:choose>
							<c:when test="${level == 1}">
							    <c:out value="브론즈" />
							</c:when>
							<c:when test="${level == 2}">
							    <c:out value="실버" />
							 </c:when>
							 <c:when test="${level == 3}">
							    <c:out value="골드" />
							 </c:when>
							 
						</c:choose>
						</p>
					</li>
					<li>
						<h4>적립금</h4>
						<fmt:formatNumber var="savePointt" value="${savePoint}" pattern="#,###"/>
						<p>${savePointt}원</p> <a href="<c:url value='/mypage/point.do' />">적립금 확인 > </a>
						<!--s_money_check.html -->
					</li>
					<li>
						<h4>쿠폰</h4>
						<p> <c:out value="${CouponCount}"/>개</p> <a href="<c:url value='/mypage/coupon.do' />">쿠폰 확인 > </a> <!-- coupon_check.html -->
					</li>
					<li>
						<h4>나의 후기</h4>
						<p><c:out value="${ReviewCount}"/>개</p> <a href="<c:url value='/mypage/reviewlist.do' />">후기 확인 > </a> <!-- review_list.html -->
					</li>
				</ul>
			</div>
		<div id="mypage_inner2" class="container">
			<div id="mypage_list" class="col-3">
				<p id="nickname">
					<strong>${sessionScope.Login.member_name}</strong>님 환영합니다.
				</p>

				<ol id="ol_li" class="list-group">
					<li class="list-group-item"><a href="<c:url value='/mypage/cart.do' />">장바구니</a></li>
					<li class="list-group-item"><a href="<c:url value='/mypage/prodqa.do' />">상품문의</a></li>
					<li class="list-group-item"><a href="<c:url value='/mypage/prodlist.do' />">주문내역</a></li>
					<li class="list-group-item"><a href="<c:url value='/mypage/oto.do' />">1 : 1문의</a></li>
					<li class="list-group-item"><a href="<c:url value='/mypage/reviewlist.do' />">나의
							후기</a></li>
					<!-- review_list.html -->
					<li class="list-group-item"><a href="<c:url value='/user/modify.do' />">회원정보수정</a></li>
					<li class="list-group-item"><a href="<c:url value='/user/withdraw.do' />">탈퇴하기</a></li>
					<!-- unregister.html -->
				</ol>
			</div>
			<div id="product_inner" class="col-8">
				<p>
					<strong>${sessionScope.Login.member_name}</strong>님의 주문내역
				</p>
				<table id="product_t" class="table table-hover text-center"
					style="width: 100%; border-top: 1px solid #000;">
					<thead>
						<tr>
							<th scope="col">주문 상태</th>
							<th scope="col">상품 이미지</th>
							<th scope="col">상품명</th>
							<th scope="col">주문 일자</th>
							<th style="width:12%;" scope="col">주문 상세</th>
							<th style="width:12%;" scope="col">리뷰작성</th>
							<th style="width:12%;" scope="col">구매확정</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="Orderlist" items="${list}">
						<tr>
							<td class="align-middle">
							<c:choose>
								<c:when test="${Orderlist.order_state == 1}">
								    <c:out value="주문접수" />
								</c:when>
								<c:when test="${Orderlist.order_state == 2}">
								    <c:out value="결제완료" />
								 </c:when>
								 <c:when test="${Orderlist.order_state == 3}">
								    <c:out value="상품준비중" />
								 </c:when>
								 <c:when test="${Orderlist.order_state == 4}">
								    <c:out value="발송준비중" />
								 </c:when>
								 <c:when test="${Orderlist.order_state == 5}">
								    <c:out value="배송완료" />
								 </c:when>
								 <c:when test="${Orderlist.order_state == 6}">
								    <c:out value="주문취소" />
								 </c:when>
								 <c:when test="${Orderlist.order_state == 10}">
								    <c:out value="주문취소접수" />
								 </c:when>
								 <c:when test="${Orderlist.order_state == 7}">
								    <c:out value="반품접수" />
								 </c:when>
								 <c:when test="${Orderlist.order_state == 8}">
								    <c:out value="반품완료" />
								 </c:when>
								 <c:when test="${Orderlist.order_state == 9}">
								    <c:out value="구매확정" />
								 </c:when>
							</c:choose>
							</td>
							<td class="align-middle">
								<img style="width:85px; height:85px;" src="<c:url value='/images/${Orderlist.prod_imgt}' />">
							</td>
							<td class="align-middle">${Orderlist.prod_name}</td>
							<td class="align-middle">${fn:substring(Orderlist.order_date,0,10)}</td>
							<td class="align-middle"><button type="button" class="btn btn-outline-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#orderdetail">상세보기</button></td>
							<td class="align-middle">
								<input type="hidden" id="prodIdx" value="${Orderlist.prod_idx}">
								<button id="clickBtn" type="button" class="btn btn-outline-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#review">리뷰작성</button>
							</td>
							<td class="align-middle">
								<input type="hidden" id="order_idx" value="${Orderlist.order_idx}">
								<input type="hidden" id="member_idx" value="${Login.member_idx}">
								<input type="hidden" id="savept_amount" value="${Orderlist.order_usepoint}">
								<c:if test="${Orderlist.order_state == 9}">
									구매확정<br/>완료
								</c:if>
								<c:if test="${Orderlist.order_state ne 9}">
									<button onclick="savePoint()" type="button" class="btn btn-outline-secondary btn-sm">구매확정</button>
								</c:if>
							</td>
						</tr>
					</c:forEach>
					</tbody>
					</div>
					<!-- end:#product_inner -->
				</table>

				<div id="paging" class="container">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center text-black">
							<li class="page-item"><a class="page-link text-reset"
								href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item"><a class="page-link text-reset"
								href="#">1</a></li>
							<li class="page-item"><a class="page-link text-reset"
								href="#">2</a></li>
							<li class="page-item"><a class="page-link text-reset"
								href="#">3</a></li>
							<li class="page-item"><a class="page-link text-reset"
								href="#">4</a></li>
							<li class="page-item"><a class="page-link text-reset"
								href="#">5</a></li>
							<li class="page-item"><a class="page-link text-reset"
								href="#">6</a></li>
							<li class="page-item"><a class="page-link text-reset"
								href="#">7</a></li>
							<li class="page-item"><a class="page-link text-reset"
								href="#">8</a></li>
							<li class="page-item"><a class="page-link text-reset"
								href="#">9</a></li>
							<li class="page-item"><a class="page-link text-reset"
								href="#">10</a></li>
							<li class="page-item"><a class="page-link text-reset"
								href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>

			</div>
			<!-- end:#mypage_inner2 -->
		</div>
		<!-- end:#mypage_inner -->
		<!---------리뷰작성 모달------------------------------------------------------------------->
		<div class="modal fade" id="review">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header d-flex flex-column logo">
						<div class="mt-2">
							<h4 class="modal-title fs-5">리뷰 작성</h4>
						</div>
					</div>
					<div class="modal-body">
						<form name="review_reg" method="post" action="reviewInsert.do" enctype="multipart/form-data">
							<div class="form-group">
								<input type="text" class="form-control" id="review_title" placeholder="제목" name="review_title">
								<input type="hidden" id="starShot" name="review_star">
								<input type="hidden" name="product_tb_idx" id="product_tb_idx">
								<input type="hidden" name="member_tb_idx" value="${Login.member_idx}">
							</div>
							<div class="form-group mt-2 col">
								<textarea class="form-control h-25" rows="10" id="review_contents" placeholder="내용" name="review_contents"></textarea>
							</div>
								<div class="form-group mt-2 d-flex justify-content-between align-items-center">
								  <div class="starCntVt">
								    <div class="starRating-wrapVt">
								      <div id="starCenterVt">
								        <fieldset class="starRatingVt">
								          <input type="radio" name="starPoint" id="star5" value="10" /><label for="star5" class="full" title="Awesome"></label>
								          <input type="radio" name="starPoint" id="star4.5" value="9" /><label for="star4.5" class="half"></label>
								          <input type="radio" name="starPoint" id="star4" value="8"/><label for="star4" class="full"></label>
								          <input type="radio" name="starPoint" id="star3.5" value="7"/><label for="star3.5" class="half"></label>
								          <input type="radio" name="starPoint" id="star3" value="6"/><label for="star3" class="full"></label>
								          <input type="radio" name="starPoint" id="star2.5" value="5"/><label for="star2.5" class="half"></label>
								          <input type="radio" name="starPoint" id="star2" value="4"/><label for="star2" class="full"></label>
								          <input type="radio" name="starPoint" id="star1.5" value="3"/><label for="star1.5" class="half"></label>
								          <input type="radio" name="starPoint" id="star1" value="2"/><label for="star1" class="full"></label>
								          <input type="radio" name="starPoint" id="star0.5" value="1"/><label for="star0.5" class="half"></label>
								        </fieldset>
								      </div>
								    </div>
								  </div>
								</div>
							<div class="form-group mt-2">
								<div class="input-group mb-3">
									<input type="file" class="form-control" id="inputGroupFile02" name="prod_file1">
									<label class="input-group-text" for="inputGroupFile02">Upload</label>
								</div>
							</div>
							<div class="d-grid gap-1 mt-2">
								<input type="submit" class="btn btn-outline-light login btn-lg form-control">
							</div>
							<script>
							$(document).on("click", "input[name=starPoint]", function () {
									i = $(this).val();
									console.log("별임"+i);
									$('input[id=starShot]').val(i);
								});
							</script>
						</form>
					</div>
				</div>
			</div>
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
<script>
$(document).on("click", "button[id=clickBtn]", function () {

	var prodIdxx = $(this).prev().val();
	console.log("상품번홍"+prodIdxx);
	$("#product_tb_idx").val(prodIdxx);
})

function savePoint(){
	
	var order_idx = $("#order_idx").val();
	var member_tb_idx = $("#member_idx").val();
	var savept_amount = $("#savept_amount").val();
	$.ajax({
		url : '<%=request.getContextPath()%>/mypage/savePoint.do',
		type : 'POST',
		data : {
			member_tb_idx : member_tb_idx,
			savept_amount : savept_amount,
			order_idx : order_idx
		},
		success : function(data){
			alert("구매확정 되었습니다.");
			document.location.reload();
		}
	});
};
</script>


<%@ include file="../include/foot.jsp" %>