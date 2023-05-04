<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ include file="../include/head.jsp" %>

<style>
.ck.ck-editor {
	width:100%;
}
.ck-editor__editable {
	 min-height: 20vw;
}
</style>

<script>
	//주문 상세정보 모달창 열기
	function orderdetailToModal(idx) {
	var orderIdx = idx;
	 $.ajax({
	   type: 'POST',
	   url: 'orderDetail.do',
	   data: { 'order_idx': orderIdx },
	   success: function(data) {
		   
		   var html = "";
		   
		   		html += '<div class="row container m-0">'
		   		html += '<div class="col mb-0 p-0">'
		   		html += '<p class="mb-0 p-0">주문번호: &nbsp; '+data[0].order_idx+'</p>'
		   		html += '</div>'
		   		html += '<div class="col mb-0 p-0">'
		   		html += '<p class="mb-0 col text-end p-0">주문일자: &nbsp; '+data[0].order_date+'</p>'
		   		html += '</div>'
		   		html += '</div>'
		   		
		   		html += '<div class="container mt-4">'	    	   		
		   		html += '<div>'
		   		html += '<h5>주문 정보</h5>'
		   		html += '</div>'
		   		html += '<hr>'
		   	for (var i = 0; i < data.length; i++) {
		   		html += '<div class="row mb-3">'
		   		html += '<div id="p_left" class="col-3">'
		   		html += '<img src="<c:url value="/images/' + data[i].prod_imgt + '" />" style="width:85px; height:85px;">';
		   		html += '</div>'
		   		html += '<div id="p_right" class="col-9 mt-2">'
		   		html += '<p>'+data[i].prod_name+'</p>'
		   		html += '<div class="row">'
		   		html += '<p class="col">가격: &nbsp'+data[i].opt_price+'원</p>'
		   		html += '<p class="col">주문 수량: &nbsp'+data[i].orderd_qty+'개</p>'		   		
		   		html += '</div>'
		   		html += '</div>'
		   		html += '</div>'
		   	}
		   		html += '</div>'
		   		
		   		html += '<div class="container mt-4">'
		   		html += '<div>'
		   		html += '<h5>배송지 정보</h5>'
		   		html += '</div>'
		   		html += '<hr>'
		   		html += '<table class="table">'
		   		html += '<tbody>'
		   		html += '<tr>'
		   		html += '<td class="col-2" style="color: #8f8f8f;">수령인</td>'
		   		html += '<td class="col-8" style="border-bottom: 0px">'+data[0].member_name+'</td>'
		   		html += '</tr>'
		   		html += '<tr>'
		   		html += '<td class="col-2" style="color: #8f8f8f;">연락처</td>'
		   		html += '<td class="col-8" style="border-bottom: 0px">'+data[0].member_phone+'</td>'
		   		html += '</tr>'
		   		html += '<tr>'
		   		html += '<td class="col-2" style="color: #8f8f8f;">배송지</td>'
		   		html += '<td class="col-8" style="border-bottom: 0px">('+data[0].order_addr1+')&nbsp; '+data[0].order_addr2+ data[0].order_addr3+'</td>'
		   		html += '</tr>'
		   		html += '<tr>'
		   		html += '<td class="col-2" style="color: #8f8f8f;">배송 메모</td>'
		   	if(data[0].order_memo == null){	    	   		
		   		html += '<td class="col-2" style="border-bottom: 0px">-</td>'
		   	}else{	    	   		
		   		html += '<td class="col-2" style="border-bottom: 0px">'+data[0].order_memo+'</td>'
		   	}
		   		html += '</tr>'
		   		html += '</tbody>'
		   		html += '</table>'
		   		html += '</div>'
		   		
		   		html += '<div class="container mt-4">'
		   		html += '<div class="row">'
		   		html += '<h5 class="col mb-0">최종 주문 금액</h5>'
		   		html += '<p class="col text-end mb-0 fs-5" style="color: #ee4a44;">'+data[0].pay_price_real+'원</p>'
		   		html += '</div>'
		   		html += '<hr>'
		   		html += '<table class="table">'
		   		html += '<tr>'
		   		html += '<td style="color: #8f8f8f;">상품 금액</td>'
		  
		   	var j =0;
		   	for (var i = 0; i < data.length; i++){	    	   		
				j = j + data[i].opt_price * data[i].orderd_qty;
		   	}
		   		html += '<td style="text-align: right">'+j+'원</td>'
		   		
		   		html += '</tr>'
		   		html += '<tr>'
		   		html += '<td style="color: #8f8f8f;">배송비</td>'
		   		html += '<td style="text-align: right">3000원</td>'
		   		html += '</tr>'
		   		html += '<tr>'
		   		html += '<td style="color: #8f8f8f;">적립금 사용</td>'
		   		html += '<td style="text-align: right">'+data[0].order_usepoint+'원</td>'
		   		html += '</tr>'
		   		html += '<tr>'
		   		html += '<td style="color: #8f8f8f;">결제 수단</td>'
		   		html += '<td style="text-align: right">신용카드 / 일시불</td>'
		   		html += '</tr>'
		   		html += '</table>'
		   		html += '</div>'
		   		
		   		html += '<div class="container mt-4">'
		   		html += '<div>'
		   		html += '<h5>포인트 혜택</h5>'
		   		html += '</div>'
		   		html += '<hr>'
		   		html += '<table class="table">'
		   		html += '<tr>'
		   		html += '<td style="color: #8f8f8f;">구매 적립</td>'
		   		html += '<td style="text-align: right">'+(data[0].pay_price_real/10)+'원</td>'
		   		html += '</tr>'
		   		html += '</table>'
		   		html += '</div>'
		   	
	
	        $('#orderdetail .modal-body ').html(html);
	        
	        // 모달창 열기
	        $('#orderdetail').modal('show');
	    
	   },
	   error: function() {
	     alert('서버 오류가 발생했습니다.');
	   }
	 });
	}

	
	function sessionToModal(idx){
		  // 세션 값 가져오기
		  var order_idx = idx;	  

		  // input 태그에 세션 값 할당
		  document.getElementById('orderIdx').value = order_idx;

		}
