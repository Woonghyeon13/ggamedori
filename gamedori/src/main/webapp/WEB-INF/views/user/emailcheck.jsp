<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
<main>		
	<section class="container inner" id="EmailCheckPage">
		<div class="mt-5">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
				<li class="breadcrumb-item fw-bold fs-4">회원가입</li>
				<li class="breadcrumb-item mt-2">이메일 인증</li>
				</ol>
			</nav>
		</div>
		<hr/>
		<div class="text-center">
			<!--인증단계-->
			<h4>'<span>회원이름</span>'님, 현재 가입 대기 상태입니다.<br/>GAMEDORI 서비스를 이용하시려면 인증 메일을 확인해 주세요.</h4>
			<p>회원가입 시 입력하신 이메일('<span>회원이메일</span>')로 전송된 인증 메일을 확인해 주세요.</p>

			<!--인증성공-->
			<!-- <h4>'<span>회원이름</span>'님, 회원가입이 완료되었습니다.<br/>겜우리 이용을 즐기세요</h4> -->
			<button class="btn btn-dark btn-sm" type="button">메일 다시 보내기</button>
			<button class="btn btn-dark btn-sm" type="button">메인 화면으로</button>
		</div>
		<hr/>
	</section>
</main>

<%@ include file="../include/foot.jsp" %>