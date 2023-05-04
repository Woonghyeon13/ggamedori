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
				<li class="nav-item"><a class="nav-link text-reset"
					href="<c:url value='/admin/asreturn.do' />">주문 관리</a></li>
				<li class="nav-item">
					<!-- 선택시 클래스 fw-bold --> <a
					class="nav-link text-reset active fw-bold"
					href="<c:url value='/admin/prod.do' />">상품 관리</a>
				</li>
				<li class="nav-item"><a class="nav-link text-reset"
					aria-current="page"
					href="<c:url value='/admin/mainPageModify.do' />">메인 화면 관리</a></li>
				<li class="nav-item"><a class="nav-link text-reset"
					href="<c:url value='/admin/qaprod.do' />">문의/공지관리</a>
				<li class="nav-item"><a class="nav-link text-reset"
					aria-current="page" href="<c:url value='/admin/member.do' />">회원
						관리</a></li>
				</li>
			</ul>
		</div>
	</div>
	<!-- 서브메뉴 -->
	<div class="container mt-4">
		<ul class="nav justify-content-end text-black">
			<li class="nav-item"><a
				class="nav-link active text-reset fw-bold" aria-current="page"
				href="<c:url value='/admin/prodmodify.do?prod_idx=${pvo.prod_idx}' />">상품 정보 수정</a></li>
			<li class="nav-item"><a class="nav-link text-reset"
				href="<c:url value='/admin/prodOptlist.do?prod_idx=${pvo.prod_idx}' />">상품 옵션 수정</a></li>
		</ul>
	</div>
	<div class="container mt-1">
		<!-- 상품 리스트 -->
		<div class="container w-75">
			<!-- 상품 등록 -->
			<form name="prodModify" method="post" action="prodmodify.do"
				enctype="multipart/form-data">
				<div class="form-group d-flex justify-content-around">
					<select class="category1 form-select form-select-sm"
						aria-label=".form-select-sm example" name="prodCate1">
						<option value="">1차 카테고리</option>
					</select> <select name="category_tb_code"
						class="category2 form-select form-select-sm"
						aria-label=".form-select-sm example">
						<option value="">2차 카테고리</option>
					</select>
				</div>
				<div
					class="form-group mt-2 d-flex input-group justify-content-between align-items-center">
					<span class="input-group-text" id="basic-addon1">상품명</span>
					<input type="hidden" name="opt_name" value="">
					<input type="hidden" value="${pvo.prod_idx}" class="form-control" name="prod_idx">
					<input type="text" value="${pvo.prod_name}" class="form-control" name="prod_name">
				</div>
				<div
					class="form-group mt-2 d-flex input-group justify-content-between align-items-center">
					<span class="input-group-text" id="basic-addon1">가격</span>
					<input type="text" value="${pvo.prod_price}" class="form-control" name="prod_price">
				</div>
				<div
					class="form-group mt-2 d-flex input-group justify-content-between align-items-center">
					<span class="input-group-text" id="basic-addon1">제조사</span>
					<input type="text" value="${pvo.prod_co}" class="form-control" name="prod_co">
				</div>
				<div
					class="form-group mt-2 d-flex input-group justify-content-between align-items-center">
					<span class="input-group-text" id="basic-addon1">출시일</span>
					<input type="date" value="${pvo.prod_rdate}" class="form-control" name="prod_rdate">
				</div>
				<div
					class="form-group mt-2 d-flex input-group justify-content-between align-items-center">
					<span class="input-group-text" id="basic-addon1">재고량</span>
					<input type="text" value="${pvo.prod_stock}" class="form-control" name="prod_stock">
				</div>
				<div class="form-group mt-2 d-flex input-group justify-content-between align-items-center">
					<span class="input-group-text">최소 구매수량</span> 
					<input value="${pvo.prod_qtymin}" name="prod_qtymin" type="text" aria-label="최소 구매" class="form-control">
					<span class="input-group-text">최대 구매수량</span> 
					<input value="${pvo.prod_qtymax}" name="prod_qtymax" type="text" aria-label="최대 구매" class="form-control">
				</div>
				<div
					class="form-group mt-2 d-flex input-group justify-content-between align-items-center">
					<span class="input-group-text" id="basic-addon1">예약상품 여부</span>
					<div>					
					<input class="me-2" name="prod_reserv" type="radio" value="1"/>Y
					<input class="ms-2 me-2" name="prod_reserv" type="radio" value="2"/>N
					</div>
				</div>
				<div class="form-group mt-2">
					<div class="input-group mb-3">
						<input name="prod_file1" type="file" class="form-control">
						<label class="input-group-text" for="inputGroupFile02">썸네일</label>
					</div>
				</div>
				<div class="form-group mt-2">
					<div class="input-group mb-3">
						<input name="prod_file2" type="file" class="form-control">
						<label class="input-group-text" for="inputGroupFile02">메인사진</label>
					</div>
				</div>
				<div class="form-group mt-2">
					<div class="input-group mb-3">
						<input name="prod_file3" type="file" class="form-control">
						<label class="input-group-text" for="inputGroupFile02">상세정보</label>
					</div>
				</div>
				<div class="d-grid gap-1 mt-2">
					<input type="submit" onclick="return prodcheck()" class="btn btn-outline-secondary btn-lg form-control" value="수정하기">
				</div>
			</form>
		</div>
	</div>
