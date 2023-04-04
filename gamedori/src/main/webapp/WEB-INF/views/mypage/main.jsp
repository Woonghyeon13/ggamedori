<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
<main>
	<!-- 마이페이지 클릭 시 첫 화면 ------------------------------------------------------------------------------------------------->
	<div id="mypage_inner" class="container">
		<h3>마이페이지</h3>
		<div id="mypage_1" class="col">
			<ul>
				<li>
					<h4>등급</h4>
					<p>브론즈,실버,골드 등등..</p>
				</li>
				<li>
					<h4>적립금</h4>
					<p>적립금 표시 ex) 2500원</p> <a href="<c:url value='/mypage/point.do' />">적립금 확인 > </a>
					<!--s_money_check.html -->
				</li>
				<li>
					<h4>쿠폰</h4>
					<p>쿠폰 개수 표시</p> <a href="<c:url value='/mypage/coupon.do' />">쿠폰 확인 > </a> <!-- coupon_check.html -->
				</li>
				<li>
					<h4>나의 후기</h4>
					<p>후기 개수 표시</p> <a href="<c:url value='/mypage/reviewlist.do' />">후기 확인 > </a> <!-- review_list.html -->
				</li>
			</ul>
		</div>

		<div id="mypage_inner2" class="container">
			<div id="mypage_list" class="col-3">
				<p id="nickname">
					<span>닉네임</span>님 환영합니다.
				</p>

				<ol id="ol_li" class="list-group list-group-numbered">
					<li class="list-group-item"><a href="<c:url value='/mypage/cart.do' />">장바구니</a></li>
					<li class="list-group-item"><a href="<c:url value='/mypage/prodqa.do' />">상품문의</a></li>
					<li class="list-group-item"><a href="<c:url value='/mypage/oto.do' />">1 : 1문의</a></li>
					<li class="list-group-item"><a href="<c:url value='/mypage/reviewlist.do' />">나의
							후기</a></li>
					<!-- review_list.html -->
					<li class="list-group-item"><a href="<c:url value='/user/modify.do' />">회원정보수정</a></li>
					<li class="list-group-item"><a href="<c:url value='/user/withdraw.do' />">탈퇴하기</a></li>
					<!-- unregister.html -->
				</ol>
			</div>
			<div id="detail_inner" class="col-8">
				<ul>
					<li>
						<div id="product_page" class="container">
							<p>최근 주문 내역</p>

						</div>
						<div id="product" class="container">
							<table class="table table-hover" class="container">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">상품 정보</th>
										<th scope="col">주문 일자</th>
										<th scope="col">주문 번호</th>
										<th scope="col">주문 금액</th>
										<th scope="col">주문 상태</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>1</th>
										<td>게임 1</td>
										<td>2023-03-08</td>
										<td>12345678</td>
										<td>10000원</td>
										<td>주문 완료</td>
									</tr>
									<tr>
										<th>2</th>
										<td>게임 2</td>
										<td>2023-03-08</td>
										<td>22345678</td>
										<td>10000원</td>
										<td>주문 완료</td>
									</tr>
									<tr>
										<th>3</th>
										<td>게임 3</td>
										<td>2023-03-08</td>
										<td>32345678</td>
										<td>10000원</td>
										<td>주문 완료</td>
									</tr>
									<tr>
										<th>4</th>
										<td>게임 4</td>
										<td>2023-03-08</td>
										<td>42345678</td>
										<td>10000원</td>
										<td>주문 준비중</td>
									</tr>
								</tbody>
							</table>
							<p id="breakdown1">
								<a href="<c:url value='/mypage/prodlist.do' />">...더보기</a>
							</p>
							<!-- product_list.html -->
						</div>
					</li>

					<li>
						<div id="enquiry_page" class="container">
							<p>상품 문의</p>

						</div>
						<div id="enquiry" class="container">
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">상품 정보</th>
										<th scope="col">문의 제목</th>
										<th scope="col">주문 번호</th>
										<th scope="col">작성 일자</th>
										<th scope="col">처리 상태</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>1</th>
										<td>게임 1</td>
										<td>문의 제목입니다.</td>
										<td>12345678</td>
										<td>2023-03-08</td>
										<td>답변 완료</td>
									</tr>
									<tr>
										<th>2</th>
										<td>게임 2</td>
										<td>문의 제목입니다.</td>
										<td>22345678</td>
										<td>2023-03-08</td>
										<td>답변 완료</td>
									</tr>
									<tr>
										<th>3</th>
										<td>게임 3</td>
										<td>문의 제목입니다.</td>
										<td>32345678</td>
										<td>2023-03-08</td>
										<td>답변 완료</td>
									</tr>
									<tr>
										<th>4</th>
										<td>게임 4</td>
										<td>문의 제목입니다.</td>
										<td>42345678</td>
										<td>2023-03-08</td>
										<td>답변 처리중</td>
									</tr>
								</tbody>
							</table>
							<p id="breakdown1">
								<a href="<c:url value='/mypage/prodqa.do' />">...더보기</a>
							</p>
							<!-- enquiry_list.html -->
						</div>

					</li>

					<li>
						<div id="one_to_one_page" class="container">
							<p>1 : 1 문의</p>

							<!-- 문의 유형 : [ 회원가입 / 결제 및 배송 / 교환 및 환불 / 적립금 / 기타 ] -->
						</div>
						<div id="one_to_one" class="container">
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">문의 유형</th>
										<th scope="col">문의 제목</th>
										<th scope="col">주문 번호</th>
										<th scope="col">작성 일자</th>
										<th scope="col">처리 상태</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>1</th>
										<td>회원가입</td>
										<td>문의 제목입니다.</td>
										<td>12345678</td>
										<td>2023-03-08</td>
										<td>답변 완료</td>
									</tr>
									<tr>
										<th>2</th>
										<td>결제 및 배송</td>
										<td>문의 제목입니다.</td>
										<td>22345678</td>
										<td>2023-03-08</td>
										<td>답변 완료</td>
									</tr>
									<tr>
										<th>3</th>
										<td>교환 및 환불</td>
										<td>문의 제목입니다.</td>
										<td>32345678</td>
										<td>2023-03-08</td>
										<td>답변 완료</td>
									</tr>
									<tr>
										<th>4</th>
										<td>적립금</td>
										<td>문의 제목입니다.</td>
										<td>42345678</td>
										<td>2023-03-08</td>
										<td>답변 처리중</td>
									</tr>
								</tbody>
							</table>
							<p id="breakdown1">
								<a href="<c:url value='/mypage/oto.do' />">...더보기</a>
							</p>
							<!-- one_to_one_list.html -->
						</div>
					</li>

					<li>
						<div id="review_page" class="container">
							<p>나의 후기</p>

						</div>
						<div id="review" class="container">
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">상품 정보</th>
										<th scope="col">후기 제목</th>
										<th scope="col">작성자 명</th>
										<th scope="col">작성 일자</th>
										<th scope="col">별 점</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>1</th>
										<td>게임 1</td>
										<td>후기 제목입니다.</td>
										<td>abc1234</td>
										<td>2023-03-08</td>
										<td>★★★★★</td>
									</tr>
									<tr>
										<th>2</th>
										<td>게임 2</td>
										<td>후기 제목입니다.</td>
										<td>def1234</td>
										<td>2023-03-08</td>
										<td>★★★★★</td>
									</tr>
									<tr>
										<th>3</th>
										<td>게임 3</td>
										<td>후기 제목입니다.</td>
										<td>ghi1234</td>
										<td>2023-03-08</td>
										<td>★★★★★</td>
									</tr>
									<tr>
										<th>4</th>
										<td>게임 4</td>
										<td>후기 제목입니다.</td>
										<td>jkl1234</td>
										<td>2023-03-08</td>
										<td>★★★★★</td>
									</tr>

								</tbody>
							</table>
							<p id="breakdown1">
								<a href="<c:url value='/mypage/reviewlist.do' />">...더보기</a>
							</p>
							<!-- review_list.html -->
						</div>
					</li>

				</ul>
			</div>
		</div>
		<!-- end:#mypage_inner2 -->
	</div>
	<!-- end:#mypage_inner -->

</main>
<!-- end : main ----------------------->

<%@ include file="../include/foot.jsp" %>