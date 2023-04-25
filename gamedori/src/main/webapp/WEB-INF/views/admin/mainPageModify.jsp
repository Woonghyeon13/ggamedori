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
	$(document).ready(function() {
		$(function() {
			  $('#submitBtn').click(function() {
			    var formData = new FormData($('form[name="carouselInsert"]')[0]);
			    var carouselProdLink = $('input[name="carousel_prod_link"]').val(); // carousel_prod_link input의 값을 가져옴
			    if (!carouselProdLink) { // carousel_prod_link input이 비어있는 경우
			      alert('등록 실패');
			      return false;
			    }
			    $.ajax({
			      url: 'carouselInsert.do',
			      type: 'POST',
			      data: formData,
			      cache: false,
			      contentType: false,
			      processData: false,
			      success: function(data) {
		          	if (data === 'success') {
		              alert('등록 완료');
						$('form[name="carouselInsert"]')[0].reset(); // 폼 초기화
			         } else {
			         	alert('등록 실패');
			         }
		          	error: function (xhr, status, error) {
			            console.log('Error:', error);
			            
			        }
			       }
			    });
			  });
			});
		
		$(function() {
			  $('#adSubmitBtn').click(function() {
			    var ad_link = $('input[name="ad_link"]').val();
			    var ad_title = $('input[name="ad_title"]').val();
			    var ad_contents = editor.getData();
			   $("#adText").val(ad_contents);

			    var formData = new FormData($('form[name="adInsert"]')[0]);
			    if (!ad_link || !ad_title || !ad_contents ) { // input이 비어있는 경우
			   // if (!ad_link || !ad_title ) { // input이 비어있는 경우
			      alert('등록 실패');
			      return false;
			    }
			    $.ajax({
			      url: 'adInsert.do',
			      type: 'POST',
			      data: formData,
			      cache: false,
			      contentType: false,
			      processData: false,
			      success: function(data) {
		          	if (data === 'success') {
		              alert('등록 완료');
						$('form[name="adInsert"]')[0].reset(); // 폼 초기화
						editor.setData(""); //에디터 초기화
			         } else {
			         	alert('등록 실패');
			         }
			       }
			    });
			  });
			});
		
	});
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
			<li class="nav-item"><a class="nav-link active text-reset fw-bold" href="<c:url value='/admin/mainPageModify.do' />">메인 페이지 이미지 등록</a></li>
			<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/productPageModify.do' />">카테고리 이미지 등록</a></li>
		</ul>
	</div>
	<div class="container mt-1">
		<div class="container w-50">
			<div class="mb-3">
				<div class="mb-3">
					<h4 class="text-center">캐러셀 추가</h4>
				</div>			 
				 <form name="carouselInsert" method="post" enctype="multipart/form-data">
					<div class="form-group mt-2">
						<div class="input-group">
							<input name="carousel_img_file" type="file" class="form-control" id="carouselImage">
							<label class="input-group-text" for="carouselImage">이미지</label>
						</div>
						<div class="input-group mt-2 mb-2">
							  <span class="input-group-text">상품 링크</span>
							  <input name="carousel_prod_link" type="text" class="form-control" placeholder="상품 링크">
						</div>
						<div class="text-end mt-3">
							<button type="button" class="btn btn-secondary" id="submitBtn">저장</button>
						</div>
					</div>
				</form> 			
			</div>
			
			<hr>
			
			<div class="mt-5 mb-5">
				<div class="mt-5 mb-3">
					<h4 class="text-center">광고 추가</h4>
				</div>
				<div>
					<form name="adInsert" method="post" action="adInsert.do" enctype="multipart/form-data">
						<div class="input-group">
							<input name="ad_img_b_file" type="file" class="form-control" id="adImageB">
							<label class="input-group-text" for="adImageB">큰 이미지</label>
						</div>
						<div class="input-group mt-2">
							<input name="ad_img_s_file" type="file" class="form-control" id="adImageS">
							<label class="input-group-text" for="adImageS">작은 이미지</label>
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
							<textarea name="ad_contents" id="adText" class="form-control" placeholder="내용"></textarea>
							<script>
								let editor;
	
								ClassicEditor.create(document.querySelector('#adText'), {
								  language: 'ko'
								}).then(newEditor => {
								  editor = newEditor;
							  	});	
							</script>
						</div>
						<div class="text-end mt-3">
							<button type="button" class="btn btn-secondary" id="adSubmitBtn">저장</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
</main>


<%@ include file="../include/foot.jsp" %>