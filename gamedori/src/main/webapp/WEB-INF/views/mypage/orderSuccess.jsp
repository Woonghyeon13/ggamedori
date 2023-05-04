 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
<main>

	<div class="inner mt-5 mb-5 pt-3 pb-5">
		<div class="text-center mb-5">
			<h1>감사합니다!</h1>
			<h1>주문이 정상적으로 완료되었습니다.</h1>
		</div>
		<div class="text-center row w-50 mx-auto mt-5">
			<button type="button" class="btn btn-outline-secondary btn-lg col m-2">
				<a href="<c:url value='/mypage/prodlist.do' />">주문내역 확인하기</a>
			</button>
			<button type="button" class="btn btn-outline-light login btn-lg col m-2" onclick = "location.href=<c:url value='/'/>">
				계속 쇼핑하기
			</button>
		</div>

	</div>

</main>
<!-- end : main------------------------------->


<%@ include file="../include/foot.jsp" %>