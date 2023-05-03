<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	
	// 주문 상세정보 모달창 열기
   	function orderdetailToModal(idx) {
	    var orderIdx = idx;
	     $.ajax({
	       type: 'POST',
	       url: 'adminOrderDetail.do',
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
			<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/asrefund.do' />">환불 관리</a></li>
		</ul>
	</div>
	
	<div class="container mt-1">
	
		<div class="container">
			<table class="table table-sm">
				<thead class="table-light">
					<tr>
						<th class="text-center align-middle">주문번호</th>
						<th class="text-center align-middle">주문자 이메일</th>
						<th class="text-center align-middle">주문자명</th>
						<th class="text-center align-middle">주문일</th>
						<th class="text-center align-middle">주문금액</th>
						<th class="text-center align-middle">주문상태</th>
						<th class="text-center align-middle">상세보기</th>
					</tr>
				</thead>
				<tbody id = "table-body" >
				<c:forEach var="olist" items="${orderList }">
					<tr>
						<td class="text-center align-middle">${olist.order_idx }</td>
						<td class="text-center align-middle">${olist.member_email }</td>
						<td class="text-center align-middle">${olist.member_name }</td>
						<td class="text-center align-middle">${olist.order_date }</td>
						<td class="text-center align-middle">${olist.pay_price_real }</td>
						<td class="text-center align-middle">
							<select class="form-select" onchange="updateOrderState(this,'${olist.order_idx }');">
								<option value="1" <c:if test="${olist.order_state == 1}">selected</c:if>>주문접수</option>
								<option value="2" <c:if test="${olist.order_state == 2}">selected</c:if>>결제완료</option>
								<option value="3" <c:if test="${olist.order_state == 3}">selected</c:if>>상품 준비중</option>
								<option value="4" <c:if test="${olist.order_state == 4}">selected</c:if>>발송 준비중</option>
								<option value="5" <c:if test="${olist.order_state == 5}">selected</c:if>>발송 완료</option>
								<option value="6" <c:if test="${olist.order_state == 6}">selected</c:if>>주문 취소</option>
								<option value="10" <c:if test="${olist.order_state == 10}">selected</c:if>>주문 취소 접수</option>
							</select>
						</td>
						<td class="text-center align-middle">
							<button type="button" class="btn btn-secondary btn-sm"
								data-bs-toggle="modal" data-bs-target="#orderdetail" 
								onclick="orderdetailToModal('${olist.order_idx}')">상세보기</button>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
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

		<!-- 검색 -->
	<div class="container">
	    <form class="d-flex justify-content-center align-items-center" role="form">
	        <div class="me-2">
	            <select class="form-select" name="searchOption" aria-label="검색 옵션" style="width: 150px;">
	                <option disabled style="background-color: #f2f2e7;">검색 옵션</option>
	                <option value="name" selected>주문자명 </option>
	                <option value="idx">주문 번호</option>
	            </select>
	        </div>
	        <div class="me-2">
	            <input class="form-control form-control-sm" type="text" placeholder="제목"  name="searchText"aria-label=".form-control-sm example">
	        </div>
	        <div>
	            <button type="submit" class="btn btn-dark btn_search">검색</button>
	        </div>
	    </form>
	</div>

</main>


<%@ include file="../include/foot.jsp" %>