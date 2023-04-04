<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
<main>

	<!-- 적립금 확인------------------------------------------------------------ -->

	<div id="mypage_inner" class="container">
		<h4>적립금 확인</h4>
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
			<div id="s_money_inner" class="col-8">
				<p>
					<strong>닉네임</strong>님의 적립금 내역
				</p>
				<table id="s_money_t" class="table table-hover"
					style="width: 100%; border-top: 1px solid #000;">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">적립금 지급 일</th>
							<th scope="col">적립금 만료 일</th>
							<th scope="col">내용</th>
							<th scope="col">지급 금액</th>

						</tr>
					</thead>
					<tbody>
						<tr>
							<th>1</th>
							<td>2023-03-09</td>
							<td>2024-03-09</td>
							<td>10만원 이상 구매</td>
							<td>+ 2000</td>
						</tr>
						<tr>
							<th>2</th>
							<td>2023-03-09</td>
							<td>2024-03-09</td>
							<td>10만원 이상 구매</td>
							<td>+ 2000</td>
						</tr>
						<tr>
							<th>3</th>
							<td>2023-03-09</td>
							<td>2024-03-09</td>
							<td>10만원 이상 구매</td>
							<td>+ 2000</td>
						</tr>
						<tr>
							<th>4</th>
							<td>2023-03-09</td>
							<td>2024-03-09</td>
							<td>10만원 이상 구매</td>
							<td>+ 2000</td>
						</tr>
						<tr>
							<th>5</th>
							<td>2023-03-09</td>
							<td>2024-03-09</td>
							<td>10만원 이상 구매</td>
							<td>+ 2000</td>
						</tr>
						<tr>
							<th>6</th>
							<td>2023-03-09</td>
							<td>2024-03-09</td>
							<td>10만원 이상 구매</td>
							<td>+ 2000</td>
						</tr>
						<tr>
							<th>7</th>
							<td>2023-03-09</td>
							<td>2024-03-09</td>
							<td>10만원 이상 구매</td>
							<td>+ 2000</td>
						</tr>
						<tr>
							<th>8</th>
							<td>2023-03-09</td>
							<td>2024-03-09</td>
							<td>10만원 이상 구매</td>
							<td>+ 2000</td>
						</tr>
						<tr>
							<th>9</th>
							<td>2023-03-09</td>
							<td>2024-03-09</td>
							<td>10만원 이상 구매</td>
							<td>+ 2000</td>
						</tr>
						<tr>
							<th>10</th>
							<td>2023-03-09</td>
							<td>2024-03-09</td>
							<td>10만원 이상 구매</td>
							<td>+ 2000</td>
						</tr>
					</tbody>

					</div>
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
				<!-- end:#paging-->
				<div id="money_contents" class="container">
					<ul>
						<li>보유 적립금</li>
						<li>사용 금액</li>
						<li>남은 적립금</li>
					</ul>
				</div>
				<hr>
				<div id="use_money" class="container">
					<ul>
						<li>10000</li>
						<li>3000</li>
						<li>7000</li>
					</ul>
				</div>
			</div>


		</div>
		<!-- end:#s_money_inner -->





	</div>
	<!-- end:#mypage_inner2 -->

	</div>
	<!-- end:#mypage_inner -->

	<!---------------------------------------------------------------------------->


</main>



<%@ include file="../include/foot.jsp" %>