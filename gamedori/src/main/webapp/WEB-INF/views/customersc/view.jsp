<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>


<main>
	<div class="customer">
		<div id="customer_header">
			<h2>고객센터</h2>
			<ul class="nav nav-tabs">
				<li class="nav-item"><a style="color: black;"
					class="nav-link active" href="<c:url value='/customersc/main.do'/>"> 공지사항</a></li>
				<li class="nav-item"><a style="color: black;" class="nav-link"
					href="<c:url value='/customersc/main.do'/>"> 1:1문의하기</a></li>
				<li class="nav-item"><a style="color: black;" class="nav-link"
					href="<c:url value='/customersc/main.do'/>"> Q&A</a></li>
			</ul>
		</div>

		<div id="customer_board">
			<table class="table table-hover"
				style="width: 70%; border-top: 1px solid black;">
				<thead>
					<tr>
						<th>공지사항 제목입니다요용ㅇ</th>
						<th>작성자</th>
						<th>2023.02.20</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="3" style="height: 800px; text-align: left;">아하하하</td>
					</tr>
					<tr>
						<td colspan="3" style="height: 50px;"><img
							src="<c:url value='/images/댓글.PNG' />">총 0건의 댓글이있습니다.</td>
					</tr>
					<tr>
						<td colspan="3"
							style="height: 70px; text-align: center; background-color: rgb(235, 233, 233);">댓글작성은
							로그인후 이용부탁드립니다!</td>
					</tr>
				</tbody>
			</table>
			<div id="customer_bottom_page">
				<ul>
					<li>이전</li>
					<li>다음</li>
					<li><a href="<c:url value='/customersc/main.do'/>">글목록</a></li>
				</ul>
			</div>
		</div>
	</div>
</main>



<%@ include file="../include/foot.jsp" %>