<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>

<script>

		function updateRefundYN(obj,idx){
		    $.ajax({
		      type: 'POST',
		      url: 'updateRefundYN.do',
		      data: {
					refund_yn:obj.value
				   ,refund_idx : idx
		      },
		      success: function() {
		        console.log('업데이트 완료');
		        alert("업데이트 완료");
		      },
		      error: function() {
		        console.log('업데이트 실패');
		        alert("업데이트 완료");
		      }
		    });
		}    

	function sessionToModal(ridx, oidx, prodName, contents, name, img){
	  // 세션 값 가져오기
	  var refundIdx = ridx;
	  var orderIdx = oidx;
	  var prodName = prodName;
	  var Contents = contents;
	  var memberName = name;
	  var refundImg = img;

	  var imgUrl = "<c:url value='/images/carousel/" + refundImg + "'/>";
	  
	  // input 태그에 세션 값 할당
	  document.getElementById('refundIdx').value = refundIdx;
	  document.getElementById('orderIdx').value = orderIdx;
	  document.getElementById('prodName').value = prodName;
	  document.getElementById('Contents').value = Contents;
	  document.getElementById('memberName').value = memberName;
	  document.getElementById('refundImg').src = imgUrl;

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
			<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/orderList.do' />">주문 내역</a></li>
			<li class="nav-item"><a class="nav-link text-reset active fw-bold" href="<c:url value='/admin/asrefund.do' />">환불 관리</a></li>
		</ul>
	</div>
	<div class="container mt-1">
	
		<div class="container">
			<table class="table table-sm">
				<thead class="table-light">
					<tr>
						<th class="text-center align-middle">번호</th>
						<th class="text-center align-middle">주문번호</th>
						<th class="text-center align-middle">상품명</th>
						<th class="text-center align-middle">주문자 이메일</th>
						<th class="text-center align-middle">주문자명</th>
						<th class="text-center align-middle">환불신청일</th>
						<th class="text-center align-middle">처리상태</th>
						<th class="text-center align-middle">상세보기</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="rlist" items="${refundlist }">
					<tr>
						<td class="text-center align-middle">${rlist.refund_idx }</td>
						<td class="text-center align-middle">${rlist.order_idx }</td>
						<td class="text-center align-middle">${rlist.prod_name }</td>
						<td class="text-center align-middle">${rlist.member_email }</td>
						<td class="text-center align-middle">${rlist.member_name }</td>
						<td class="text-center align-middle">${rlist.refund_date }</td>
						<td class="text-center align-middle">
							<select class="form-select" onchange="updateRefundYN(this,'${rlist.refund_idx }');">
								<option value="1" <c:if test="${rlist.refund_yn == 1}">selected</c:if>>승인</option>
								<option value="2" <c:if test="${rlist.refund_yn == 2}">selected</c:if>>거절</option>
								<option value="3" <c:if test="${rlist.refund_yn == 3}">selected</c:if>>대기중</option>
							</select>
						</td>
						<td class="text-center align-middle">
							<button type="button" class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#prodRefund"
							onclick="sessionToModal('${rlist.refund_idx }', '${rlist.order_idx }', '${rlist.prod_name }',
									 '${rlist.contentWithoutTag }', '${rlist.member_name }', '${rlist.refund_img }')">상세보기
							</button>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>


		<!-- 환불 관리 -->
		<div class="modal fade" id="prodRefund">
			<div class="modal-dialog modal-dialog-centered modal-lg">
				<div class="modal-content">
					<div class="modal-header d-flex flex-column logo">
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						<h4 class="modal-title fs-5">환불 관리</h4>
					</div>
					<div class="modal-body">
							<div class="form-group">
								<label for="refundIdx">환불 번호: </label>
								<input type="text" id="refundIdx" name="refundIdx" style="border:0 solid black;" readonly>
							</div>
							<div class="form-group">
								<label for="refundIdx">주문 번호: </label>
								<input type="text" id="orderIdx" style="border:0 solid black;" readonly>
							</div>
							<div class="form-group mt-3">
								<label for="memberName" class="form-label">회원명</label>
								<input type="text" id="memberName" class="form-control" readonly disabled>
							</div>
							<div class="form-group mt-3">
								<label for="prodName" class="form-label">상품명</label>
								<input type="text" id=prodName class="form-control" readonly disabled>
							</div>
							<div class="form-group mt-3">
								<label for="Contents" class="form-label">문의 내용</label>
								<textarea id="Contents" class="form-control" style="resize: none; height:15vw;" readonly disabled></textarea>
							</div>
							<div class="form-group mt-3">
								<p>이미지</p>
								<img id ="refundImg" src ="" style="display:block; width:700px;" class="mx-auto" onclick="window.open(this.src)">
							</div>
					</div>
				</div>
			</div>
		</div>



	</div>
	<!--  -->
</main>


<%@ include file="../include/foot.jsp" %>