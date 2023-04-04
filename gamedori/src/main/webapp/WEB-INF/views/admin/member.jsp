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
				<li class="nav-item">
					<!-- 선택시 클래스 fw-bold --> <a
					class="nav-link active text-reset fw-bold" aria-current="page"
					href="<c:url value='/admin/member.do' />">회원 관리</a>
				</li>
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/prod.do' />">상품관리</a>
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
	<!-- 회원관리 -->
	<div class="container mt-5">
		<!-- 회원 정지 폼 -->
		<div class="container">
			<form action="">
				<table class="table">
					<thead class="table-light">
						<tr>
							<th scope="col ">회원번호</th>
							<th scope="col">ID</th>
							<th scope="col">이름</th>
							<th scope="col">주소</th>
							<th scope="col">연락처</th>
							<th scope="col">EMAIL</th>
							<th scope="col">등급</th>
							<th scope="col">상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
							<td><select class="form-select"
								aria-label="Default select example">
									<option selected>정상</option>
									<option value="2">일시정지</option>
									<option value="3">정지</option>
							</select></td>

						</tr>
						<tr>
							<th scope="row">2</th>
							<td>Jacob</td>
							<td>Thornton</td>
							<td>@fat</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
							<td><select class="form-select"
								aria-label="Default select example">
									<option selected>정상</option>
									<option value="2">일시정지</option>
									<option value="3">정지</option>
							</select></td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td colspan="1">Larry the Bird</td>
							<td>@twitter</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
							<td>Otto</td>
							<td><select class="form-select"
								aria-label="Default select example">
									<option selected>정상</option>
									<option value="2">일시정지</option>
									<option value="3">정지</option>
							</select></td>
						</tr>
						<tr>
							<th scope="row">4</th>
							<td colspan="1">Larry the Bird</td>
							<td>@twitter</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
							<td>Otto</td>
							<td><select class="form-select"
								aria-label="Default select example">
									<option selected>정상</option>
									<option value="2">일시정지</option>
									<option value="3">정지</option>
							</select></td>
						</tr>
						<tr>
							<th scope="row">5</th>
							<td colspan="1">Larry the Bird</td>
							<td>@twitter</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
							<td>Otto</td>
							<td><select class="form-select"
								aria-label="Default select example">
									<option selected>정상</option>
									<option value="2">일시정지</option>
									<option value="3">정지</option>
							</select></td>
						</tr>
						<tr>
							<th scope="row">6</th>
							<td colspan="1">Larry the Bird</td>
							<td>@twitter</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
							<td>Otto</td>
							<td><select class="form-select"
								aria-label="Default select example">
									<option selected>정상</option>
									<option value="2">일시정지</option>
									<option value="3">정지</option>
							</select></td>
						</tr>
						<tr>
							<th scope="row">7</th>
							<td colspan="1">Larry the Bird</td>
							<td>@twitter</td>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
							<td>Otto</td>
							<td><select class="form-select"
								aria-label="Default select example">
									<option selected>정상</option>
									<option value="2">일시정지</option>
									<option value="3">정지</option>
							</select></td>
						</tr>
					</tbody>
				</table>
		</div>
		<div class="container d-flex justify-content-end">
			<button type="button"
				class="btn btn-outline-secondary btn-sm ms-2 me-4">승인</button>
		</div>
		</form>

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