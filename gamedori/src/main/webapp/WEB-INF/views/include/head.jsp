<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>겜도리</title>
	<!--파비콘-->
	<link href="<c:url value='/resources/images/f.png'/>" rel="shortcut icon">
	<!-- 스타일 시트 연결 -->
	<link rel="stylesheet" href="<c:url value='/resources/css/reset.css'/>" >
	<link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>" >
	<!-- 부트스트랩 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
	<!-- 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@900&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gowun+Dodum&family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
	<!--jquery-->
	<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
	<!--xeicon-->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<!--자바스크립트-->
	<script src="<c:url value='/resources/js/script.js'/>"></script>

</head>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>겜도리</title>
	<!--파비콘-->
	<link href="<c:url value='/resources/images/f.png'/>" rel="shortcut icon">
	<!-- 스타일 시트 연결 -->
	<link rel="stylesheet" href="<c:url value='/resources/css/reset.css'/>" >
	<link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>" >
	<!-- 부트스트랩 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
	<!-- 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@900&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gowun+Dodum&family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
	<!--jquery-->
	<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
	<!--xeicon-->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<!--자바스크립트-->
	<script src="<c:url value='/resources/js/script.js'/>"></script>

</head>
<body>
	<header class="pt-4 pb-3 border-bottom border-2 mb-5">
		<div class="container">
			<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
				<a href="<c:url value='/'/>" id="logo" class="d-flex align-items-center mb-2 mb-lg-0 text-decoration-none">
					GAMEDORI
				</a>
				
				<div class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
				</div>
		
				<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3 text-end" role="search">
					<input type="search" class="form-control form-control-dark" placeholder="Search..." aria-label="Search">
				</form>
		
				<div class="text-end">
					<ul class="d-flex flex-row mb-0 ps-0">
						<c:if test="${empty sessionScope.Login}">
						  <li><button type="button" class="btn btn-outline-light login me-2" data-bs-toggle="modal" data-bs-target="#login">로그인</button></li>
						</c:if>
						<c:if test="${not empty sessionScope.Login}">
						  <li>${sessionScope.Login}님<br/> 환영합니다!</li>
						</c:if>
						<c:if test="${not empty sessionScope.Login}">
						  <li><button type="button" class="btn btn-outline-light join me-2" ><a href="<c:url value='/user/logout.do'/>">로그아웃</a></button></li>
						</c:if>
					
						
						<li><button type="button" class="btn btn-outline-light join me-2"><a href="<c:url value='/user/join.do'/>">회원가입</a></button></li>
						<!-- 로그인 성공시  -->
						<li><button type="button" class="btn btn-outline-light join me-2"><a href="<c:url value='/mypage/main.do'/>">마이페이지</a></button></li>
						<li><button type="button" class="btn btn-outline-light join me-2"><a href="<c:url value='/admin/member.do'/>">관리자페이지</a></button></li>
						<!-- ----- -->
						<li><a href="<c:url value='/mypage/cart.do'/>" class="nav-link me-2 mt-1 text-muted" title="장바구니"><i class="xi-cart-o xi-2x"></i></a></li>
						<li><a href="<c:url value='/mypage/wishlist.do'/>" class="nav-link mt-1 text-muted" title="찜 목록"><i class="xi-heart-o xi-2x jjim"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	
		<!-- 내비게이션 -->
		<div class="container">
			<div class="d-flex justify-content-center py-3">
				<ul class="nav nav-pills">
					<li class="nav-item"><a href="<c:url value='/prod/list.do'/>" class="nav-link" style="color: black;">새로운상품</a></li>
					<li class="nav-item"><a href="<c:url value='/prod/list.do'/>" class="nav-link" style="color: black;">예약판매</a></li>
					<li class="nav-item dropdown"><a href="<c:url value='/prod/list.do'/>" class="nav-link" style="color: black;">닌텐도 Switch</a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value='/prod/list.do'/>" class="dropdown-item" type="button">하드웨어</a></li>
							<li><a href="<c:url value='/prod/list.do'/>" class="dropdown-item mt-1" type="button">타이틀</a></li>
							<li><a href="<c:url value='/prod/list.do'/>" class="dropdown-item mt-1" type="button">주변기기</a></li>
							<li><a href="<c:url value='/prod/list.do'/>" class="dropdown-item mt-1" type="button">아미보</a></li>
						</ul>
					</li>
					<li class="nav-item dropdown"><a href="<c:url value='/prod/list.do'/>" class="nav-link" style="color: black;">PlayStation 5</a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value='/prod/list.do'/>" class="dropdown-item" type="button">하드웨어</a></li>
							<li><a href="<c:url value='/prod/list.do'/>" class="dropdown-item mt-1" type="button">타이틀</a></li>
							<li><a href="<c:url value='/prod/list.do'/>" class="dropdown-item mt-1" type="button">주변기기</a></li>
						</ul>
					</li>
					<li class="nav-item dropdown"><a href="<c:url value='/prod/list.do'/>" class="nav-link" style="color: black;">PlayStation 4</a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value='/prod/list.do'/>" class="dropdown-item" type="button">하드웨어</a></li>
							<li><a href="<c:url value='/prod/list.do'/>" class="dropdown-item mt-1" type="button">타이틀</a></li>
							<li><a href="<c:url value='/prod/list.do'/>" class="dropdown-item mt-1" type="button">주변기기</a></li>
						</ul>
					</li>
					<li class="nav-item dropdown"><a href="<c:url value='/prod/list.do'/>" class="nav-link" style="color: black;">XBOX Series</a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value='/prod/list.do'/>" class="dropdown-item" type="button">하드웨어</a></li>
							<li><a href="<c:url value='/prod/list.do'/>" class="dropdown-item mt-1" type="button">타이틀</a></li>
							<li><a href="<c:url value='/prod/list.do'/>" class="dropdown-item mt-1" type="button">주변기기</a></li>
						</ul>
					</li>
					<li class="nav-item dropdown"><a href="<c:url value='/prod/list.do'/>" class="nav-link" style="color: black;">GOODS</a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value='/prod/list.do'/>" class="dropdown-item" type="button">피규어</a></li>
						</ul>
					</li>
					<li class="nav-item"><a href="<c:url value='/customersc/main.do'/>" class="nav-link" style="color: black;">고객지원</a></li>
				</ul>
			</div>
		</div>

		<!--모달 로그인--------------------------------------------------------------------------------------->
		<div class="modal fade" tabindex="-1" id="login">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="d-flex justify-content-end mt-3 me-3">
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="">
						<p class="text-center" id="logo">GAMEDORI</p>
					</div>
					<div class="modal-body">
						<form action="<c:url value='/user/login.do'/>" method="post">
							<table>
								<tr>
									<td style="width: 500px;">
										<h5 style="margin-left: 200px; margin-top: 20px; font-weight: bold;">로그인</h5>
									</td>
								</tr>
								<tr>
									<td>
										<div class="mb-3">
											<input style="margin-top: 20px;"type="email" class="form-control" id="member_email" name="member_email" placeholder="이메일을 입력하세요">
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<input type="password" class="form-control" id="member_pw" name="member_pw" placeholder="비밀번호를 입력하세요">
									</td>
								</tr>
								<tr>
									<td>
										<button class="btn btn-outline-light login" style="width: 460px; margin-top: 30px; font-weight: bold; font-size: 20px;">로그인</button>
									</td>
								</tr>
								<tr>
									<td>
										<p style="text-align: center; margin-top: 20px; font-size: 18px; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#findPW">비밀번호를 잊어버리셨나요?</p>
									</td>
								</tr>
								<tr>
									<td>
										<p style="text-align: center; font-size: 18px;"><a href=#>계정이 없으신가요?</a></p>
									</td>
								</tr>
							</table>
						</form>
					</div>
				  </div>
			</div>
		</div>

		<!--모달 비밀번호 찾기 ------------------------------------------------------------------------------------->
		<div class="modal fade" tabindex="-1" id="findPW">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="d-flex justify-content-end mt-3 me-3">
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="">
						<p class="text-center" id="logo">GAMEDORI</p>
					</div>
					<div class="modal-body">
						<form>
							<table>
								<tr>
									<td style="width: 500px;">
										<h5 style="margin-left: 170px; margin-top: 20px; font-weight: bold;">비밀번호 찾기</h5>
									</td>
								</tr>
								<tr>
									<td>
										<p style="text-align: center;">가입했던 이메일을 적어주세요. <br>입력하신 이메일 주소로 비밀번호 변경 메일을 보내드릴게요.</p>
									</td>
								</tr>
								<tr>	
									<td >
										<div class="mb-3">
											<input style="margin-top: 20px;"type="email" class="form-control" id="member_email" name="member_email" placeholder="이메일을 입력하세요">
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<button class="btn btn-outline-light login" style="width: 460px; margin-top: 15px; font-weight: bold; font-size: 20px;">이메일 보내기</button>
									</td>
								</tr>
								<tr>
									<td>
										<p style="text-align: center; margin-top: 20px; font-size: 18px; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#login">로그인하러 가기</p>
									</td>		
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</header>
