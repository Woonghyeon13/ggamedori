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
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/prod.do' />">상품관리</a>
				</li>
				<li class="nav-item">
					<!-- 선택시 클래스 fw-bold --> <a
					class="nav-link text-reset active fw-bold" href="<c:url value='/admin/asreturn.do' />">A/S 관리</a>
				</li>
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/qaprod.do' />">문의/공지관리</a>
				</li>
			</ul>
		</div>
	</div>
	<!-- a/s 탭  -->
	<div class="container">
		<ul class="nav justify-content-end text-black">
			<li class="nav-item"><a
				class="nav-link active text-reset fw-bold" aria-current="page"
				href="<c:url value='/admin/asreturn.do' />">반품 관리</a></li>
			<li class="nav-item" style="margin-right: 410px;"><a
				class="nav-link text-reset" href="<c:url value='/admin/asrefund.do' />">환불 관리</a></li>
		</ul>
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
			<table class="table table-sm">
				<thead class="table-light">
					<tr>
						<th scope="col">반품신청일</th>
						<th scope="col">주문번호</th>
						<th scope="col">상품명</th>
						<th scope="col">주문자</th>
						<th scope="col">상태</th>
						<th style="width: 120px;" scope="col">반품처리</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>2023-03-29</td>
						<td>ere2185152</td>
						<td>ㄴㅇㄹㅇㄴㅇ</td>
						<td>Mark</td>
						<td>반품접수</td>
						<td>
							<button type="button" class="btn btn-secondary btn-sm"
								data-bs-toggle="modal" data-bs-target="#prodRefund">반품정보</button>
						</td>
					</tr>

				</tbody>
			</table>
		</div>

		<!-- 반품 관리 -->
		<div class="modal fade" id="prodRefund">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header d-flex flex-column logo">
						<div class="mt-2">
							<h4 class="modal-title fs-5">반품 정보</h4>
						</div>
					</div>
					<div class="modal-body">
						<form name="review" method="post" action="loginAction.jsp">
							<div
								class="form-group d-flex flex-column justify-content-center align-items-center">
								<div>반품 신청 제목</div>
								<input type="text" class="form-control">
							</div>
							<div
								class="form-group mt-2 d-flex flex-column justify-content-center align-items-center">
								<div>반품 신청 사유</div>
								<textarea name="" id="" class="form-control" cols="30" rows="10"></textarea>
							</div>
							<div
								class="form-group mt-2 d-flex flex-column justify-content-center align-items-center">
								<div>반품 승인/거절 사유</div>
								<textarea name="" id="" class="form-control" cols="30" rows="10"></textarea>
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


<%@ include file="../include/foot.jsp" %>