<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
<script>
	function updateOptState(obj, idx) {
		$.ajax({
			type : 'POST',
			url : 'updateOptState.do',
			data : {
				opt_state : obj.value,
				opt_idx : idx
			},
			success : function() {
				console.log('상태 업데이트 완료');
				alert("상태 업데이트 완료");
			},
			error : function() {
				console.log('상태 업데이트 실패');
				alert("상태 업데이트 완료");
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
				class="nav-link text-reset" aria-current="page"
				href="<c:url value='/admin/prodmodify.do?prod_idx=${pvo.prod_idx}' />">상품 정보 수정</a></li>
			<li class="nav-item"><a class="nav-link text-reset active fw-bold"
				href="<c:url value='/admin/prodOptlist.do?prod_idx=${pvo.prod_idx}' />">상품 옵션 수정</a></li>
		</ul>
	</div>
	<div class="container mt-1">
		<!-- 상품 리스트 -->
		<div class="container">
			<table class="table table-sm ">
				<thead class="table-light">
					<tr>
						<th scope="col">상품명</th>
						<th scope="col">옵션명</th>
						<th scope="col">재고량</th>
						<th scope="col">재고상태</th>
						<th scope="col">옵션금액</th>
						<th scope="col">옵션상태</th>
						<th scope="col">옵션 관리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="optvo" items="${optlist}">
						<tr>
							<th class="table-secondary" scope="row">${optvo.prod_tb_idx}</th>
							<td class="table-secondary">${optvo.opt_name}</td>
							<td class="table-secondary">${optvo.opt_stock}</td>
							<td class="table-secondary">
								<c:if test="${optvo.opt_stock eq 0 }">
									품절
								</c:if>
								<c:if test="${optvo.opt_stock ne 0 }">
									정상
								</c:if>
							</td>
							<td class="table-secondary">${optvo.opt_price}</td>
							<td class="table-secondary">
								<select class="form-select" onchange="updateOptState(this,'${optvo.opt_idx}');">
									<option value="1" <c:if test="${optvo.opt_state eq '1'}">selected</c:if>>판매중</option>
									<option value="2" <c:if test="${optvo.opt_stock eq 0 and optvo.opt_state eq '2'}">selected</c:if>>품절</option>
									<option value="3" <c:if test="${optvo.opt_state eq '3'}">selected</c:if>>숨김</option>
								</select>
							</td>
							<td class="col-2">
								<div class="d-flex justify-content-around">
									<button type="button" onclick="location.href='prodOptmodify.do?opt_idx=${optvo.opt_idx}'" class="btn btn-outline-secondary btn-sm">수정</button>
									<form name="frm" action="prodOptDelete.do" method="post">
										<input name="prod_idx" type="hidden" value="${pvo.prod_idx}">
										<input name="opt_idx" type="hidden" value="${optvo.opt_idx}">
										<button id="prodOptDel" class="btn btn-outline-secondary btn-sm">삭제</button>
									</form>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- 옵션 등록 -->
		<div class="container d-flex justify-content-end">
			<button data-bs-toggle="modal" data-bs-target="#prodOptinsert" type="button" class="btn btn-outline-secondary btn-sm me-4" >옵션 등록</button>
		</div>
		<!-- 옵션 등록 -->
		<div class="modal fade" id="prodOptinsert">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header d-flex flex-column logo">
						<div class="mt-2">
							<h4 class="modal-title fs-5">옵션 등록</h4>
						</div>
					</div>
					<div class="modal-body">
						<form name="optInsert" method="post" action="prodOptlist.do">
							<input type="hidden" name="prod_idx" value="${pvo.prod_idx}">
							<input type="hidden" name="prod_tb_idx" value="${pvo.prod_idx}">
							<div
								class="form-group mt-2 d-flex input-group justify-content-between align-items-center">
								<span class="input-group-text" id="basic-addon1">옵션명</span>
								<input type="text" class="form-control" placeholder=""
									name="opt_name">
							</div>
							<div
								class="form-group mt-2 d-flex input-group justify-content-between align-items-center">
								<span class="input-group-text" id="basic-addon1">옵션 재고량</span>
								<input type="text" class="form-control" placeholder=""
									name="opt_stock">
							</div>
							<div
								class="form-group mt-2 d-flex input-group justify-content-between align-items-center">
								<span class="input-group-text" id="basic-addon1">옵션 금액</span>
								<input type="text" class="form-control" placeholder=""
									name="opt_price">
							</div>
							<div class="d-grid gap-1 mt-2">
								<input type="submit"
									class="btn btn-outline-secondary btn-lg form-control"
									value="옵션등록">
							</div>
						</form>
					</div>
				</div>
			</div>
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
<%@ include file="../include/foot.jsp" %>