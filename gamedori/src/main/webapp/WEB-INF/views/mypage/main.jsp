<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/head.jsp" %>

<script>

	//주문 상세정보 모달창 열기
	function orderdetailToModal(idx) {
    var orderIdx = idx;
     $.ajax({
       type: 'POST',
       url: 'orderDetail.do',
       data: { 'order_idx': orderIdx },
       success: function(data) {
    	   
    	   var html = "";
    	   
    	   		html += '<div class="row container m-0">'
    	   		html += '<div class="col mb-0 p-0">'
    	   		html += '<p class="mb-0 p-0">주문번호: &nbsp; '+data[0].order_idx+'</p>'
    	   		html += '</div>'
    	   		html += '<div class="col mb-0 p-0">'
    	   		html += '<p class="mb-0 col text-end p-0">주문일자: &nbsp; '+data[0].order_date+'</p>'
    	   		html += '</div>'
    	   		html += '</div>'
    	   		
    	   		html += '<div class="container mt-4">'	    	   		
    	   		html += '<div>'
    	   		html += '<h5>주문 정보</h5>'
    	   		html += '</div>'
    	   		html += '<hr>'
    	   	for (var i = 0; i < data.length; i++) {
    	   		html += '<div class="row mb-3">'
    	   		html += '<div id="p_left" class="col-3">'
    	   		html += '<img src="<c:url value="/images/prod/thumb/' + data[i].prod_imgt + '" />" style="width:85px; height:85px;">';
    	   		html += '</div>'
    	   		html += '<div id="p_right" class="col-9 mt-2">'
    	   		html += '<p>'+data[i].prod_name+'</p>'
    	   		html += '<div class="row">'
    	   		html += '<p class="col">가격: &nbsp'+data[i].opt_price+'원</p>'
    	   		html += '<p class="col">주문 수량: &nbsp'+data[i].orderd_qty+'개</p>'
    	   		html += '</div>'
    	   		html += '</div>'
    	   		html += '</div>'
    	   	}
    	   		html += '</div>'
    	   		
    	   		html += '<div class="container mt-4">'
    	   		html += '<div>'
    	   		html += '<h5>배송지 정보</h5>'
    	   		html += '</div>'
    	   		html += '<hr>'
    	   		html += '<table class="table">'
    	   		html += '<tbody>'
    	   		html += '<tr>'
    	   		html += '<td class="col-2" style="color: #8f8f8f;">수령인</td>'
    	   		html += '<td class="col-8" style="border-bottom: 0px">'+data[0].member_name+'</td>'
    	   		html += '</tr>'
    	   		html += '<tr>'
    	   		html += '<td class="col-2" style="color: #8f8f8f;">연락처</td>'
    	   		html += '<td class="col-8" style="border-bottom: 0px">'+data[0].member_phone+'</td>'
    	   		html += '</tr>'
    	   		html += '<tr>'
    	   		html += '<td class="col-2" style="color: #8f8f8f;">배송지</td>'
    	   		html += '<td class="col-8" style="border-bottom: 0px">('+data[0].order_addr1+')&nbsp; '+data[0].order_addr2+ data[0].order_addr3+'</td>'
    	   		html += '</tr>'
    	   		html += '<tr>'
    	   		html += '<td class="col-2" style="color: #8f8f8f;">배송 메모</td>'
    	   	if(data[0].order_memo == null){	    	   		
    	   		html += '<td class="col-2" style="border-bottom: 0px">-</td>'
    	   	}else{	    	   		
    	   		html += '<td class="col-2" style="border-bottom: 0px">'+data[0].order_memo+'</td>'
    	   	}
    	   		html += '</tr>'
    	   		html += '</tbody>'
    	   		html += '</table>'
    	   		html += '</div>'
    	   		
    	   		html += '<div class="container mt-4">'
    	   		html += '<div class="row">'
    	   		html += '<h5 class="col mb-0">최종 주문 금액</h5>'
    	   		html += '<p class="col text-end mb-0 fs-5" style="color: #ee4a44;">'+data[0].pay_price_real+'원</p>'
    	   		html += '</div>'
    	   		html += '<hr>'
    	   		html += '<table class="table">'
    	   		html += '<tr>'
    	   		html += '<td style="color: #8f8f8f;">상품 금액</td>'
    	  
    	   	var j =0;
    	   	for (var i = 0; i < data.length; i++){	    	   		
				j = j + data[i].opt_price * data[i].orderd_qty;
    	   	}
    	   		html += '<td style="text-align: right">'+j+'원</td>'
    	   		
    	   		html += '</tr>'
    	   		html += '<tr>'
    	   		html += '<td style="color: #8f8f8f;">배송비</td>'
    	   		html += '<td style="text-align: right">3000원</td>'
    	   		html += '</tr>'
    	   		html += '<tr>'
    	   		html += '<td style="color: #8f8f8f;">적립금 사용</td>'
    	   		html += '<td style="text-align: right">'+data[0].order_usepoint+'원</td>'
    	   		html += '</tr>'
    	   		html += '<tr>'
    	   		html += '<td style="color: #8f8f8f;">결제 수단</td>'
    	   		html += '<td style="text-align: right">신용카드 / 일시불</td>'
    	   		html += '</tr>'
    	   		html += '</table>'
    	   		html += '</div>'
    	   		
    	   		html += '<div class="container mt-4">'
    	   		html += '<div>'
    	   		html += '<h5>포인트 혜택</h5>'
    	   		html += '</div>'
    	   		html += '<hr>'
    	   		html += '<table class="table">'
    	   		html += '<tr>'
    	   		html += '<td style="color: #8f8f8f;">구매 적립</td>'
    	   		html += '<td style="text-align: right">'+(data[0].pay_price_real/10)+'원</td>'
    	   		html += '</tr>'
    	   		html += '</table>'
    	   		html += '</div>'
    	   	

            $('#orderdetail .modal-body ').html(html);
            
            // 모달창 열기
            $('#orderdetail').modal('show');
        
       },
       error: function() {
         alert('서버 오류가 발생했습니다.');
       }
     });
	}

