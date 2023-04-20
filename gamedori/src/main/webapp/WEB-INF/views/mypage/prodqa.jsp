<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
<main>

	<!-- 상품 문의 전체보기 ----------------------------------------------------- -->

	
	<div class="container mypage_inner">
		<h4>상품 문의 전체보기</h4>
			<div id="mypage_1" class="col">
				<ul>
					<li>
						<h4>등급</h4>
						<p>
						<c:choose>
							<c:when test="${level == 1}">
							    <c:out value="브론즈" />
							</c:when>
							<c:when test="${level == 2}">
							    <c:out value="실버" />
							 </c:when>
							 <c:when test="${level == 3}">
							    <c:out value="골드" />
							 </c:when>
							 
						</c:choose>
						</p>
					</li>
					<li>
						<h4>적립금</h4>
						<p><c:out value="${PointBalance}"/>원</p> <a href="<c:url value='/mypage/point.do' />">적립금 확인 > </a>
						<!--s_money_check.html -->
					</li>
					<li>
						<h4>쿠폰</h4>
						<p> <c:out value="${CouponCount}"/>개</p> <a href="<c:url value='/mypage/coupon.do' />">쿠폰 확인 > </a> <!-- coupon_check.html -->
					</li>
					<li>
						<h4>나의 후기</h4>
						<p><c:out value="${ReviewCount}"/>개</p> <a href="<c:url value='/mypage/reviewlist.do' />">후기 확인 > </a> <!-- review_list.html -->
					</li>
				</ul>
			</div>
		<div id="mypage_inner2" class="container">
			<div id="mypage_list" class="col-3">
				<p id="nickname">
					<strong>${sessionScope.Login.member_name}</strong>님 환영합니다.
				</p>

				<ol id="ol_li" class="list-group list-group-numbered">
					<li class="list-group-item"><a href="<c:url value='/mypage/cart.do' />">장바구니</a></li>
					<li class="list-group-item"><a href="<c:url value='/mypage/prodqa.do' />">상품문의</a></li>
					<li class="list-group-item"><a href="<c:url value='/mypage/prodlist.do' />">주문내역</a></li>
					<li class="list-group-item"><a href="<c:url value='/mypage/oto.do' />">1 : 1문의</a></li>
					<li class="list-group-item"><a href="<c:url value='/mypage/reviewlist.do' />">나의
							후기</a></li>
					<!-- review_list.html -->
					<li class="list-group-item"><a href="<c:url value='/user/modify.do' />">회원정보수정</a></li>
					<li class="list-group-item"><a href="<c:url value='/user/withdraw.do' />">탈퇴하기</a></li>
					<!-- unregister.html -->
				</ol>
			</div>
			<div id="enquiry_inner" class="col-8">
				<p>
					<strong>${sessionScope.Login.member_name}</strong>님의 상품문의 내역
				</p>
				<table id="enquiry_t" class="table table-hover text-center"
					style="width: 100%; border-top: 1px solid #000;">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">상품 정보</th>
							<th scope="col">문의 제목</th>
							<th scope="col">작성 일자</th>
							<th scope="col">처리 상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${selectQAList}" var="vo">
							<tr>
								<th class="table_number"></th>
								<td>
									<c:choose>
									<c:when test="${vo.prod_q_yn == 1}">
										<img src= "<c:url value='/images/비밀글자물쇠.png'/>">
									</c:when>
									</c:choose>
									${vo.prod_name}
								</td>
								<td>${vo.prod_q_title}</td>	
								<td class="wdate">${vo.prod_q_wdate}</td>
								<td>
									<c:choose>
										<c:when test="${vo.prod_q_yn == 1}">
											<c:out value="접수완료" />
										</c:when>
										<c:when test="${vo.prod_q_yn == 2}">
											<c:out value="답변완료" />
										</c:when>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			<!-- end:#enquiry_inner -->

		</div>
		<!-- end:#mypage_inner2 -->

		<div id="paging" class="container ">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center text-black">
					<li class="page-item"><a class="page-link text-reset" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item"><a class="page-link text-reset" href="#">1</a></li>
					<li class="page-item"><a class="page-link text-reset" href="#">2</a></li>
					<li class="page-item"><a class="page-link text-reset" href="#">3</a></li>
					<li class="page-item"><a class="page-link text-reset" href="#">4</a></li>
					<li class="page-item"><a class="page-link text-reset" href="#">5</a></li>
					<li class="page-item"><a class="page-link text-reset" href="#">6</a></li>
					<li class="page-item"><a class="page-link text-reset" href="#">7</a></li>
					<li class="page-item"><a class="page-link text-reset" href="#">8</a></li>
					<li class="page-item"><a class="page-link text-reset" href="#">9</a></li>
					<li class="page-item"><a class="page-link text-reset" href="#">10</a></li>
					<li class="page-item"><a class="page-link text-reset" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>


	</div>
	<!-- end:#mypage_inner -->
	<!---------------------------------------------------------------------------->


</main>
<%@ include file="../include/foot.jsp"%>