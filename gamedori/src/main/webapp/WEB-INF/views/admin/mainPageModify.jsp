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

<main>
	<div class="container d-flex justify-content-center mt-2">
		<h3 class="fw-bold">관리자 페이지</h3>
	</div>
	<div class="container">
		<div class="container mt-5">
			<ul class="nav justify-content-center nav-fill nav-tabs text-black">
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/orderList.do' />">주문 관리</a></li>
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/prod.do' />">상품 관리</a></li>
				<li class="nav-item">
					<!-- 선택시 클래스 fw-bold --> 
					<a class="nav-link text-reset active fw-bold" href="<c:url value='/admin/mainPageModify.do' />">화면 관리</a>
				</li>
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/qaprod.do' />">문의/공지관리</a></li>
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/member.do' />">회원 관리</a></li>
			</ul>
		</div>
	</div>
	<!-- 화면관리 탭  -->
	<div class="container mt-4">
		<ul class="nav justify-content-end text-black">
			<li class="nav-item"><a class="nav-link active text-reset fw-bold" href="<c:url value='/admin/mainPageModify.do' />">메인 페이지</a></li>
			<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/productPageModify.do' />">상품 페이지</a></li>
		</ul>
	</div>
	<div class="container mt-1">
		<div class="container w-50">
			<div class="mb-5">
				<div class="mb-3">
					<h4 class="text-center">캐러셀 이미지 추가</h4>
				</div>
				<form name="carouselInsert" method="post" action="carouselInsert.do" enctype="multipart/form-data">
					<div class="form-group mt-2 mb-4">
						<div class="input-group">
							<input name="carousel_img_file" type="file" class="form-control" onchange="checkFileSelected()">
							<button class="btn btn-secondary" id="submitBtn">저장</button>
						</div>
					</div>
				</form>			
			</div>
			<hr>
			<div class="mt-5 mb-5">
				<div class="mt-5 mb-5">
					<h4 class="text-center">광고영역 변경</h4>
				</div>
				<div class="d-flex justify-content-evenly">
					<div>
						<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#ad1">광고 1 변경</button>
					</div>
					<div>
						<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#ad2">광고 2 변경</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 광고1 모달 -->
	<div class="modal fade" tabindex="-1" id="ad1" data-bs-backdrop="static">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header d-flex flex-column">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					<h4 class="modal-title fs-5">광고 1 변경</h4>
				</div>
				<div class="modal-body">
					<form name="ad1" method="post" action="adModify.do" enctype="multipart/form-data">
					<input type="hidden" name="ad_type" value="1">
						<div class="input-group">
							<input name="ad_img_b" type="file" class="form-control">
							<label class="input-group-text" for="adImage1">큰 이미지</label>
						</div>
						<div class="input-group mt-2">
							<input name="ad_img_s" type="file" class="form-control">
							<label class="input-group-text" for="adImage2">작은 이미지</label>
						</div>
						<div class="input-group mt-2">
							  <span class="input-group-text">광고 링크</span>
							  <input name="ad_link" type="text" class="form-control" placeholder="링크">
						</div>
						<div class="input-group mt-2">
							  <span class="input-group-text">광고 제목</span>
							  <input name="ad_title" type="text" class="form-control" placeholder="제목">
						</div>
						<div class="mt-2">
							<textarea name="ad_contents" id="ad1Text" class="form-control" placeholder="내용"></textarea>
							<script>
								let editor;
	
								ClassicEditor.create(document.querySelector('#ad1Text'), {
								  language: 'ko'
								}).then(newEditor => {
								  editor = newEditor;
							  	});	
							</script>
						</div>
						<div class="d-flex gap-1 mt-2">
							<input type="submit" class="btn btn-outline-secondary btn-lg form-control" value="답변등록">
						</div>
					</form>
				</div>	
			</div>
		</div>
	</div>
	
	<!-- 광고2 모달 -->
	<div class="modal fade" tabindex="-1" id="ad2" data-bs-backdrop="static">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header d-flex flex-column">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					<h4 class="modal-title fs-5">광고 2 변경</h4>
				</div>
				<div class="modal-body">
					<form name="ad2" method="post" action="adModify.do" enctype="multipart/form-data">
					<input type="hidden" name="ad_type" value="2">
						<div class="input-group">
							<input name="ad_img_b" type="file" class="form-control">
							<label class="input-group-text" for="adImage1">큰 이미지</label>
						</div>
						<div class="input-group mt-2">
							<input name="ad_img_s" type="file" class="form-control">
							<label class="input-group-text" for="adImage2">작은 이미지</label>
						</div>
						<div class="input-group mt-2">
							  <span class="input-group-text">광고 링크</span>
							  <input name="ad_link" type="text" class="form-control" placeholder="링크">
						</div>
						<div class="input-group mt-2">
							  <span class="input-group-text">광고 제목</span>
							  <input name="ad_title" type="text" class="form-control" placeholder="제목">
						</div>
						<div class="mt-2">
							<textarea name="ad_contents" id="ad2Text" class="form-control" placeholder="내용"></textarea>
							<script>
								ClassicEditor.create(document.querySelector('#ad2Text'), {
								  language: 'ko'
								}).then(newEditor => {
								  editor = newEditor;
							  	});	
							</script>
						</div>
						<div class="d-flex gap-1 mt-2">
							<input type="submit" class="btn btn-outline-secondary btn-lg form-control" value="답변등록">
						</div>
					</form>
				</div>	
			</div>
		</div>
	</div>
	
</main>


<%@ include file="../include/foot.jsp" %>