</script>

<main>

	<!-- 주문상품 전체보기 ------------------------------------------------------ -->
	<div class="container mypage_inner">
		<h4>주문 상품 전체보기</h4>
			<div id="mypage_1" class="ms-0 me-0">
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
		<div id="mypage_inner2" class="container row">
			<div id="mypage_list" class="col-3 p-0">
				<p id="nickname">
					<strong>${sessionScope.Login.member_name}</strong>님 환영합니다.
				</p>

				<ol id="ol_li" class="list-group">
					<li class="list-group-item"><a href="<c:url value='/mypage/cart.do' />">장바구니</a></li>
					<li class="list-group-item"><a href="<c:url value='/mypage/prodqa.do' />">상품문의</a></li>
					<li class="list-group-item"><a href="<c:url value='/mypage/prodlist.do' />">주문내역</a></li>
					<li class="list-group-item"><a href="<c:url value='/mypage/oto.do' />">1 : 1문의</a></li>
					<li class="list-group-item"><a href="<c:url value='/mypage/reviewlist.do' />">나의 후기</a></li>
					<!-- review_list.html -->
					<li class="list-group-item"><a href="<c:url value='/user/modify.do' />">회원정보수정</a></li>
					<li class="list-group-item"><a href="<c:url value='/user/withdraw.do' />">탈퇴하기</a></li>
					<!-- unregister.html -->
				</ol>
			</div>
			<div id="product_inner" class="col-9 p-0">
				<p>
					<strong>${sessionScope.Login.member_name}</strong>님의 주문내역
				</p>
				<table id="product_t" class="table table-hover text-center"
					style="width: 100%; border-top: 1px solid #000;">
					<thead>
						<tr>
							<th scope="col">주문상태</th>
							<th scope="col">상품이미지</th>
							<th scope="col">상품명</th>
							<th scope="col">주문 일자</th>
							<th style="width:10%;" scope="col">주문 상세</th>
							<th style="width:10%;" scope="col">리뷰작성</th>
							<th style="width:10%;" scope="col">구매확정</th>
							<th style="width:10%;" scope="col">환불신청</th>
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
							<td class="align-middle">
								<button type="button" class="btn btn-outline-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#orderdetail" onclick="orderdetailToModal('${Orderlist.order_idx}')">상세보기</button>
							</td>
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
							<td class="align-middle">
								<button id="clickBtn" type="button" class="btn btn-outline-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#refund"
								onclick="sessionToModal('${Orderlist.order_idx}')">환불신청</button>
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
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						<h4 class="modal-title fs-5">리뷰 작성</h4>
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
				<div class="modal-dialog modal-dialog-centered modal-lg">
					<div class="modal-content" id="modal-content">
						<div class="modal-header d-flex flex-column logo">
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							<h4 class="modal-title fs-5">주문내역 상세보기</h4>
						</div>
						<div class="modal-body" id="orderdetailContents">
						
						</div>
					</div>
				</div>
			</div>
			
	<c:set var="sessionOrderIdx" scope="session" value="${sessionScope.orderIdx}" />		
		<!-- 환불신청 모달창-->
		<div class="modal fade" id="refund">
			<div class="modal-dialog modal-dialog-centered modal-lg">
				<div class="modal-content" id="modal-content">
					<div class="modal-header d-flex flex-column logo">
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						<h4 class="modal-title fs-5">환불신청</h4>
					</div>
					<div class="modal-body">
						<form name="applyRefund" method="post" action="applyRefund.do" enctype="multipart/form-data">
							<input type="hidden" id="orderIdx" name="order_idx">
							<div class="form-group mt-2 d-flex flex-column justify-content-center align-items-center">
								<textarea id="refundContents" name="refund_contents" placeholder="환불 사유를 적어주세요" class="form-control"></textarea>
								<script>
									//ck에디터 적용 및 한글 설정, 내용 없을 시에 submit막기까지 구현
									let editor;
	
									ClassicEditor.create(document.querySelector('#refundContents'), {
									  language: 'ko'
									}).then(newEditor => {
									  editor = newEditor;
									  
									  editor.model.document.on('change:data', () => {
									    const textareaValue = editor.getData().trim();
									    const submitBtn = document.querySelector('input[type="submit"]');
	
									    if (textareaValue === '') {
									      submitBtn.disabled = true;
									    } else {
									      submitBtn.disabled = false;
									    }
									  });
									}).catch(error => {
									  console.error(error);
									});
	
									document.querySelector('form').addEventListener('submit', event => {
									  const textareaValue = editor.getData().trim();
	
									  if (textareaValue === '') {
									    event.preventDefault();
									    alert('내용을 입력해주세요.');
									  }
									});			
									
								</script>
							</div>
							<div class="mt-3 mb-2">
								<p class="mb-0">환불하실 제품의 이미지를 첨부해주세요.</p>
							</div>
							<div class="input-group">
								<input name="refund_img_file" type="file" class="form-control" id="refund_img_file">
							</div>
							<div class="d-flex gap-1 mt-4">
								<input type="submit" class="btn btn-outline-secondary btn-lg form-control" value="등록">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
</main>
<script>
$(document).on("click", "button[id=clickBtn]", function () {

	var prodIdxx = $(this).prev().val();
	console.log("상품번호"+prodIdxx);
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