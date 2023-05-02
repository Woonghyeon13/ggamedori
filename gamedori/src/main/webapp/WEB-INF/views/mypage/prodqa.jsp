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
					<tbody id="table-body">
						<c:forEach items="${prodqa}" var="vo">
							<c:if test="${QA_VO.qa_writer eq Login.member_name}">
							<tr>
								<td class="table_number"></td>
								<td>${vo.prod_name}</td>
								<td>
									<c:choose>
										<c:when test="${vo.prod_q_secret == 1}">
											<img src= "<c:url value='/images/비밀글자물쇠.png'/>" style="width:20px;">
										</c:when>
									</c:choose>
									${vo.prod_q_title}
								</td>
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
							</c:if>
						</c:forEach>
					</tbody>
				</table>

					            <div class="container">
			   
			 <table class="table" style="clear:both; width: 100%;">
			    <tr>                        
			        <td class="d-flex align-items-center justify-content-between">
			           <form class="d-flex justify-content-center align-items-center" role="form">
			        <div class="me-2">
			            <select class="form-select" name="searchOption" aria-label="검색 옵션" style="width: 150px;">
			                <option disabled style="background-color: #f2f2e7;">검색 옵션</option>
			                <option value="name" selected>제목으로 검색</option>
			                <option value="content">내용으로 검색</option>
			                <option value="ncontent">제목+내용으로검색</option>
			            </select>
			        </div>
			        <div class="me-2">
			            <input class="form-control form-control-sm" type="text" placeholder="제목"  name="searchText"aria-label=".form-control-sm example">
			        </div>
			        <div>
			            <button type="submit" class="btn btn-dark btn_search">검색</button>
			        </div>
			    </form>
		             </td>
				</tr>
	
			
						</table>
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center" >
									<c:forEach var="i" begin="1" end="${totalPages}">
									    <li class="page-item" class="${param.page == i ? 'active' : ''}">
									        <a class="page-link" href="?page=${i}" style="${param.page == i ? 'background-color: #dadbdd; border-color: #ffeeeee;' : ''}">
									            ${i}
									        </a>
									    </li>
									</c:forEach>
								</ul>
							</nav>
			    	</div> <!-- end:.container -->
			</div>	<!-- end:#enquiry_inner -->
		</div>	<!-- end:#mypage_inner2 -->
		
	</div>	<!-- end:#mypage_inner -->
	
	<!---------------------------------------------------------------------------->


</main>
<%@ include file="../include/foot.jsp"%>