</script>

<main>
	<!-- 마이페이지 클릭 시 첫 화면 ------------------------------------------------------------------------------------------------->
	<div id="mypage_inner" class="container">
		<h3>마이페이지</h3>
		<div id="mypage_1" class="ms-0 me-0">
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
					<fmt:formatNumber var="savePointt" value="${savePoint}" pattern="#,###"/>
					<p>${savePointt}원</p> <a href="<c:url value='/mypage/point.do' />">적립금 확인 > </a>
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

		<div id="mypage_inner2" class="container row p-0">
			<div id="mypage_list" class="col-3 p-0">
				<p id="nickname">
					<span>${sessionScope.Login.member_name}</span>님 환영합니다.
				</p>

				<ol id="ol_li" class="list-group">
					<li class="list-group-item"><a href="<c:url value='/mypage/cart.do' />">장바구니</a></li>
					<li class="list-group-item"><a href="<c:url value='/mypage/prodqa.do' />">상품문의</a></li>
					<li class="list-group-item"><a href="<c:url value='/mypage/prodlist.do' />">주문내역</a></li>
					<li class="list-group-item"><a href="<c:url value='/mypage/oto.do' />">1 : 1문의</a></li>
					<li class="list-group-item"><a href="<c:url value='/mypage/reviewlist.do' />">나의후기</a></li>
					<!-- review_list.html -->
					<li class="list-group-item"><a href="<c:url value='/user/modify.do' />">회원정보수정</a></li>
					<li class="list-group-item"><a href="<c:url value='/user/withdraw.do' />">탈퇴하기</a></li>
					<!-- unregister.html -->
				</ol>
			</div>
			<div id="detail_inner" class="col-9 ps-1">
				<ul>
					<li>
						<div id="product_page" class="container">
							<p>최근 주문 내역</p>
						</div>
						<div id="product" class="container">
							<table class="table table-hover align-middle" class="container">
								<thead>
									<tr>
										<th scope="col">주문 상태</th>
										<th scope="col">상품 이미지</th>
										<th scope="col">상품명</th>
										<th scope="col">주문 일자</th>
										<th scope="col">주문 결제 금액</th>
										<th scope="col">주문 상세</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="olist" items="${Orderlist}">
									<tr>
										<td class="align-middle">
											<c:choose>
												<c:when test="${olist.order_state == 1}">
												    <c:out value="주문접수" />
												</c:when>
												<c:when test="${olist.order_state == 2}">
												    <c:out value="결제완료" />
												 </c:when>
												 <c:when test="${olist.order_state == 3}">
												    <c:out value="상품준비중" />
												 </c:when>
												 <c:when test="${olist.order_state == 4}">
												    <c:out value="발송준비중" />
												 </c:when>
												 <c:when test="${olist.order_state == 5}">
												    <c:out value="배송완료" />
												 </c:when>
												 <c:when test="${olist.order_state == 6}">
												    <c:out value="주문취소" />
												 </c:when>
												 <c:when test="${olist.order_state == 10}">
												    <c:out value="주문취소접수" />
												 </c:when>
												 <c:when test="${olist.order_state == 7}">
												    <c:out value="반품접수" />
												 </c:when>
												 <c:when test="${olist.order_state == 8}">
												    <c:out value="반품완료" />
												 </c:when>
												 <c:when test="${olist.order_state == 9}">
												    <c:out value="구매확정" />
												 </c:when>
											</c:choose>
										</td>
										<td class="align-middle">
											<img style="width:85px; height:85px;" src="<c:url value='/images/prod/thumb/${olist.prod_imgt}'/>">
										</td>
										<td class="align-middle">${olist.prod_name}</td>
										<td class="align-middle">${fn:substring(olist.order_date,0,10)}</td>
										<td class="align-middle">
											<fmt:formatNumber var="payPrice" value="${olist.pay_price_real}" pattern="#,###"/>
											${payPrice}원
										</td>
										<td class="align-middle"><button class="btn btn-outline-secondary btn-sm" onclick="orderdetailToModal('${olist.order_idx}')">상세보기</button></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							<p id="breakdown1">
								<a href="<c:url value='/mypage/prodlist.do' />">...더보기</a>
							</p>
							<!-- product_list.html -->
						</div>
					</li>

					<li>
						<div id="enquiry_page" class="container">
							<p>상품 문의</p>

						</div>
						<div id="enquiry" class="container">
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">문의 제목</th>
										<th scope="col">주문 번호</th>
										<th scope="col">작성 일자</th>
										<th scope="col">처리 상태</th>
									</tr>
								</thead>
								<tbody>
								
								<c:forEach items="${selectQAList}" var="vo" varStatus="status">
									<c:if test="${status.index < 4}">
										<tr>
											<td>
												<c:choose>
													<c:when test="${vo.prod_q_secret == 1}">
														<img src= "<c:url value='/images/비밀글자물쇠.png'/>" style="width:20px;">
													</c:when>
												</c:choose>
												<a href="prod_q_view.do?prod_q_idx=${vo.prod_q_idx}">${vo.prod_q_title}</a>
											</td>
											<td>${vo.product_tb_idx}</td>	
											<td class="wdate">${vo.prod_q_wdate}</td>
										<td>
										<c:choose>
											<c:when test="${vo.prod_q_yn == 1}">
												<c:out value="답변완료" />
											</c:when>
											<c:when test="${vo.prod_q_yn == 2}">
												<c:out value="접수완료" />
											</c:when>
										</c:choose>
										</td>
										</tr>
									</c:if>
								</c:forEach>
								
								</tbody>
							</table>
							<p id="breakdown1">
								<a href="<c:url value='/mypage/prodqa.do' />">...더보기</a>
							</p>
							<!-- enquiry_list.html -->
						</div>

					</li>

					<li>
						<div id="one_to_one_page" class="container">
							<p>1 : 1 문의</p>

						
						</div>
						<div id="one_to_one" class="container">
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">문의 제목</th>
										<th scope="col">작성 일자</th>
										<th scope="col">처리 상태</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${selectOtoListD}" var="vo" varStatus="status">
								    <c:if test="${status.index < 4}">
								        <tr>				   
								            <td class="table_number">${vo.qa_idx}</td>
								            <td>${vo.qa_title}</td>				             
								            <td class="wdate">${vo.qa_wdate}</td>
								            <td>
								                <c:choose>
								                    <c:when test="${vo.qa_yn == 1}">
								                        <c:out value="답변 완료" />
								                    </c:when>
								                    <c:when test="${vo.qa_yn == 2}">
								                        <c:out value="답변 처리중" />
								                    </c:when>
								                </c:choose>
								            </td>
								        </tr>
								    </c:if>
								</c:forEach>

								</tbody>
							</table>
							<p id="breakdown1">
								<a href="<c:url value='/mypage/oto.do' />">...더보기</a>
							</p>
							<!-- one_to_one_list.html -->
						</div>
					</li>

					<li>
						<div id="review_page" class="container">
							<p>나의 후기</p>
						</div>
						<div id="review" class="container">
							<table class="table table-hover">
								<thead>
									<tr>
										<th class="align-middle">번호</th>
										<th class="align-middle">상품 정보</th>
										<th class="align-middle">후기 제목</th>
										<th class="align-middle">작성 일자</th>
										<th class="align-middle">별 점</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${selectReviewList}" var="vo" varStatus="status">
									<c:if test="${status.index < 4}">
										<tr>
											<td class="table_number align-middle"></td>
											<td class="align-middle"><a href="../prod/detail.do?prod_idx=${vo.product_tb_idx}">${vo.prod_name}</a></td>
											<td class="align-middle">${vo.review_title}</td>
											<td class="wdate align-middle">${vo.review_wdate}</td>
											<td class="align-middle">
					<div class="starCnt" style="margin:0px;">
						<div class="starRating-wrap align-middle" style="margin:0px; height:50px;">
								<fieldset class="starRating">
									<input type="radio" id="star5" name="review_star${status.count}" value="10" onclick="return(false);" <c:if test="${vo.review_star eq 10}">checked</c:if>/><label for="star5" class="full" title="Awesome"></label>
									<input type="radio" id="star4.5" name="review_star${status.count}" value="9" onclick="return(false);" <c:if test="${vo.review_star eq 9}">checked</c:if>/><label for="star4.5" class="half"></label>
									<input type="radio" id="star4" name="review_star${status.count}" value="8" onclick="return(false);" <c:if test="${vo.review_star eq 8}">checked</c:if>/><label for="star4" class="full"></label>
									<input type="radio" id="star3.5" name="review_star${status.count}" value="7" onclick="return(false);" <c:if test="${vo.review_star eq 7}">checked</c:if>/><label for="star3.5" class="half"></label>
									<input type="radio" id="star3" name="review_star${status.count}" value="6" onclick="return(false);" <c:if test="${vo.review_star eq 6}">checked</c:if>/><label for="star3" class="full"></label>
									<input type="radio" id="star2.5" name="review_star${status.count}" value="5" onclick="return(false);" <c:if test="${vo.review_star eq 5}">checked</c:if>/><label for="star2.5" class="half"></label>
									<input type="radio" id="star2" name="review_star${status.count}" value="4" onclick="return(false);" <c:if test="${vo.review_star eq 4}">checked</c:if>/><label for="star2" class="full"></label>
									<input type="radio" id="star1.5" name="review_star${status.count}" value="3" onclick="return(false);" <c:if test="${vo.review_star eq 3}">checked</c:if>/><label for="star1.5" class="half"></label>
									<input type="radio" id="star1" name="review_star${status.count}" value="2" onclick="return(false);" <c:if test="${vo.review_star eq 2}">checked</c:if>/><label for="star1" class="full"></label>
									<input type="radio" id="star0.5" name="review_star${status.count}" value="1" onclick="return(false);" <c:if test="${vo.review_star eq 1}">checked</c:if>/><label for="star0.5" class="half"></label>
								</fieldset>
						</div>
					</div>
											</td>
										</tr>
									</c:if>
									</c:forEach>
								</tbody>
							</table>
							<p id="breakdown1">
								<a href="<c:url value='/mypage/reviewlist.do' />">...더보기</a>
							</p>
							<!-- review_list.html -->
						</div>
					</li>

				</ul>
			</div>
		</div>
		<!-- end:#mypage_inner2 -->
	</div>
	<!-- end:#mypage_inner -->
	
	<!-- 주문 상세 모달창-->
	<div class="modal fade" id="orderdetail">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content" id="modal-content">
				<div class="modal-header d-flex flex-column logo">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					<h4 class="modal-title fs-5">주문내역 상세보기</h4>
				</div>
				<div class="modal-body" id="orderdetailContents">
				
				</div>
			</div>
		</div>
	</div>
	
	
	<script>
	
	// 로그인 세션 확인 후 비어있으면 메인 페이지로 이동
	$(document).ready(function () {
	    if (!${!empty Login}) { // 로그인 세션이 비어있는 경우
	        alert("로그인이 필요한 페이지입니다.");
	        window.location.href = "<%=request.getContextPath()%>/"; // 메인 페이지로 이동
	    }
	});
	
	</script>
</main>
<!-- end : main ----------------------->

<%@ include file="../include/foot.jsp" %>