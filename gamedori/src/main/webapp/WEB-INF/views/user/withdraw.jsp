<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>

<main>

	<!-- 탈퇴하기 -------------------------------------------------------------- -->

	<div id="mypage_inner" class="container">
		<h4>탈퇴하기</h4>
		<div id="mypage_1" class="col">
			<ul>
				<li>
					<h5>등급</h5>
					<p>브론즈,실버,골드 등등..</p>
				</li>
				<li>
					<h5>적립금</h5>
					<p>적립금 표시 ex) 2500원</p> <a href="<c:url value='/mypage/point' />">적립금 확인 > </a>
					<!--s_money2.html-->
				</li>
				<li>
					<h5>쿠폰</h5>
					<p>쿠폰 개수 표시</p> <a href="<c:url value='/mypage/coupon' />">쿠폰 확인 > </a> <!-- coupon_check2.html-->
				</li>
				<li>
					<h5>나의 후기</h5>
					<p>후기 개수 표시</p> <a href="<c:url value='/mypage/reviewlist' />">후기 확인 > </a> <!-- review_check2.html-->
				</li>
			</ul>
		</div>
		<div id="mypage_inner2" class="container">
			<div id="mypage_list" class="col-3">
				<p id="nickname">
					<span>닉네임</span>님 환영합니다.
				</p>

				<ol id="ol_li" class="list-group list-group-numbered">
					<li class="list-group-item"><a href="<c:url value='/mypage/cart' />">장바구니</a></li>
					<li class="list-group-item"><a href="<c:url value='/mypage/prodqa' />">상품문의</a></li>
					<li class="list-group-item"><a href="<c:url value='/mypage/oto' />">1 : 1문의</a></li>
					<li class="list-group-item"><a href="<c:url value='/mypage/reviewlist' />">나의
							후기</a></li>
					<li class="list-group-item"><a href="<c:url value='/user/modify' />">회원정보수정</a></li>
					<li class="list-group-item"><a href="<c:url value='/user/withdraw' />">탈퇴하기</a></li>
					<!-- unregister2.html -->
				</ol>
			</div>
			<div id="unregister_inner" class="col-8">
				<div id="logo_img" class="col-2">
					<img src="<c:url value='/images/gamedori.png' />">
				</div>
				<div id="unre_input" class="col-9">
					<strong>비밀번호를 한번 더 입력해주세요</strong>
					<p id="a">
						비밀번호를 입력하시면 <span id="unre">회원탈퇴</span>가 완료됩니다.
					</p>
					<br>
					<p>
						현재 로그인된 아이디 : <span id="id">ezen1234</span>
					</p>
					<div class="mb-3">
						<input type="password" class="form-control"
							id="exampleFormControlInput1" placeholder="비밀번호를 입력하세요">
					</div>
					<button type="button" class="btn btn-danger">탈퇴하기</button>
					<br> <br> <a href="#">홈으로</a>
				</div>
			</div>

		</div>
		<!-- end:#mypage_inner2 -->
	</div>
	<!-- end:#mypage_inner -->

	<!---------------------------------------------------------------------------->


</main>

<%@ include file="../include/foot.jsp" %>