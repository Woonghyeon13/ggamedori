<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
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
						<td class="text-center align-middle">${rlist.order_idx }</td>
						<td class="text-center align-middle">${rlist.prod_name }</td>
						<td class="text-center align-middle">${rlist.member_email }</td>
						<td class="text-center align-middle">${rlist.member_name }</td>
						<td class="text-center align-middle">${rlist.refund_date }</td>
					<c:if test="${rlist.refund_yn == 1 }">
						<td class="text-center align-middle">승인</td>
					</c:if>
					<c:if test="${rlist.refund_yn == 2 }">
						<td class="text-center align-middle">거절</td>
					</c:if>
					<c:if test="${rlist.refund_yn == 3 }">
						<td class="text-center align-middle">대기중</td>
					</c:if>	
						<td class="text-center align-middle">
							<button type="button" class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#prodRefund">
								상세보기
							</button>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>

		<!-- 반품 관리 -->
		<div class="modal fade" id="prodRefund">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header d-flex flex-column logo">
						<div class="mt-2">
							<h4 class="modal-title fs-5">환불 정보</h4>
						</div>
					</div>
					<div class="modal-body">
						<form name="review" method="post" action="loginAction.jsp">
							<div
								class="form-group d-flex flex-column justify-content-center align-items-center">
								<input type="text" class="form-control" placeholder="환불 신청 제목">
							</div>
							<div
								class="form-group mt-2 d-flex flex-column justify-content-center align-items-center">
								<textarea name="" id="" placeholder="환불 신청 사유"
									class="form-control" cols="30" rows="10"></textarea>
							</div>
							<div
								class="form-group mt-2 d-flex flex-column justify-content-center align-items-center">
								<textarea name="" id="" placeholder="환불 승인/거절 사유"
									class="form-control" cols="30" rows="10"></textarea>
							</div>

							<div class="d-flex gap-1 mt-2">
								<input type="submit"
									class="btn btn-outline-secondary btn-lg form-control"
									value="승인"> <input type="submit"
									class="btn btn-outline-secondary btn-lg form-control"
									value="거절">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>



	</div>
	<!--  -->
</main>


<%@ include file="../include/foot.jsp" %>