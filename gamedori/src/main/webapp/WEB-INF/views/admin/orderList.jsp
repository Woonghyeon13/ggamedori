<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/head.jsp" %>
<main>
	<div class="container d-flex justify-content-center mt-2">
		<h3 class="fw-bold">관리자 페이지</h3>
	</div>
	<div class="container">
		<div class="container mt-5">
			<ul class="nav justify-content-center nav-fill nav-tabs text-black">
				<li class="nav-item">
					<!-- 선택시 클래스 fw-bold --> 
					<a class="nav-link text-reset active fw-bold" href="<c:url value='/admin/orderList.do' />">주문 관리</a>
				</li>
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/prod.do' />">상품 관리</a></li>
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/mainPageModify.do' />">화면 관리</a></li>
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/qaprod.do' />">문의/공지관리</a></li>
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/member.do' />">회원 관리</a></li>
			</ul>
		</div>
	</div>
	<!-- a/s 탭  -->
	<div class="container mt-4">
		<ul class="nav justify-content-end text-black">
			<li class="nav-item"><a class="nav-link text-reset active fw-bold" href="<c:url value='/admin/orderList.do' />">주문 내역</a></li>
			<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/asreturn.do' />">반품 관리</a></li>
			<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/asrefund.do' />">환불 관리</a></li>
		</ul>
	</div>
	
	<div class="container mt-1">
	
		<div class="container">
			<table class="table table-sm">
				<thead class="table-light">
					<tr>
						<th class="text-center">주문번호</th>
						<th class="text-center">주문정보</th>
						<th class="text-center">주문자 이메일</th>
						<th class="text-center">주문자명</th>
						<th class="text-center">주문일</th>
						<th class="text-center">주문금액</th>
						<th class="text-center">주문상태</th>
						<th class="text-center">상세보기</th>
					</tr>
				</thead>
				<tbody id = "table-body" >
				<c:forEach var="olist" items="${orderList }">
					<tr>
						<td class="text-center">${olist.order_idx }</td>
						<td class="text-center">주문정보</td>
						<td class="text-center">${olist.member_email }</td>
						<td class="text-center">${olist.member_name }</td>
						<td class="text-center">${olist.order_date }</td>
						<td class="text-center">주문금액</td>
						<c:choose>	
						<c:when test="${olist.order_state == 1}">	
							<td class="text-center">주문접수</td>
						</c:when>
						<c:when test="${olist.order_state == 2}">	
							<td class="text-center">결제완료</td>
						</c:when>
						<c:when test="${olist.order_state == 3}">	
							<td class="text-center">상품준비중</td>
						</c:when>
						<c:when test="${olist.order_state == 4}">	
							<td class="text-center">발송준비중</td>
						</c:when>
						<c:when test="${olist.order_state == 5}">	
							<td class="text-center">발송완료</td>
						</c:when>
						<c:when test="${olist.order_state == 6}">	
							<td class="text-center">주문취소</td>
						</c:when>
						<c:when test="${olist.order_state == 7}">	
							<td class="text-center">반품접수</td>
						</c:when>
						<c:otherwise>	
							<td class="text-center">반품완료</td>
						</c:otherwise>			
					</c:choose>
						<td class="text-center">
							<button type="button" class="btn btn-secondary btn-sm"
								data-bs-toggle="modal" data-bs-target="#prodRefund">상세보기</button>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>

		<!-- 반품 관리 -->
		<div class="modal fade" id="prodRefund">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header d-flex flex-column logo">
						<div class="mt-2">
							<h4 class="modal-title fs-5">주문내역 상세보기</h4>
						</div>
					</div>
					<div class="modal-body">
						<form name="review" method="post" action="loginAction.jsp">
							<div
								class="form-group d-flex flex-column justify-content-center align-items-center">
								<input type="text" class="form-control" placeholder="환불 신청 제목">
							</div>
							<div
								class="form-group mt-2 d-flex flex-column justify-content-center align-items-center">
								<textarea name="" id="" placeholder="환불 신청 사유"
									class="form-control" cols="30" rows="10"></textarea>
							</div>
							<div
								class="form-group mt-2 d-flex flex-column justify-content-center align-items-center">
								<textarea name="" id="" placeholder="환불 승인/거절 사유"
									class="form-control" cols="30" rows="10"></textarea>
							</div>

							<div class="d-flex gap-1 mt-2">
								<input type="submit"
									class="btn btn-outline-secondary btn-lg form-control"
									value="승인"> <input type="submit"
									class="btn btn-outline-secondary btn-lg form-control"
									value="거절">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>


		<!-- 검색 -->
	<div class="container">
	    <form class="d-flex justify-content-center align-items-center" role="form">
	        <div class="me-2">
	            <select class="form-select" name="searchOption" aria-label="검색 옵션" style="width: 150px;">
	                <option disabled style="background-color: #f2f2e7;">검색 옵션</option>
	                <option value="name" selected>주문자명 </option>
	                <option value="idx">주문 번호</option>
	            </select>
	        </div>
	        <div class="me-2">
	            <input class="form-control form-control-sm" type="text" placeholder="제목"  name="searchText"aria-label=".form-control-sm example">
	        </div>
	        <div>
	            <button type="submit" class="btn btn-dark btn_search">검색</button>
	        </div>
	    </form>
	</div>