</main>
<!-- 유효성검사 -->
<script>
	function prodcheck(){
		if(prodModify.prodCate1.value == ""){
			alert("1차카테고리를 선택해주세요");
			prodModify.prodCate1.focus();
			return false;
		}
		if(prodModify.category_tb_code.value == ""){
			alert("2차카테고리를 선택해주세요");
			prodModify.category_tb_code.focus();
			return false;
		}
		if(prodModify.prod_name.value.length == 0){
			alert("상품이름을 입력해주세요");
			prodModify.prod_name.focus();
			return false;
		}
		if(prodModify.prod_price.value.length == 0){
			alert("상품가격을 입력해주세요");
			prodModify.prod_price.focus();
			return false;
		}
		if(prodModify.prod_co.value.length == 0){
			alert("상품제조사를 입력해주세요");
			prodModify.prod_co.focus();
			return false;
		}
		if(prodModify.prod_rdate.value.length == 0){
			alert("상품출시일을 선택해주세요");
			prodModify.prod_rdate.focus();
			return false;
		}
		if(prodModify.prod_stock.value.length == 0){
			alert("상품재고량을 입력해주세요");
			prodModify.prod_stock.focus();
			return false;
		}
		if(prodModify.prod_qtymin.value.length == 0){
			alert("상품최소구매수량을 입력해주세요");
			prodModify.prod_qtymin.focus();
			return false;
		}
		if(prodModify.prod_qtymax.value.length == 0){
			alert("상품최대구매수량을 입력해주세요");
			prodModify.prod_qtymax.focus();
			return false;
		}

		flag = false;
		for( i = 0; i < prodModify.prod_reserv.length; i++ ){
			if( prodModify.prod_reserv[i].checked ){
				flag = true;
			}
		}
		if( flag == false ){
			alert("예약상품 여부를 선택해주세요");
			return false;
		}
		if(!confirm("수정하시겠습니까?")){
			alert("상품수정을 취소했습니다.");
			return false;
		}else{
			alert("상품수정을 완료했습니다.");
			return true;
		}
	}
</script>
<!-- 카테고리 -->
<script>
	// 데이터
	var jsonData = JSON.parse('${category}');
	console.log(jsonData);

	var cate1Arr = new Array();
	var cate1Obj = new Object();

	for (var i = 0; i < jsonData.length; i++) {
		if (jsonData[i].level == "1") {
			cate1Obj = new Object();
			cate1Obj.cate_code = jsonData[i].cate_code;
			cate1Obj.cate_name = jsonData[i].cate_name;
			cate1Arr.push(cate1Obj);
		}
	}

	var cateSelect1 = $("select.category1");

	for (var i = 0; i < cate1Arr.length; i++) {
		cateSelect1.append("<option value='" + cate1Arr[i].cate_code + "'>"
				+ cate1Arr[i].cate_name + "</option>");
	}

	$(document)
			.on(
					"change",
					"select.category1",
					function() {
						var cate2Arr = new Array();
						var cate2Obj = new Object();

						for (var i = 0; i < jsonData.length; i++) {
							if (jsonData[i].level == "2") {
								cate2Obj = new Object();
								cate2Obj.cate_code = jsonData[i].cate_code;
								cate2Obj.cate_name = jsonData[i].cate_name;
								cate2Obj.cate_refcode = jsonData[i].cate_refcode;

								cate2Arr.push(cate2Obj);
							}
						}
						var cateSelect2 = $("select.category2");

						cateSelect2.children().remove();

						$("option:selected", this)
								.each(
										function() {
											var selectVal = $(this).val();
											cateSelect2
													.append("<option value='"+ selectVal +"'>2차 카테고리</option>");

											for (var i = 0; i < cate2Arr.length; i++) {
												if (selectVal == cate2Arr[i].cate_refcode) {
													cateSelect2
															.append("<option value='" + cate2Arr[i].cate_code + "'>"
																	+ cate2Arr[i].cate_name
																	+ "</option>");
												}
											}
										});
					});
</script>
<%@ include file="../include/foot.jsp" %>