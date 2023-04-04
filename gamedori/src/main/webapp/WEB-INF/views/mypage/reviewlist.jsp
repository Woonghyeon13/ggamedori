<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
<main>

	<!-- 리뷰 전체보기 --------------------------------------------------------- -->

	<div class="container mypage_inner">
		<h4>후기 전체보기</h4>
		<div id="mypage_1" class="col">
			<ul>
				<li>
					<h5>등급</h5>
					<p>브론즈,실버,골드 등등..</p>
				</li>
				<li>
					<h5>적립금</h5>
					<p>적립금 표시 ex) 2500원</p> <a href="<c:url value='/mypage/point.do'/>">적립금
						확인 > </a> <!--s_money2.html-->
				</li>
				<li>
					<h5>쿠폰</h5>
					<p>쿠폰 개수 표시</p> <a href="<c:url value='/mypage/coupon.do'/>">쿠폰
						확인 > </a> <!-- coupon_check2.html-->
				</li>
				<li>
					<h5>나의 후기</h5>
					<p>후기 개수 표시</p> <a href="<c:url value='/mypage/reviewlist.do'/>">후기
						확인 > </a> <!-- review_check2.html-->
				</li>
			</ul>
		</div>
		<div id="mypage_inner2" class="container">
			<div id="mypage_list" class="col-3">
				<p id="nickname">
					<strong>닉네임</strong>님 환영합니다.
				</p>

				<ol id="ol_li" class="list-group list-group-numbered">
					<li class="list-group-item"><a
						href="<c:url value='/mypage/cart.do'/>">장바구니</a></li>
					<li class="list-group-item"><a
						href="<c:url value='/mypage/prodqa.do'/>">상품문의</a></li>
					<li class="list-group-item"><a
						href="<c:url value='/mypage/oto.do'/>">1 : 1문의</a></li>
					<li class="list-group-item"><a
						href="<c:url value='/mypage/reviewlist.do'/>">나의 후기</a></li>
					<li class="list-group-item"><a
						href="<c:url value='/user/modify.do'/>">회원정보수정</a></li>
					<li class="list-group-item"><a
						href="<c:url value='/user/withdraw.do'/>">탈퇴하기</a></li>
					<!-- unregister2.html -->
				</ol>
			</div>
			<div id="review_inner" class="col-8">
				<div id="select">
					<p>
						<strong>닉네임</strong>님이 작성한 후기모음
					</p>
					<div class="input-group mb-3">
						<input type="text" class="form-control"
							aria-describedby="basic-addon2"> <span
							class="input-group-text" id="basic-addon2"> <select
							class="form-select" aria-label="Default select example">
								<option value="1">제목</option>
								<option value="2">상품 정보</option>
						</select>
						</span>
						<button type="button" class="btn btn-outline-secondary">
							<i class="xi-search"></i>
						</button>
					</div>
				</div>
				<table id="review_t" class="table table-hover"
					style="border-top: 1px solid #000;">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">상품 정보</th>
							<th scope="col">제목</th>
							<th scope="col">이름</th>
							<th scope="col">작성일자</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>게임 1</td>
							<td>후기 제목입니다.</td>
							<td>abc****</td>
							<td>2023-03-08</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>게임 2</td>
							<td>후기 제목입니다.</td>
							<td>abc****</td>
							<td>2023-03-08</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>게임 3</td>
							<td>후기 제목입니다.</td>
							<td>abc****</td>
							<td>2023-03-08</td>
						</tr>
						<tr>
							<th scope="row">4</th>
							<td>게임 4</td>
							<td>후기 제목입니다.</td>
							<td>abc****</td>
							<td>2023-03-08</td>
						</tr>
						<tr>
							<th scope="row">5</th>
							<td>게임 5</td>
							<td>후기 제목입니다.</td>
							<td>abc****</td>
							<td>2023-03-08</td>
						</tr>
						<tr>
							<th scope="row">6</th>
							<td>게임 6</td>
							<td>후기 제목입니다.</td>
							<td>abc****</td>
							<td>2023-03-08</td>
						</tr>
						<tr>
							<th scope="row">7</th>
							<td>게임 7</td>
							<td>후기 제목입니다.</td>
							<td>abc****</td>
							<td>2023-03-08</td>
						</tr>
						<tr>
							<th scope="row">8</th>
							<td>게임 8</td>
							<td>후기 제목입니다.</td>
							<td>abc****</td>
							<td>2023-03-08</td>
						</tr>
						<tr>
							<th scope="row">9</th>
							<td>게임 9</td>
							<td>후기 제목입니다.</td>
							<td>abc****</td>
							<td>2023-03-08</td>
						</tr>
						<tr>
							<th scope="row">10</th>
							<td>게임 10</td>
							<td>후기 제목입니다.</td>
							<td>abc****</td>
							<td>2023-03-08</td>
						</tr>
					</tbody>
				</table>

				<div id="paging" class="container">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center text-black">
							<li class="page-item"><a class="page-link text-reset"
								href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item"><a class="page-link text-reset"
								href="#">1</a></li>
							<li class="page-item"><a class="page-link text-reset"
								href="#">2</a></li>
							<li class="page-item"><a class="page-link text-reset"
								href="#">3</a></li>
							<li class="page-item"><a class="page-link text-reset"
								href="#">4</a></li>
							<li class="page-item"><a class="page-link text-reset"
								href="#">5</a></li>
							<li class="page-item"><a class="page-link text-reset"
								href="#">6</a></li>
							<li class="page-item"><a class="page-link text-reset"
								href="#">7</a></li>
							<li class="page-item"><a class="page-link text-reset"
								href="#">8</a></li>
							<li class="page-item"><a class="page-link text-reset"
								href="#">9</a></li>
							<li class="page-item"><a class="page-link text-reset"
								href="#">10</a></li>
							<li class="page-item"><a class="page-link text-reset"
								href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>
			</div>

		</div>
		<!-- end:#review_inner -->

	</div>
	<!-- end:#mypage_inner2 -->
	<!-- end:#mypage_inner -->

	<!---------------------------------------------------------------------------->


</main>


<%@ include file="../include/foot.jsp" %>