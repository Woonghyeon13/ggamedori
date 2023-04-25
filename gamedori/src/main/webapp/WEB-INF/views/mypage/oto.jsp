
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="oto_searchTotalPages" value="${searchResults.totalPages}" />

<script>
	var originalTableData = [];
	
	function updatePaginationForAll() {
	    var pagination = $('.pagination');
	    pagination.find('li').each(function () {
	        var pageItem = $(this);
	        var pageLink = pageItem.find('a.page-link');
	        if (pageItem.hasClass('active')) {
	            pageLink.css({
	                'background-color': '218, 219, 221',
	                'border-color': '#ffeeeee'
	            });
	        } else {
	            pageLink.css({
	                'background-color': '',
	                'border-color': ''
	            });
	        }
	        // 페이지 링크 클릭 이벤트를 추가합니다.
	        pageLink.on('click', function (event) {
	            event.preventDefault();
	            var page = $(this).text();
	            // 전체 목록을 페이지별로 불러옵니다.
	            searchAndDisplayResults('', '', page);
	        });
	    });
	}
	
	$(document).ready(function () {
	    // 기본 테이블 데이터를 저장합니다.
	    $('#table-body > tr').each(function () {
	        originalTableData.push($(this).clone());
	    });
	    // 페이징 색상 처리를 추가합니다.
	    updatePaginationForAll();
	    $('.btn_search').click(function (event) {
	        event.preventDefault();
	        // 검색어와 검색 옵션 가져오기
	        var searchText = $('input[name="searchText"]').val();
	        var searchOption = $('select[name="searchOption"]').val();
	        // 검색 옵션 확인
	        if (searchOption === '검색 옵션') {
	            alert('검색 옵션을 선택해주세요.');
	            return;
	        }
	        // 검색어가 빈 문자열일 경우 전체 목록을 보여줍니다.
	        if (searchText.trim() === '') {
	            showAll();
	            // 빈 검색어를 입력했을 때 새로고침을 합니다.
	            location.reload();
	            return;
	        }
	
	        // AJAX 요청 전송
	        searchAndDisplayResults(searchText, searchOption, 1);
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
	    // 전체 목록을 보여주는 경우의 페이징 색상 처리를 추가합니다.
	    updatePaginationForAll();
	}
	
	function searchAndDisplayResults(searchText, searchOption, page) {
	    sendAjaxRequest(searchText, searchOption, page, function(response) {
	        updateTable(response);
	        updatePagination(response.totalPages, searchText, searchOption, page);
	    });
	}
	
	function sendAjaxRequest(searchText, searchOption, page, onSuccess) {
	    $.ajax({
	        url: '<%=request.getContextPath()%>/mypage/oto_search.do',
	        method: 'GET',
	        dataType: 'json',
	        data: {
	            searchText: searchText,
	            searchOption: searchOption,
	            page: page
	        },
	        success: onSuccess,
	        error: function (xhr, status, error) {
	            console.log('Error:', error);
	        }
	    });
	}
	
	function updatePagination(totalPages, searchText, searchOption, currentPage) {
	    var pagination = $('.pagination');
	    pagination.empty();
	
	    for (var i = 1; i <= totalPages; i++) {
	        var isActive = i == currentPage;
	        var pageItem = $('<li>').addClass('page-item').toggleClass('active', isActive);
	        var pageLink = $('<a>').addClass('page-link')
	            .attr('href', '#')
	            .text(i);
	        pageLink.on('click', function (event) {
	            event.preventDefault();
	            var page = $(this).text();
	
	            searchAndDisplayResults(searchText, searchOption, page);
	        });
	        pageItem.append(pageLink);
	        pagination.append(pageItem);
	    }
	}
	
	  //테이블 검색한거에 따른 갯수처리
		function updateTable(response) {
	    var searchResults = response.searchResults;
	    var tableBody = $('#table-body');
	    tableBody.empty(); // 이전 검색 결과를 지우고
	
	    if (searchResults.length === 0) {
	        // 검색 결과가 없는 경우 원래 데이터를 보여줍니다.
	        $.each(originalTableData, function (index, row) {
	            tableBody.append(row);
	        });
	    } else {
	        // 검색 결과가 있는 경우
	        $.each(searchResults, function (index, result) {
	            var newRow = $('<tr>');
	
	            // 테이블에 행 추가
	            newRow.append($('<td>').text(result.qa_idx));
	            newRow.append($('<td>').append($('<a>').attr('href', 'oto_view.do?qa_idx=' + result.qa_idx).text(result.qa_title)));
	            newRow.append($('<td>').text(result.qa_writer));
	            newRow.append($('<td>').text(result.qa_wdate));
	            newRow.append($('<td>').text(result.qa_yn == 1 ? '답변 완료' : '답변 처리중'));
	
	            tableBody.append(newRow);
	        });
	    }
	
	    // 테이블을 보여줍니다.
	    $('table').show();
	}
	  
	  </script>
	  

<main>		

    <!-- 1 : 1 문의 전체보기 ---------------------------------------------------- -->

	<script>	<!-- 마이페이지 적립금 계산 -->
		let savept_balance = ${vo.savept_balance};
		et pt_used_amount = ${vo.pt_used_amount};
					  	
		let result = savept_balance - pt_used_amount;
	</script>	<!-- 마이페이지 적립금 계산 END -->

	
    <div class="container mypage_inner">
        <h4>1 : 1 문의 전체보기</h4>
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
            <div id="one_to_one_inner" class="col-8">     
                <p><strong>${sessionScope.Login.member_name}</strong>님의 1 : 1 문의 내역</p>            
                <table id="one_to_one_t" class="table table-hover" style="width:100%; border-top:1px solid #000;">
                
                			<thead style="background:#000; color:#fff;">
								<tr>
									<th width="10%" style="text-align:center;">번호</th>
									<th width="40%" style="text-align:center;">문의 제목</th>
									<th width="15%" style="text-align:center;">작성자</th>
									<th width="20%" style="text-align:center;">작성 일자</th>
									<th width="15%" style="text-align:center;">처리 상태</th>
								</tr>
							</thead>
                    <tbody id = "table-body" >
                    	<c:forEach items="${oto}" var="qaVO">

	                        <tr>
	                            <td class="table_number"></td>
	                            <td><a href="oto_view.do?qa_idx=${qaVO.qa_idx}">${qaVO.qa_title}</a></td>
	                            <td>${qaVO.qa_writer}</td>
	                            <td class="wdate">${qaVO.qa_wdate}</td>
	                            <td>${qaVO.qa_yn == 1 ? '답변 완료' : '답변 처리중'}</td>
	                        </tr> 
                        </c:forEach>
                    </tbody>   
              

            </table>    
            <div class="container">
			   
			 <table class="table" style="clear:both; width: 100%;">
			    <tr>                        
			        <td class="d-flex align-items-center justify-content-between">
			            <form action="oto_search.do" method="GET" class="d-flex align-items-center">
			                <!-- 검색 옵션 드롭다운 추가 -->
			                <select class="form-select" name="searchOption" aria-label="검색 옵션" style="width: 150px;">
			                    <option disabled style="background-color: #f2f2e7;" selected>검색 옵션</option>
			                    <option value="name" >이름으로 검색</option>
			                    <option value="content">내용으로 검색</option>
			                    <option value="ncontent">이름+내용으로검색</option> 
			                </select>
			                <input class="form-control" style="width: 200px;" type="text" name="searchText" aria-label="default input example">
			                <div>${fn:escapeXml(searchText)}</div>
			
			                <button type="submit" class="btn btn-dark btn_search">검색</button>
			            </form>
            
            
             <c:if test="${Login.member_role == 1}">
	 	           <button onclick="location.href='${pageContext.request.contextPath}/mypage/oto_write.do'" style="float:right; margin-top:20px;">문의하기</button>
			</c:if>  
		             </td>
				</tr>
	
			
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
						</table>
			    	</div> <!-- end:.container -->
				</div>	<!-- end:#one_to_one_inner -->
        	</div> <!-- end:#mypage_inner2 -->
        </div>	<!-- end:.mypage_inner -->

    <!---------------------------------------------------------------------------->


	</main>

<%@ include file="../include/foot.jsp" %>