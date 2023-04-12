<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
<script src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>

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
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/asreturn.do' />">주문 관리</a></li>
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/prod.do' />">상품 관리</a></li>
				<li class="nav-item"><a class="nav-link text-reset" aria-current="page" href="<c:url value='/admin/mainPageModify.do' />">메인 화면 관리</a></li>
				<li class="nav-item"><a class="nav-link active text-reset fw-bold" href="<c:url value='/admin/qaprod.do' />">문의/공지관리</a></li>
				<li class="nav-item">
					<!-- 선택시 클래스 fw-bold --> 
					<a class="nav-link text-reset" aria-current="page" href="<c:url value='/admin/member.do' />">회원 관리</a>
				</li>
			</ul>
		</div>
	</div>
	<!-- 문의/공지사항 탭  -->
	<div class="container mt-4">
		<ul class="nav justify-content-end text-black">
			<li class="nav-item"><a class="nav-link text-reset"
				aria-current="page" href="<c:url value='/admin/qaprod.do' />">상품 문의 관리</a></li>
			<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/oto.do' />">1:1 문의 관리</a></li>
			<li class="nav-item"><a
				class="nav-link active text-reset fw-bold" href="<c:url value='/admin/notice.do' />">공지사항 관리</a></li>
		</ul>
	</div>

	<div class="container mt-1">

		<div class="container">
			<form action="">
				<table class="table">
					<thead class="table-light">
						<tr>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일자</th>
							<th scope="col" style="width: 80px;">수정</th>
							<th scope="col" style="width: 80px;">삭제</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">공지사항 제목</th>
							<td>Mark</td>
							<td>2023-03-29</td>
							<td>
								<button type="button" class="btn btn-secondary btn-sm"
									data-bs-toggle="modal" data-bs-target="#noticeModify">수정</button>
							</td>
							<td>
								<button class="btn btn-secondary btn-sm">삭제</button>
							</td>
						</tr>
					</tbody>
				</table>
		</div>
		</form>

		<!-- 공지사항 등록 -->
		<div class="container d-flex justify-content-end">
			<button type="button" class="btn btn-outline-secondary btn-sm me-4"
				data-bs-toggle="modal" data-bs-target="#noticeWrite">글쓰기</button>
		</div>
		<div class="modal fade" id="noticeWrite" data-bs-backdrop="static">
			<div class="modal-dialog modal-dialog-centered modal-xl">
				<div class="modal-content">
					<div class="modal-header d-flex flex-column logo">
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						<h4 class="modal-title fs-5">공지사항 등록</h4>
					</div>
					<div class="modal-body">
						<form name="review" method="post" action="loginAction.jsp">
							<div class="form-group d-flex justify-content-around"></div>
							<div
								class="form-group mt-2 d-flex justify-content-between align-items-center">
								<input type="text" class="form-control" id="review_title"
									placeholder="공지사항 제목" name="review_title">
							</div>
							<div class="form-group mt-2 d-flex justify-content-between align-items-center">
								<textarea name="" id="noticeContent" class="form-control" placeholder="공지사항 내용"></textarea>
								   <script>
								   	ClassicEditor.create( document.querySelector( '#noticeContent' ), {
								        language: "ko"
								        
								      } );
								   	</script>
							</div>
							<div class="d-grid gap-1 mt-2">
								<input type="submit"
									class="btn btn-outline-secondary btn-lg form-control"
									value="공지사항 등록">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- 검색 -->
		<div class="container">
			<form class="form-horizontal d-flex justify-content-center"
				role="form">
				<div>
					<input class="form-control form-control-sm" type="text"
						placeholder="제목" aria-label=".form-control-sm example">
				</div>
				<div>
					<button type="button" class="btn btn-outline-secondary btn-sm ms-2">검색</button>
				</div>
			</form>
		</div>

		<!-- 공지사항 수정 -->
		<div class="modal fade" id="noticeModify" data-bs-backdrop="static">
			<div class="modal-dialog modal-dialog-centered modal-xl">
				<div class="modal-content">
					<div class="modal-header d-flex flex-column logo">
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						<h4 class="modal-title fs-5">공지사항 수정</h4>
					</div>
					<div class="modal-body">
						<form name="review" method="post" action="loginAction.jsp">
							<div class="form-group d-flex justify-content-around"></div>
							<div
								class="form-group mt-2 d-flex justify-content-between align-items-center">
								<input type="text" class="form-control" id="review_title"
									placeholder="공지사항 제목" name="review_title">
							</div>
							<div class="form-group mt-2 d-flex justify-content-between align-items-center">
								<textarea name="" id="noticeModi" class="form-control" placeholder="공지사항 내용"></textarea>
								   <script>
								   	ClassicEditor.create( document.querySelector( '#noticeModi' ), {
								        language: "ko"
								        
								      } );
								   	</script>
							</div>
							<div class="d-grid gap-1 mt-2">
								<input type="submit"
									class="btn btn-outline-secondary btn-lg form-control"
									value="공지사항 등록">
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