<%-- <script>
	var originalTableData = [];
	
	
	function updatePaginationForAll() {
	    var pagination = $('.pagination');
	    pagination.find('li').each(function () {
	        var pageItem = $(this);
	        var pageLink = pageItem.find('a.page-link');
	        if (pageItem.hasClass('active')) {
	            pageLink.css({
	                'background-color': '#dadbdd',
	                'border-color': '#dee2e6'

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
	        var searchText = $('input[name="searchText"]').val().trim();
	        var searchOption = $('select[name="searchOption"]').val();
	        // 검색 옵션 확인
	        if (searchOption === '검색 옵션') {
	            alert('검색 옵션을 선택해주세요.');
	            return;
	        }

	        if (searchText === '') {
	            location.reload(); // 공백 입력 시 페이지를 새로고침합니다.
	            return;
	        }

	        // AJAX 요청 전송
	        searchAndDisplayResults(searchText, searchOption, 1);
	    });

	    // 페이지가 로드되었을 때, 전체 목록을 표시하고 페이지네이션을 처리합니다.
	    var searchText = '';
	    var searchOption = '';
	    var page = 1;
	    searchAndDisplayResults(searchText, searchOption, page);
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
	    
	    // 전체 목록일 때도 페이지네이션을 처리합니다.
	    var searchText = ''; // 전체 목록이므로 검색어는 빈 문자열로 설정합니다.
	    var searchOption = ''; // 전체 목록이므로 검색 옵션도 빈 문자열로 설정합니다.
	    var page = 1; // 전체 목록을 표시할 때는 현재 페이지를 1로 설정합니다.
	    searchAndDisplayResults(searchText, searchOption, page);
	}
	
	function searchAndDisplayResults(searchText, searchOption, page) {
	    if (searchText.trim() === '') {
	        searchText = ''; // 공백 입력 시 검색 텍스트를 빈 문자열로 설정합니다.
	        //	page = 1; // 공백 입력 시 현재 페이지를 1로 설정합니다.
	    }
	    sendAjaxRequest('orderlist',searchText, searchOption, page, function(response) {
	        updateTable(response);
	        updatePagination(response.totalPages, searchText, searchOption, page);
	    });
	}
	
	function sendAjaxRequest(searchType, searchText, searchOption, page, onSuccess) {
	    $.ajax({
	        url: '<%=request.getContextPath()%>/search', // 변경된 URL
	        method: 'GET',
	        dataType: 'json',
	        data: {
	            searchType: searchType, // 새로 추가된 searchType 매개변수
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
	    var pagesToShow = 5; // 한 번에 표시할 페이지 번호의 개수를 설정합니다.
	    var pagination = $('.pagination');
	    pagination.empty();

	    if (totalPages === 0) {
	        totalPages = 1;
	    }

	    var startPage = Math.floor((currentPage - 1) / pagesToShow) * pagesToShow + 1;
	    var endPage = Math.min(startPage + pagesToShow - 1, totalPages);

	    // 처음 페이지로 이동
	    var firstPageItem = $('<li>').addClass('page-item');
	    var firstPageLink = $('<a>').addClass('page-link').attr('href', '#').text('<<');
	    if (currentPage > 1) {
	        firstPageLink.on('click', function (event) {
	            event.preventDefault();
	            searchAndDisplayResults(searchText, searchOption, 1);
	        });
	    } else {
	        firstPageItem.addClass('disabled');
	    }
	    firstPageItem.append(firstPageLink);
	    pagination.append(firstPageItem);

	    // 이전 페이지로 이동
	    var prevPageItem = $('<li>').addClass('page-item');
	    var prevPageLink = $('<a>').addClass('page-link').attr('href', '#').text('<');
	    if (currentPage > 1) {
	        prevPageLink.on('click', function (event) {
	            event.preventDefault();
	            searchAndDisplayResults(searchText, searchOption, currentPage - 1);
	        });
	    } else {
	        prevPageItem.addClass('disabled');
	    }
	    prevPageItem.append(prevPageLink);
	    pagination.append(prevPageItem);
	    
	    // 페이지 번호
	    for (var i = startPage; i <= endPage; i++) {
	        var isActive = i == currentPage;
	        var pageItem = $('<li>').addClass('page-item').toggleClass('active', isActive);
	        var pageLink = $('<a>').addClass('page-link').attr('href', '#').text(i);

	        pageLink.on('click', function (event) {
	            event.preventDefault();
	            var page = $(this).text();
	            searchAndDisplayResults(searchText, searchOption, page);
	        });
	        pageItem.append(pageLink);
	        pagination.append(pageItem);
	    }

	    // 다음 페이지로 이동
	    var nextPageItem = $('<li>').addClass('page-item');
	    var nextPageLink = $('<a>').addClass('page-link').attr('href', '#').text('>');
	    if (currentPage < totalPages) {
	        nextPageLink.on('click', function (event) {
	            event.preventDefault();
	            searchAndDisplayResults(searchText, searchOption, currentPage + 1);
	        });
	    } else {
	        nextPageItem.addClass('disabled');
	    }
	    nextPageItem.append(nextPageLink);
	    pagination.append(nextPageItem);

	    // 마지막 페이지로 이동
	    var lastPageItem = $('<li>').addClass('page-item');
	    var lastPageLink = $('<a>').addClass('page-link').attr('href', '#').text('>>');
	    if (currentPage < totalPages) {
	        lastPageLink.on('click', function (event) {
	            event.preventDefault();
	            searchAndDisplayResults(searchText, searchOption, totalPages);
	        });
	    } else {
	        lastPageItem.addClass('disabled');
	    }
	    lastPageItem.append(lastPageLink);
	        pagination.append(lastPageItem);
	    }
	
	  //테이블 검색한거에 따른 갯수처리
	function updateTable(response) {
    var searchResults = response.searchResults;
    var tableBody = $('#table-body');
    tableBody.empty(); // 이전 검색 결과를 지우고
    if (searchResults.length === 0) {
        // 검색 결과가 없는 경우 검색 결과가 없음을 표시합니다.
        var noResultsRow = $('<tr>');
        var noResultsCell = $('<td>').attr('colspan', 7).text('검색 결과가 없습니다.');
        noResultsRow.append(noResultsCell);
        tableBody.append(noResultsRow);
    	}else {
	        // 검색 결과가 있는 경우
	        $.each(searchResults, function (index, result) {
	            var newRow = $('<tr>');
	
	            // 테이블에 행 추가
	            newRow.append($('<td class="text-center">').text(result.order_idx));
            newRow.append($('<td class="text-center">').text('주문정보')); // 주문정보 처리 방법을 알려주시면 수정하겠습니다.
            newRow.append($('<td class="text-center">').text(result.member_email));
            newRow.append($('<td class="text-center">').text(result.member_name));
            newRow.append($('<td class="text-center">').text(result.order_date));
            newRow.append($('<td class="text-center">').text('주문금액')); // 주문금액 처리 방법을 알려주시면 수정하겠습니다.
    
            const orderState = getOrderState(result.order_state);
            newRow.append($('<td class="text-center">').text(orderState));
    
            newRow.append($('<td class="text-center">').append($('<button type="button" class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#prodRefund">상세보기</button>')));
    	
	
	            tableBody.append(newRow);
	        });
	    }
	
	    // 테이블을 보여줍니다.
	    $('table').show();
	}
	  
	  </script>
			
		<!-- 페이징 -->
			
		
	</div>
		 <nav aria-label="Page navigation example" style="margin-top:20px;">
		    <ul class="pagination justify-content-center">
		      <c:forEach var="i" begin="1" end="${totalPages}">
		        <li class="page-item ${param.page == i || (fn:trim(param.page) == '' && i == 1) ? 'active' : ''}">
		          <a class="page-link">
		            ${i}
		          </a>
		        </li>
		      </c:forEach>
		    </ul>
		  </nav>
	</div>
	 --%>
</main>


<%@ include file="../include/foot.jsp" %>