<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
<main>		

    <!-- 1 : 1 문의 전체보기 ---------------------------------------------------- -->
	<script><!-- 마이페이지 적립금 계산 -->
		/* let savept_balance ;
		let pt_used_amount ;
					  	 */
		//let result = savept_balance - pt_used_amount;
	</script><!-- 마이페이지 적립금 계산 END -->

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
					<li class="list-group-item"><a
						href="<c:url value='/mypage/cart.do'/>">장바구니</a></li>
					<li class="list-group-item"><a
						href="<c:url value='/mypage/prodqa.do'/>">상품문의</a></li>
					<li class="list-group-item"><a
						href="<c:url value='/mypage/oto.do'/>">1 : 1문의</a></li>
					<li class="list-group-item"><a
						href="<c:url value='/mypage/reviewlist.do'/>">나의 후기</a></li>
					<li class="list-group-item"><a
						href="<c:url value='/user/modify.do'/>">회원정보수정</a></li>
					<li class="list-group-item"><a
						href="<c:url value='/user/withdraw.do'/>">탈퇴하기</a></li>
					<!-- unregister2.html -->
				</ol>
			</div>
			
         <div id="prod_q_inner" class="col-8">     

			<table class="table" style=" border-top:1px solid black;">
	            <thead>
	                <tr>
	                    <th style="font-size:40px; font-weight:bold;  background:rgb(231,231,231);">${product_Q_VO.prod_q_title}</th>
	                </tr>
	                
	                <tr>
	                    <td style="float:left; color:gray;">상품 명 : <span style="border-bottom:1px solid #fff; font-size:30px;">${product_VO.prod_name}</span></td>
	                </tr>
	                
	                <tr>
	                    <td style="float:left; color:gray;">작성자 : ${sessionScope.Login.member_name}</td>
	                    <td style="float:left; color:gray;">작성일 : <span class="wdate">${product_Q_VO.prod_q_wdate}</span></td>

	                    <td style="float:right; color:gray;">처리 상태 : ${product_Q_VO.prod_q_yn == 1 ? '답변 완료' : '답변 처리중'}</td>              
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                    <td colspan="4" style="border-top:1px solid gray; height:500px; text-align:left; font-size:20px;">${product_Q_VO.prod_q_contents}</td>
	                </tr>            
	            </tbody>
	        </table>
	        
	        <table class="table" style="border-top:1px solid black;">
	        	<thead>
	        		<tr>
	        			<td style="float:left; color:gray;">답변</td>
	        		</tr>
	        	</thead>
	        	<tbody>
	                <tr>
	                    <td colspan="4" style="border-top:1px dotted gray; height:200px; text-align:left; font-size:20px;">${product_Q_VO.prod_q_reply}</td>
	                </tr>            
	            </tbody>
	        </table>
			
			<div id="buttons" style="display:flex;">
			
		       <!--  고객만 글 삭제 가능 -->
		        <c:if test="${Login.member_role == 1}">
		    		<button type="button" class="btn btn-outline-dark" style="margin:right; margin-right:10px;" onclick="location.href='${pageContext.request.contextPath}/mypage/prod_q_delete.do?prod_q_idx=${product_Q_VO.prod_q_idx}'">삭제</button>  		
				</c:if>  
				
		            <button type="button" class="btn btn-outline-dark" style="margin:right margin-right:10px;" onclick="location.href='${pageContext.request.contextPath}/mypage/prodqa.do'">글목록</button>
		            
	            <c:if test="${Login.member_role == 2}">
	                <button type="button" class="btn btn-dark" style="flex-direction: row-reverse;" onclick="location.href='prod_q_answer.do'">답변하기</button>
	            </c:if>
			
			</div>

          </div>
        </div> <!-- end:#mypage_inner2 -->
    </div> <!-- end:#mypage_inner -->

    <!---------------------------------------------------------------------------->


	</main>


<%@ include file="../include/foot.jsp" %>