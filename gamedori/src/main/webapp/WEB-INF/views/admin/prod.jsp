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
					aria-current="page" href="<c:url value='/admin/member.do' />">회원 관리</a></li>
				<li class="nav-item">
					<!-- 선택시 클래스 fw-bold --> <a
					class="nav-link text-reset active fw-bold" href="<c:url value='/admin/prod.do' />">상품관리</a>
				</li>
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/asreturn.do' />">A/S
						관리</a></li>
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/qaprod.do' />">문의/공지관리</a>
				</li>
			</ul>
		</div>
	</div>
	<!-- 문의/공지사항 탭  -->
	<!-- <div class="container">
    <ul class="nav justify-content-end text-black">
      <li class="nav-item">
        <a class="nav-link active text-reset" aria-current="page" href="#">상품 문의 관리</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-reset" href="#">1:1 문의 관리</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-reset" href="#">공지사항 관리</a>
      </li>
    </ul>
  </div> -->
	<div class="container">

		<div class="container mt-5">
			<table class="table table-sm ">
				<thead class="table-light">
					<tr>
						<th scope="col">상품 번호</th>
						<th scope="col">상품 분류</th>
						<th scope="col">상품 이름</th>
						<th scope="col">상품 등록일</th>
						<th scope="col">재고 수량</th>
						<th scope="col">재고 상태</th>
						<th scope="col">상품 관리</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="table-secondary" scope="row">1</th>
						<td class="table-secondary">Mark</td>
						<td class="table-secondary">Otto</td>
						<td class="table-secondary">@mdo</td>
						<td class="table-secondary">Mark</td>
						<td class="table-secondary">Otto</td>
						<td class="col-2">
							<div class="d-flex justify-content-around">
								<button type="button" class="btn btn-outline-secondary btn-sm"
									data-bs-toggle="modal" data-bs-target="#prodModify">수정</button>
								<button type="button" class="btn btn-outline-secondary btn-sm">삭제</button>
							</div>
						</td>
					</tr>
					<tr>
						<th class="table-secondary" scope="row">2</th>
						<td class="table-secondary">Jacob</td>
						<td class="table-secondary">Thornton</td>
						<td class="table-secondary">@fat</td>
						<td class="table-secondary">Mark</td>
						<td class="table-secondary">Otto</td>
						<td>
							<div class="d-flex justify-content-around">
								<button type="button" class="btn btn-outline-secondary btn-sm"
									data-bs-toggle="modal" data-bs-target="#prodModify">수정</button>
								<button type="button" class="btn btn-outline-secondary btn-sm">삭제</button>
							</div>
						</td>

					</tr>
					<tr>
						<th class="table-secondary" scope="row">3</th>
						<td class="table-secondary">Larry the Bird</td>
						<td class="table-secondary">@twitter</td>
						<td class="table-secondary">Mark</td>
						<td class="table-secondary">Otto</td>
						<td class="table-secondary">@mdo</td>
						<td>
							<div class="d-flex justify-content-around">
								<button type="button" class="btn btn-outline-secondary btn-sm"
									data-bs-toggle="modal" data-bs-target="#prodModify">수정</button>
								<button type="button" class="btn btn-outline-secondary btn-sm">삭제</button>
							</div>
						</td>

					</tr>
					<tr>
						<th class="table-secondary" scope="row">4</th>
						<td class="table-secondary" colspan="1">Larry the Bird</td>
						<td class="table-secondary">@twitter</td>
						<td class="table-secondary">Mark</td>
						<td class="table-secondary">Otto</td>
						<td class="table-secondary">@mdo</td>
						<td>
							<div class="d-flex justify-content-around">
								<button type="button" class="btn btn-outline-secondary btn-sm"
									data-bs-toggle="modal" data-bs-target="#prodModify">수정</button>
								<button type="button" class="btn btn-outline-secondary btn-sm">삭제</button>
							</div>
						</td>

					</tr>
					<tr>
						<th class="table-secondary" scope="row">5</th>
						<td class="table-secondary" colspan="1">Larry the Bird</td>
						<td class="table-secondary">@twitter</td>
						<td class="table-secondary">Mark</td>
						<td class="table-secondary">Otto</td>
						<td class="table-secondary">@mdo</td>
						<td>
							<div class="d-flex justify-content-around">
								<button type="button" class="btn btn-outline-secondary btn-sm"
									data-bs-toggle="modal" data-bs-target="#prodModify">수정</button>
								<button type="button" class="btn btn-outline-secondary btn-sm">삭제</button>
							</div>
						</td>

					</tr>
					<tr>
						<th class="table-secondary" scope="row">6</th>
						<td class="table-secondary" colspan="1">Larry the Bird</td>
						<td class="table-secondary">@twitter</td>
						<td class="table-secondary">Mark</td>
						<td class="table-secondary">Otto</td>
						<td class="table-secondary">@mdo</td>
						<td>
							<div class="d-flex justify-content-around">
								<button type="button" class="btn btn-outline-secondary btn-sm"
									data-bs-toggle="modal" data-bs-target="#prodModify">수정</button>
								<button type="button" class="btn btn-outline-secondary btn-sm">삭제</button>
							</div>
						</td>

					</tr>
					<tr>
						<th class="table-secondary" scope="row">7</th>
						<td class="table-secondary" colspan="1">Larry the Bird</td>
						<td class="table-secondary">@twitter</td>
						<td class="table-secondary">Mark</td>
						<td class="table-secondary">Otto</td>
						<td class="table-secondary">@mdo</td>
						<td>
							<div class="d-flex justify-content-around">
								<button type="button" class="btn btn-outline-secondary btn-sm"
									data-bs-toggle="modal" data-bs-target="#prodModify">수정</button>
								<button type="button" class="btn btn-outline-secondary btn-sm">삭제</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<!-- 상품 수정 -->
		<div class="modal fade" id="prodModify">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header d-flex flex-column logo">
						<div class="mt-2">
							<h4 class="modal-title fs-5">상품 수정</h4>
						</div>
					</div>
					<div class="modal-body">
						<form name="" method="post" action="">
							<div class="form-group d-flex justify-content-around">
								<select class="form-select form-select-sm"
									aria-label=".form-select-sm example">
									<option selected>1차 카테고리</option>
									<option value="1">One</option>
									<option value="2">Two</option>
									<option value="3">Three</option>
								</select> <select class="form-select form-select-sm"
									aria-label=".form-select-sm example">
									<option selected>2차 카테고리</option>
									<option value="1">One</option>
									<option value="2">Two</option>
									<option value="3">Three</option>
								</select>
							</div>
							<div
								class="form-group mt-2 d-flex justify-content-between align-items-center">
								<input type="text" class="form-control" id="review_title"
									placeholder="상품명" name="review_title">
							</div>
							<div
								class="form-group mt-2 d-flex justify-content-between align-items-center">
								<input type="text" class="form-control" id="review_title"
									placeholder="가격" name="review_title">
							</div>
							<div class="form-group mt-2">
								<div class="input-group mb-3">
									<input type="file" class="form-control" id="inputGroupFile02">
									<label class="input-group-text" for="inputGroupFile02">썸네일</label>
								</div>
							</div>
							<div
								class="form-group mt-2 d-flex justify-content-between align-items-center">
								<input type="text" class="form-control" id="review_title"
									placeholder="제조사" name="review_title">
							</div>
							<div
								class="form-group mt-2 d-flex justify-content-between align-items-center">
								<input type="text" class="form-control" id="review_title"
									placeholder="제품옵션1" name="review_title">
							</div>
							<div
								class="form-group mt-2 d-flex justify-content-between align-items-center">
								<input type="text" class="form-control" id="review_title"
									placeholder="제품옵션2" name="review_title">
							</div>
							<div
								class="form-group mt-2 d-flex justify-content-between align-items-center">
								<input type="text" class="form-control" id="review_title"
									placeholder="제품옵션3" name="review_title">
							</div>
							<div
								class="form-group mt-2 d-flex justify-content-between align-items-center">
								성인등급 여부 <input name="adultyn" type="radio" value="1">Y <input
									name="adultyn" type="radio" value="2">N
							</div>
							<div class="form-group mt-2">
								<div class="input-group mb-3">
									<input type="file" class="form-control" id="inputGroupFile02">
									<label class="input-group-text" for="inputGroupFile02">상세사진</label>
								</div>
							</div>
							<div class="form-group mt-2">
								<div class="input-group mb-3">
									<input type="file" class="form-control" id="inputGroupFile02">
									<label class="input-group-text" for="inputGroupFile02">배송정보</label>
								</div>
							</div>
							<div class="d-grid gap-1 mt-2">
								<input type="submit"
									class="btn btn-outline-secondary btn-lg form-control"
									value="상품수정">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 상품 등록 -->
		<div class="container d-flex justify-content-end">
			<button type="button" class="btn btn-outline-secondary btn-sm me-4"
				data-bs-toggle="modal" data-bs-target="#prodWrite">상품 등록</button>
		</div>
		<div class="modal fade" id="prodWrite">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header d-flex flex-column logo">
						<div class="mt-2">
							<h4 class="modal-title fs-5">상품 등록</h4>
						</div>
					</div>
					<div class="modal-body">
						<form name="prodInsert" method="post" action="prod.do" enctype="multipart/form-data">
							<div class="form-group d-flex justify-content-around">
								<select class="category1 form-select form-select-sm"
									aria-label=".form-select-sm example">
									<option value="">1차 카테고리</option>
								</select> 
								<select name="category_tb_code" class="category2 form-select form-select-sm"
									aria-label=".form-select-sm example">
									<option value="">2차 카테고리</option>
								</select>
							</div>
							<div
								class="form-group mt-2 d-flex justify-content-between align-items-center">
								<input type="text" class="form-control"
									placeholder="상품명" name="prod_name">
							</div>
							<div
								class="form-group mt-2 d-flex justify-content-between align-items-center">
								<input type="text" class="form-control"
									placeholder="가격" name="prod_price">
							</div>
							<div
								class="form-group mt-2 d-flex justify-content-between align-items-center">
								<input type="text" class="form-control"
									placeholder="제조사" name="prod_co">
							</div>
							<div
								class="form-group mt-2 d-flex justify-content-between align-items-center">
								<input type="date" class="form-control"
									placeholder="출시일" name="prod_rdate">
							</div>
							<div
								class="form-group mt-2 d-flex justify-content-between align-items-center">
								<input type="text" class="form-control"
									placeholder="재고량" name="prod_stock">
							</div>
							<div
								class="form-group mt-2 d-flex justify-content-between align-items-center">
								<input type="text" class="form-control"
									placeholder="제품옵션1" name="prod_opt">
							</div>
							<div
								class="form-group mt-2 d-flex justify-content-between align-items-center">
								<input type="text" class="form-control"
									placeholder="제품옵션2" name="prod_opt">
							</div>
							<div
								class="form-group mt-2 d-flex justify-content-between align-items-center">
								<input type="text" class="form-control"
									placeholder="제품옵션3" name="prod_opt">
							</div>
							<div
								class="form-group mt-2 d-flex justify-content-between align-items-center">
								성인등급 여부 <input name="prod_rating" type="radio" value="1">Y <input
									name="prod_rating" type="radio" value="2">N
							</div>
							<div
								class="form-group mt-2 d-flex justify-content-between align-items-center">
								예약상품 여부 <input name="prod_reserv" type="radio" value="1">Y <input
									name="prod_reserv" type="radio" value="2">N
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
								<input type="submit"
									class="btn btn-outline-secondary btn-lg form-control"
									value="상품등록">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 검색폼 -->
		<div class="container">
			<form class="form-horizontal d-flex justify-content-center mt-3"
				role="form">
				<div>
					<select class="form-select form-select-sm"
						aria-label=".form-select-sm example">
						<option value="1">상품명</option>
						<option value="2">상품분류</option>
					</select>
				</div>
				<div class="mx-2">
					<input class="form-control form-control-sm" type="text"
						placeholder="" aria-label=".form-control-sm example">
				</div>
				<div>
					<button type="button" class="btn btn-outline-secondary btn-sm">검색</button>
				</div>
			</form>
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
<!-- 카테고리 -->
<script>
	// 데이터
	var jsonData = JSON.parse('${category}');
	console.log(jsonData);
	
	var cate1Arr = new Array();
	var cate1Obj = new Object();
	
	for( var i = 0; i < jsonData.length; i ++ )
	{
		if( jsonData[i].level == "1" )
		{
			cate1Obj = new Object();
			cate1Obj.cate_code = jsonData[i].cate_code;
			cate1Obj.cate_name = jsonData[i].cate_name;
			cate1Arr.push(cate1Obj);
		}
	}
	
	var cateSelect1 = $("select.category1");
	
	for( var i =0; i < cate1Arr.length; i++ )
	{
		cateSelect1.append("<option value='" + cate1Arr[i].cate_code + "'>" +cate1Arr[i].cate_name + "</option>");
	}
	
	$(document).on("change","select.category1",function(){
		var cate2Arr = new Array();
		var cate2Obj = new Object();
		
		for( var i = 0; i < jsonData.length; i++ )
		{
			if( jsonData[i].level == "2" )
			{
				cate2Obj = new Object();
				cate2Obj.cate_code = jsonData[i].cate_code;
				cate2Obj.cate_name = jsonData[i].cate_name;
				cate2Obj.cate_refcode = jsonData[i].cate_refcode;
				
				cate2Arr.push(cate2Obj);
			}
		}
		var cateSelect2 = $("select.category2");

		cateSelect2.children().remove();
		
		$("option:selected",this).each(function(){
			var selectVal = $(this).val();
			cateSelect2.append("<option value='"+ selectVal +"'>2차 카테고리</option>");
			
			for( var i = 0; i < cate2Arr.length; i++ )
			{
				if( selectVal == cate2Arr[i].cate_refcode )
				{
					cateSelect2.append("<option value='" + cate2Arr[i].cate_code + "'>" + cate2Arr[i].cate_name + "</option>");
				}
			}
		});
	});
	

</script>


<%@ include file="../include/foot.jsp" %>