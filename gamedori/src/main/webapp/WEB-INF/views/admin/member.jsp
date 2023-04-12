<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>

<script>

	function updateMemberState(obj,idx){
	      $.ajax({
	        type: 'POST',
	        url: 'updateMemberState.do',
	        data: {
				member_state:obj.value
			   ,member_idx : idx
	        },
	        success: function() {
	          console.log('상태 업데이트 완료');
	          alert("상태 업데이트 완료");
	        },
	        error: function() {
	          console.log('상태 업데이트 실패');
	          alert("상태 업데이트 완료");
	        }
	      });
	}    
</script>

<main>
	<div class="container d-flex justify-content-center mt-2">
		<h3 class="fw-bold">관리자 페이지</h3>
	</div>
	<div class="container">
		<div class="container mt-5">
			<ul class="nav justify-content-center nav-fill nav-tabs text-black">
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/orderList.do' />">주문 관리</a></li>
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/prod.do' />">상품 관리</a></li>
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/mainPageModify.do' />">화면 관리</a></li>
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/qaprod.do' />">문의/공지관리</a></li>
				<li class="nav-item">
					<!-- 선택시 클래스 fw-bold -->
					<a class="nav-link active text-reset fw-bold" aria-current="page" href="<c:url value='/admin/member.do' />">회원 관리</a>
				</li>
			</ul>
		</div>
	</div>
	<!-- 문의/공지사항 탭  -->
	<!-- <div class="container">
    <ul class="nav justify-content-end text-black">
      <li class="nav-item">
        <a class="nav-link active text-reset" aria-current="page" href="#">상품 문의 관리</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-reset" href="#">1:1 문의 관리</a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-reset" href="#">공지사항 관리</a>
    </li>
  </ul>
</div> -->
	<!-- 회원관리 -->
	<div class="container mt-5">
		
		<div class="container">
			<!-- <form name="memberState" action="member.do" method="post">  -->
				<table class="table">
					<thead class="table-light">
						<tr>
							<th scope="col" class="text-center" width="10%">회원번호</th>
							<th scope="col" class="text-center" width="15%">이름</th>
							<th scope="col" class="text-center" width="20%">EMAIL</th>
							<th scope="col" class="text-center" width="20%">연락처</th>
							<th scope="col" class="text-center" width="15%">등급</th>
							<th scope="col" class="text-center" width="20%">상태</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="memberlist" items="${list }">
						<tr>
							<td class="text-center">${memberlist.member_idx }</td>
							<td class="text-center">${memberlist.member_name }</td>
							<td class="text-center">${memberlist.member_email }</td>
							<td class="text-center">${memberlist.member_phone }</td>
					<c:choose>	
						<c:when test="${memberlist.member_level == 1}">	
							<td class="text-center">브론즈</td>
						</c:when>
						<c:when test="${memberlist.member_level == 2}">	
							<td class="text-center">실버</td>
						</c:when>
						<c:otherwise>	
							<td class="text-center">골드</td>
						</c:otherwise>			
					</c:choose>
							<td class="text-center">
								<select class="form-select" onchange="updateMemberState(this,'${memberlist.member_idx }');">
									<option value="1" <c:if test="${memberlist.member_state == 1}">selected</c:if>>정상</option>
									<option value="2" <c:if test="${memberlist.member_state == 2}">selected</c:if>>정지</option>
									<option value="3" <c:if test="${memberlist.member_state == 3}">selected</c:if>>탈퇴</option>
								</select>
							</td>
						</tr>
					</c:forEach>	
					</tbody>
				</table>
		</div>
	<!-- 	<div class="container d-flex justify-content-end">
			<button class="btn btn-outline-secondary ms-2 me-4">승인</button>
		</div>  -->
	<!-- </form>  -->

		<div class="container">
			<form class="form-horizontal d-flex justify-content-center"
				role="form">
				<div>
					<input class="form-control form-control-sm" type="text"
						placeholder="회원명" aria-label=".form-control-sm example">
				</div>
				<div>
					<button class="btn btn-outline-secondary btn-sm ms-2">검색</button>
				</div>
			</form>
		</div>

		<div class="container d-flex justify-content-center mt-3">
			<nav aria-label="Page navigation example">
				<ul class="pagination text-black">
					<li class="page-item"><a class="page-link text-reset" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item"><a class="page-link text-reset" href="#">1</a></li>
					<li class="page-item"><a class="page-link text-reset" href="#">2</a></li>
					<li class="page-item"><a class="page-link text-reset" href="#">3</a></li>
					<li class="page-item"><a class="page-link text-reset" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</div>
</main>


<%@ include file="../include/foot.jsp" %>