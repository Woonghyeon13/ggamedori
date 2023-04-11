<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
<main>		

    <!-- 1 : 1 문의 전체보기 ---------------------------------------------------- -->
	<script><!-- 마이페이지 적립금 계산 -->
		let savept_balance = ${vo.savept_balance};
		et pt_used_amount = ${vo.pt_used_amount};
					  	
		let result = savept_balance - pt_used_amount;
	</script><!-- 마이페이지 적립금 계산 END -->
	
    <div class="container mypage_inner">
        <h4>1 : 1 문의 전체보기</h4>
        <div id="mypage_1" class="col">
            <ul>
                <li>
                    <h5>등급</h5>
                    <p>브론즈,실버,골드 등등..</p>
                </li>
                <li>
                    <h5>적립금</h5>
                    <p><c:if test="${result eq null}">0 </c:if>${result}원</p>
                    <a href="s_money_check.html">적립금 확인 > </a>  <!--s_money2.html-->
                </li>
                <li>
                    <h5>쿠폰</h5>
                    <p><c:if test ="${selectListCount eq null}">0</c:if>${selectListCount} 개</p>
                    <a href="coupon_check.html">쿠폰 확인 > </a>    <!-- coupon_check2.html-->
                </li>
                <li>
                    <h5>나의 후기</h5>
                    <p><c:if test ="${selectListCount2 eq null}">0</c:if>${selectListCount2} 개</p>
                    <a href="review_list.html">후기 확인 > </a>    <!-- review_check2.html-->
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
            <div id="one_to_one_inner" class="col-8">     
                <p><strong>${sessionScope.Login.member_name}</strong>님의 1 : 1 문의 내역</p>            
                <table id="one_to_one_t" class="table table-hover" style="width:100%; border-top:1px solid #000;">
                    <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">문의 제목</th>
                            <th scope="col">작성자</th>
                            <th scope="col">작성 일자</th>
                            <th scope="col">처리 상태</th>
                          
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${selectList2}" var="vo">
                        <tr>
                            <th>${vo.qa_idx}</th>
                            <td>${vo.qa_title}</td>
                            <td>${vo.qa_writer}</td>
                            <td>${vo.qa_wdate}</td>
                            <td>${vo.qa_yn}</td>
                        </tr> 
                        </c:forEach>
                    </tbody>   
                </div> <!-- end:#enquiry_inner -->
            </table>
			<div id="paging" class="container">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center text-black">
					<li class="page-item">
						<a class="page-link text-reset" href="#" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					<li class="page-item"><a class="page-link text-reset" href="#">1</a></li>
					<li class="page-item"><a class="page-link text-reset" href="#">2</a></li>
					<li class="page-item"><a class="page-link text-reset" href="#">3</a></li>
					<li class="page-item"><a class="page-link text-reset" href="#">4</a></li>
					<li class="page-item"><a class="page-link text-reset" href="#">5</a></li>
					<li class="page-item"><a class="page-link text-reset" href="#">6</a></li>
					<li class="page-item"><a class="page-link text-reset" href="#">7</a></li>
					<li class="page-item"><a class="page-link text-reset" href="#">8</a></li>
					<li class="page-item"><a class="page-link text-reset" href="#">9</a></li>
					<li class="page-item"><a class="page-link text-reset" href="#">10</a></li>
					<li class="page-item">
						<a class="page-link text-reset" href="#" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
					</ul>
				</nav>
			</div>
        </div> <!-- end:#mypage_inner2 -->
    </div> <!-- end:#mypage_inner -->

    <!---------------------------------------------------------------------------->


	</main>


<%@ include file="../include/foot.jsp" %>