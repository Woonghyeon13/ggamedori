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
					
						<input type="hidden" name="memberemail" id="memberemail" value="${Login.member_email}">
						<strong>비밀번호를 한번 더 입력해주세요</strong>
						<p id="a">
							비밀번호가 로그인한 아이디와 일치할때 회원탈퇴를 누르면  <span id="unre">회원탈퇴</span>가 완료됩니다.
						</p>
						<br>
						<p>
							현재 로그인된 아이디 : ${Login.member_email}</span>
						</p>
						<div class="mb-3">
							<input type="password" class="form-control" name="memberpw" 
								id="memberpw" placeholder="비밀번호를 입력하세요" required>
						</div>
						<button type="submit" class="btn btn-danger" onclick="submitForm()">탈퇴하기</button>
						<br> <br> <a href="#">홈으로</a>
					
				</div>
			</div>

		</div>
		<!-- end:#mypage_inner2 -->
	</div>
	<!-- end:#mypage_inner -->

	<!---------------------------------------------------------------------------->
	<script>
	function submitForm() {
		event.preventDefault(); // 폼 제출을 방지

		// 이메일과 비밀번호를 가져옵니다.
		const memberEmail = document.getElementById("memberemail").value;
		const memberPw = document.getElementById("memberpw").value;

		// Ajax 요청을 작성하여 회원 탈퇴를 처리하고 결과를 받아옵니다.
		$.ajax({
			type: "POST",
			url: "<%=request.getContextPath()%>/user/Member_delete.do",
			data: {
				member_email: memberEmail,
				member_pw: memberPw
			},
			success: function (response) {
				if (response.result === "1") {
					// 회원 탈퇴 성공
					alert("회원탈퇴가 정상적으로 성공하였습니다.");
					window.location.href = "<%=request.getContextPath()%>/"; // 홈으로 이동
				} else {
					// 회원 탈퇴 실패
					alert("회원 정보가 올바르지 않습니다.");
				}
			},
			error: function (error) {
				// 서버 오류 처리
				console.error("Error:", error);
				alert("서버 오류가 발생했습니다. 다시 시도해 주세요.");
			}
		});
	}
	
	// 로그인 세션 확인 후 비어있으면 메인 페이지로 이동
	$(document).ready(function () {
	    if (!${!empty Login}) { // 로그인 세션이 비어있는 경우
	        alert("로그인이 필요한 페이지입니다.");
	        window.location.href = "<%=request.getContextPath()%>/"; // 메인 페이지로 이동
	    }
	});
</script>



</main>

<%@ include file="../include/foot.jsp" %>