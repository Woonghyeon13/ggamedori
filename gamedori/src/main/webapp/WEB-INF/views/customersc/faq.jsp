<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
<main>

	<div class="container">
		<div class="row">
			<div class="col-12 text-center">
				<h2>고객센터</h2>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="d-flex justify-content-center py-3">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a style="color: black;" class="nav-link"
					href="<c:url value='/customersc/main.do' />"> 공지사항</a></li>
				<li class="nav-item"><a style="color: black;"
					class="nav-link active" href="<c:url value='/customersc/faq.do' />"> 자주 묻는 질문</a></li>
			</ul>
		</div>
	</div>
	<div class="accordion accordion-flush justify-content-center"
		id="accordionFlushExample"
		style="width: 70%; margin-left: 15%; margin-top: 5%;">
		<div class="accordion-item">
			<h2 class="accordion-header" id="flush-headingOne">
				<button class="accordion-button collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
					aria-expanded="false" aria-controls="flush-collapseOne">
					성인인증을 어디서 하나요?</button>
			</h2>
			<div id="flush-collapseOne" class="accordion-collapse collapse"
				aria-labelledby="flush-headingOne"
				data-bs-parent="#accordionFlushExample">
				<div class="accordion-body">마이페이지란 안에서 회원정보 수정 클릭후 휴대폰 본인확인 인증
					하시면 됩니다</div>
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header" id="flush-headingTwo">
				<button class="accordion-button collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
					aria-expanded="false" aria-controls="flush-collapseTwo">
					휴대폰본인확인 해도 반복해서 인증 요청이 됩니다</button>
			</h2>
			<div id="flush-collapseTwo" class="accordion-collapse collapse"
				aria-labelledby="flush-headingTwo"
				data-bs-parent="#accordionFlushExample">
				<div class="accordion-body">회원정보 수정에서 휴대폰본인확인후 안되시면 고객님 휴대폰
					통신사로 문의부탁드립니다.</div>
			</div>
		</div>

		<div class="accordion-item">
			<h2 class="accordion-header" id="flush-headingThree">
				<button class="accordion-button collapsed" type="button"
					data-bs-toggle="collapse" data-bs-target="#flush-collapseThree"
					aria-expanded="false" aria-controls="flush-collapseThree">
					로그인이 되지 않습니다.</button>
			</h2>
			<div id="flush-collapseThree" class="accordion-collapse collapse"
				aria-labelledby="flush-headingThree"
				data-bs-parent="#accordionFlushExample">
				<div class="accordion-body">
					PC 버전 <br> 1. ctrl + shift + del 누르셔서 쿠키삭제 <br>2. 재접속 후
					shift+f5 누르신후 로그인시도 <br> <br> <Br>모바일 버전 <br>1.사용기록
					삭제 <br>2.홈페이지 새로 재접속후 새로고침후 로그인시도
				</div>
			</div>
		</div>
	</div>


</main>


<%@ include file="../include/foot.jsp" %>