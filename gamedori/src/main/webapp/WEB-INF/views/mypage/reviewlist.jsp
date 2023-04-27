<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
<main>

	<!-- 리뷰 전체보기 --------------------------------------------------------- -->
	
	<div class="container mypage_inner">
		<h4>후기 전체보기</h4>
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
			<div id="review_inner" class="col-8">
				<div id="select">
					<p>
						<strong>${sessionScope.Login.member_name}</strong>님이 작성한 후기모음
					</p>
						<!-- 검색기능 -->
						<form name="frm" method="get">
					<div class="input-group mb-3">
							<input type="text" name="R_searchValue" value="${param.R_searchValue}" class="form-control" aria-describedby="basic-addon2"> 
							<span class="input-group-text" id="basic-addon2"> 
								<select id="R_searchType" name="R_searchType" class="form-select" aria-label="Default select example">
										<option value="title" <c:if test ="${param.R_searchType eq 'title'}" > selected</c:if>>제목</option>
										<option value="name" <c:if test ="${param.R_searchType eq 'name'}" > selected</c:if>>상품 정보</option>
								</select>
							</span>
							<button type="submit" class="btn btn-outline-secondary btn_search">
								<i class="xi-search"></i>
							</button>
					</div>
						</form>
				</div>
				<table id="review_t" class="table table-hover text-center" style="border-top: 1px solid #000;">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">상품 정보</th>
							<th scope="col">제목</th>
							<th scope="col">이름</th>
							<th scope="col">작성일자</th>
						</tr>
					</thead>
					<tbody id="table-body">
						<c:forEach items="${selectReviewList}" var="vo">
						<tr>
							<td scope="row" class="table_number"></td>
							<td>${vo.prod_name}</td>
							<td>${vo.review_title}</td>
							<td>${vo.review_writer}</td>
							<td class="wdate">${vo.review_wdate}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				
				
				<!-- 검색  -->
				<script>
					var originalTableData = [];
				
					$(document).ready(function () {
					    // 기본 테이블 데이터를 저장합니다.
					    $('#table-body > tr').each(function () {
					        originalTableData.push($(this).clone());
					    });
				
					    $('.btn_search').click(function (event) {
					        event.preventDefault();
				
					        // 검색어와 검색 옵션 가져오기
					        var R_searchValue = $('input[name="R_searchValue"]').val();
					        var R_searchType = $('select[name="R_searchType"]').val();
				
					   		// 검색 옵션 확인
					        if (R_searchType === '검색 옵션') {
					            alert('검색 옵션을 선택해주세요.');
					            return;
					        }

					        // 검색어가 빈 문자열일 경우 전체 목록을 보여줍니다.
					        if (R_searchValue.trim() === '') {
					            showAll();
					            return;
					        }
					        // AJAX 요청 전송
					        $.ajax({
					            url: '<%=request.getContextPath()%>/mypage/search.do',
					            method: 'GET',
					            data: {
					            	R_searchValue: R_searchValue,
					            	R_searchType: R_searchType
					            },
					            success: function (response) {
					                updateTable(response.searchResults);
					                updatePagination(response.totalPages);
					            },
					            error: function (xhr, status, error) {
					                console.log('Error:', error);
					            }
					        });
					    });
					});
				
					
					
					function showAll() {
					    var tableBody = $('#table-body');
					    tableBody.empty(); // tbody의 내용을 지우고

					    // 원래 데이터를 보여줍니다.
					    $.each(originalTableData, function (index, row) {
					        tableBody.append(row);
					    });

					    // 테이블을 보여줍니다.
					    $('table').show();
					}
					
					
					
					//검색 결과에따른 페이징 처리
					function updatePagination(totalPages) {
					    var pagination = $('.pagination');
					    pagination.empty();
					
					    var R_searchValue = $('input[name="R_searchValue"]').val();
					    var R_searchType = $('select[name="R_searchType"]').val();
					
					    for (var i = 1; i <= totalPages; i++) {
					        var pageItem = $('<li>').addClass('page-item');
					        var pageLink = $('<a>').addClass('page-link')
					            .attr('href', '#')
					            .attr('data-R_searchValue', R_searchValue)
					            .attr('data-R_searchType', R_searchType)
					            .text(i);
					        pageLink.on('click', function (event) {
					            event.preventDefault();
					            var page = $(this).text();
					            var R_searchValue = $(this).data('R_searchValue');
					            var R_searchType = $(this).data('R_searchType');
					          
					            $.ajax({
					                url: '<%=request.getContextPath()%>/mypage/search.do',
					                method: 'GET',
					                dataType: 'json',
					                data: {
					                	R_searchValue: R_searchValue,
					                	R_searchType: R_searchType,
					                    page: page
					                },
					                success: function (response) {
					                    updateTable(response.searchResults);
					                    updatePagination(response.totalPages);
					                },
					                error: function (xhr, status, error) {
					                    console.log('Error:', error);
					                }
					            });
					        });
					        pageItem.append(pageLink);
					        pagination.append(pageItem);
					    }
					}
					
					//테이블 검색한거에 따른 갯수처리
					function updateTable(results) {
					    var tableBody = $('#table-body');
					    tableBody.empty(); // tbody의 내용을 지우고

					    if (results.length === 0) {
					        // 검색 결과가 없는 경우 원래 데이터를 보여줍니다.
					        $.each(originalTableData, function (index, row) {
					            tableBody.append(row);
					        });
					    } else {
					        // 검색 결과가 있는 경우
					        $.each(results, function (index, selectReviewList) {
					            var row = $('<tr>');
					            row.append($('<th>').text(selectReviewList.review_idx) ); 
					            row.append($('<td>').text(selectReviewList.prod_name) );
					            row.append($('<td>').text(selectReviewList.review_title));
					            row.append($('<td>').text(selectReviewList.review_writer));
					            row.append($('<td>').text(selectReviewList.review_wdate));
					            tableBody.append(row);
					        });
					    }
					    // 테이블을 보여줍니다.
					    $('table').show();
					}
				</script>



					<!-- 페이징 -->
		
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center" >
				<c:forEach var="i" begin="1" end="${totalPages}">
					 <a class="page-link" href="?page=${i}" style="${param.page == i ? 'background-color: #dadbdd; border-color: #ffeeeee;' : ''}">
				</c:forEach>
			</ul>
		</nav>
		
		
			</div>

		</div>
		<!-- end:#review_inner -->

	</div>
	<!-- end:#mypage_inner2 -->
	<!-- end:#mypage_inner -->

	<!---------------------------------------------------------------------------->


</main>


<%@ include file="../include/foot.jsp" %>