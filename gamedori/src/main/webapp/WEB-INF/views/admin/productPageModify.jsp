<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
<script>
	$(document).ready(function() {
		$(function() {
			$('#submitBtn').click(function() {
				var formData = new FormData($('form[name="cateImgInsert"]')[0]);
			    var cateImgType = $('select[name="cate_img_type"]').val();
			    if (!cateImgType) {
			      alert('카테고리를 선택해 주세요');
			      return false;
			    }
			    $.ajax({
			      url: '<%=request.getContextPath()%>/admin/cateImgInsert.do',
			      type: 'POST',
			      data: formData,
			      cache: false,
			      contentType: false,
			      processData: false,
			      success: function(data) {
		          	if (data === 'success') {
		              alert('등록 완료');
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
			<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/mainPageModify.do' />">메인 페이지 이미지 등록</a></li>
			<li class="nav-item"><a class="nav-link text-reset active fw-bold" href="<c:url value='/admin/productPageModify.do' />">카테고리 이미지 등록</a></li>
		</ul>
	</div>
	
	<div class="container mt-1">
	<div class="mb-3">
		<div class="container w-50">
			<div class="mb-3">
				<h4 class="text-center">카테고리 이미지 등록</h4>
			</div>			 
			 <form name="cateImgInsert" method="post" enctype="multipart/form-data">
				<div class="form-group mt-2">
					<div class="input-group">
						<input name="cate_img_file" type="file" class="form-control" id="cateImage">
						<label class="input-group-text" for="cateImage">이미지</label>
					</div>
					<div class="input-group mt-2 mb-2">
						<select class="form-select" name="cate_img_type">
							<option selected>카테고리 선택</option>
							<option value="1">새로운 상품</option>
							<option value="2">예약 판매</option>
							<option value="3">닌텐도 스위치</option>
							<option value="4">PS5</option>
							<option value="5">PS4</option>
							<option value="6">XBOX</option>
							<option value="7">굿즈</option>
						</select>
					</div>
					<div class="text-end mt-3">
						<button type="button" class="btn btn-secondary" id="submitBtn">저장</button>
					</div>
				</div>
			</form> 			
		</div>
		</div>
	</div>
</main>


<%@ include file="../include/foot.jsp" %>