<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	function sessionToModal(title, contents, name){
	  // 세션 값 가져오기
	  var otoTitle = title;
	  var otoContents = contents;
	  var memberName = name;
	  
	  // input 태그에 세션 값 할당
	  document.getElementById('otoTitle').value = otoTitle;
	  document.getElementById('otoContents').value = otoContents;
	  document.getElementById('memberName').value = memberName;
	  
	}
</script>

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
				<li class="nav-item">
					<!-- 선택시 클래스 fw-bold --> 
					<a class="nav-link active text-reset fw-bold" href="<c:url value='/admin/qaprod.do' />">문의/공지관리</a>
				</li>
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/member.do' />">회원 관리</a></li>
			</ul>
		</div>
	</div>
	<!-- 문의/공지사항 탭  -->
	<div class="container mt-4">
		<ul class="nav justify-content-end text-black">
			<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/qaprod.do' />">상품 문의 관리</a></li>
			<li class="nav-item"><a class="nav-link active text-reset fw-bold" href="<c:url value='/admin/oto.do' />">1:1 문의 관리</a></li>
			<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/notice.do' />">공지사항 관리</a></li>
		</ul>
	</div>

	<div class="container mt-1">

		<div class="container">

				<table class="table">
					<thead class="table-light">
						<tr>
							<th class="text-center">번호</th>
							<th class="text-center">제목</th>
							<th class="text-center">회원명</th>
							<th class="text-center">작성일자</th>
							<th class="text-center">처리상태</th>
							<th class="text-center">답변</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="otolist" items="${otoList }">
						<tr>
							<td class="text-center">${otolist.qa_idx }</td>
							<td class="text-center">${otolist.qa_title }</td>
							<td class="text-center">${otolist.member_name }</td>
							<td class="text-center">${otolist.qa_wdate }</td>
						<c:if test="${otolist.qa_yn == 1 }">
							<td class="text-center">답변 완료</td>
						</c:if>	
						<c:if test="${otolist.qa_yn == 2 }">
							<td class="text-center">답변 대기 중</td>
						</c:if>	
							<td class="text-center">
								<button type="button" class="btn btn-secondary btn-sm"
									data-bs-toggle="modal" data-bs-target="#otoRefund" onclick="sessionToModal('${otolist.qa_title }', '${otolist.qa_contents }', '${otolist.member_name }')">답변</button>
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
		<div class="modal fade" id="otoRefund" data-bs-backdrop="static">
			<div class="modal-dialog modal-dialog-centered modal-lg">
				<div class="modal-content">
					<div class="modal-header d-flex flex-column logo">
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						<h4 class="modal-title fs-5">1:1 문의 관리</h4>
					</div>
					<div class="modal-body">
						<form name="review" method="post" action="">
							<div class="form-group">
								<label for="memberName" class="form-label">회원명</label>
								<input type="text" id="memberName" class="form-control" readonly>
							</div>
							<div class="form-group mt-3">
								<label for="otoTitle" class="form-label">제목</label>
								<input type="text" id="otoTitle" class="form-control" readonly>
							</div>
							<div class="form-group mt-3">
								<label for="otoContents" class="form-label">문의 내용</label>
								<textarea id="otoContents" class="form-control" style="resize: none;" readonly></textarea>
							</div>
							<hr>
							<div class="form-group mt-2 d-flex flex-column justify-content-center align-items-center">
								<textarea id="otoCon" placeholder="1:1 문의 답변 내용" class="form-control"></textarea>
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