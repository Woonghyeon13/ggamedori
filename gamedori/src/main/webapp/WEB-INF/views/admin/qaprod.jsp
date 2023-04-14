<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>

<style>
.ck.ck-editor {
	width:100%;
}
.ck-editor__editable {
	 min-height: 30vw;
}
</style>

<main>
	<div class="container d-flex justify-content-center mt-2">
		<h3 class="fw-bold">관리자 페이지</h3>
	</div>
	<div class="container">
		<div class="container mt-5">
			<ul class="nav justify-content-center nav-fill nav-tabs text-black">
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/orderList.do' />">주문 관리</a></li>
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/prod.do' />">상품 관리</a></li>
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/mainPageModify.do' />">화면 관리</a></li>
				<li class="nav-item"><a class="nav-link active text-reset fw-bold" href="<c:url value='/admin/qaprod.do' />">문의/공지관리</a></li>
				<li class="nav-item">
					<!-- 선택시 클래스 fw-bold -->
					<a class="nav-link text-reset" href="<c:url value='/admin/member.do' />">회원 관리</a>
				</li>
			</ul>
		</div>
	</div>
	<!-- 문의/공지사항 탭  -->
	<div class="container mt-4">
		<ul class="nav justify-content-end text-black">
			<li class="nav-item"><a class="nav-link active text-reset fw-bold" href="<c:url value='/admin/qaprod.do' />">상품 문의 관리</a></li>
			<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/oto.do' />">1:1 문의 관리</a></li>
			<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/notice.do' />">공지사항 관리</a></li>
		</ul>
	</div>

	<div class="container mt-1">

		<div class="container">

				<table class="table">
					<thead class="table-light">
						<tr>
							<th class="text-center">번호</th>
							<th class="text-center">상품명</th>
							<th class="text-center">문의제목</th>
							<th class="text-center">회원명</th>
							<th class="text-center">작성일자</th>
							<th class="text-center">비밀글 여부</th>
							<th class="text-center">처리상태</th>
							<th class="text-center">답변</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="pqlist" items="${pqlist }">
						<tr>
							<td class="text-center">${pqlist.prod_q_idx }</td>
							<td class="text-center">${pqlist.prod_name}</td>
							<td class="text-center">${pqlist.prod_q_title }</td>
							<td class="text-center">${pqlist.member_name }</td>
							<td class="text-center">${pqlist.prod_q_wdate }</td>
						<c:if test="${pqlist.prod_q_secret == 1 }">
							<td class="text-center">예</td>
						</c:if>
						<c:if test="${pqlist.prod_q_secret == 2 }">
							<td class="text-center">아니오</td>
						</c:if>
						<c:if test="${pqlist.prod_q_yn == 1 }">
							<td class="text-center">답변 완료</td>
						</c:if>	
						<c:if test="${pqlist.prod_q_yn == 2 }">
							<td class="text-center">답변 대기 중</td>
						</c:if>	
							<td class="text-center">
								<button type="button" class="btn btn-secondary btn-sm"
									data-bs-toggle="modal" data-bs-target="#prodRefund">답변</button>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
		</div>


		<div class="container">
			<form class="form-horizontal d-flex justify-content-center"
				role="form">
				<div>
					<input class="form-control form-control-sm" type="text"
						placeholder="회원명" aria-label=".form-control-sm example">
				</div>
				<div>
					<button type="button" class="btn btn-outline-secondary btn-sm ms-2">검색</button>
				</div>
			</form>
		</div>

		<!-- 답변 모달 -->
		<div class="modal fade" id="prodRefund" data-bs-backdrop="static">
			<div class="modal-dialog modal-dialog-centered modal-lg">
				<div class="modal-content">
					<div class="modal-header d-flex flex-column logo">
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						<h4 class="modal-title fs-5">상품 문의 관리</h4>
					</div>
					<div class="modal-body">
						<form name="review" method="post" action="">
							<div class="form-group d-flex flex-column justify-content-center align-items-center">
								<input type="text" class="form-control" placeholder="상품 문의 제목">
							</div>
							<div class="form-group mt-2 d-flex flex-column justify-content-center align-items-center">
								<textarea readonly name="" id="" placeholder="상품 문의 내용" class="form-control" rows="5"></textarea>
							</div>
							<hr>
							<div
								class="form-group mt-2 d-flex flex-column justify-content-center align-items-center">
								<textarea name="" id="otoCon" placeholder="상품 문의 답변 내용" class="form-control"></textarea>
								<script>
								   	ClassicEditor.create( document.querySelector( '#otoCon' ), {
								        language: "ko"
								        
								      } );
								</script>
							</div>

							<div class="d-flex gap-1 mt-2">
								<input type="submit"
									class="btn btn-outline-secondary btn-lg form-control"
									value="답변등록">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>


		<div class="container d-flex justify-content-center mt-3">
			<nav aria-label="Page navigation example">
				<ul class="pagination text-black">
					<li class="page-item"><a class="page-link text-reset" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item"><a class="page-link text-reset" href="#">1</a></li>
					<li class="page-item"><a class="page-link text-reset" href="#">2</a></li>
					<li class="page-item"><a class="page-link text-reset" href="#">3</a></li>
					<li class="page-item"><a class="page-link text-reset" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</div>
</main>


<%@ include file="../include/foot.jsp" %>