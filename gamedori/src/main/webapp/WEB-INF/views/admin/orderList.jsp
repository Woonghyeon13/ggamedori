<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/head.jsp" %>

<script>

	function updateOrderState(obj,idx){
	      $.ajax({
	        type: 'POST',
	        url: 'updateOrderState.do',
	        data: {
				order_state:obj.value
			   ,order_idx : idx
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
						<td class="text-center">${olist.member_email }</td>
						<td class="text-center">${olist.member_name }</td>
						<td class="text-center">${olist.order_date }</td>
						<td class="text-center">${olist.pay_price_real }</td>
						<td class="text-center">
							<select class="form-select" onchange="updateOrderState(this,'${olist.order_idx }');">
								<option value="1" <c:if test="${olist.order_state == 1}">selected</c:if>>주문접수</option>
								<option value="2" <c:if test="${olist.order_state == 2}">selected</c:if>>결제완료</option>
								<option value="3" <c:if test="${olist.order_state == 3}">selected</c:if>>상품 준비중</option>
								<option value="4" <c:if test="${olist.order_state == 4}">selected</c:if>>발송 준비중</option>
								<option value="5" <c:if test="${olist.order_state == 5}">selected</c:if>>발송 완료</option>
								<option value="6" <c:if test="${olist.order_state == 6}">selected</c:if>>주문 취소</option>
							</select>
						</td>
						<td class="text-center">
							<button type="button" class="btn btn-secondary btn-sm"
								data-bs-toggle="modal" data-bs-target="#orderdetail">상세보기</button>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>

		<!-- 주문 상세 모달창-->
		<div class="modal fade" id="orderdetail">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header d-flex flex-column logo">
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						<h4 class="modal-title fs-5">주문내역 상세보기</h4>
					</div>
					<div class="modal-body">
						<div class="row container m-0">
							<p class="mb-0 col p-0">주문번호 : 12345678</p>
							<p class="mb-0 col text-end p-0">주문일자 : 2023-03-27</p>
						</div>
						<div class="container mt-4">
							<div>
								<h5>주문 정보</h5>
							</div>
							<hr>
							<div class="row">
								<div id="p_left" class="col-3">
									<img src="<c:url value='/images/mario.png'/>" style="width:85px; height:85px;">
								</div>
								<div id="p_right" class="col-9">
									<p>닌텐도 스위치 마리오 + 래비드 반짝이는 희망 은하계 에디션</p>
									<div class="row">
										<p class="col">가격 : 64800원</p>
										<p class="col">주문 수량 : 1개</p>
									</div>
								</div>
							</div>
						</div>
						<div class="container mt-4">
							<div>
								<h5>배송지 정보</h5>
							</div>	
							<hr>
							<table class="table">
								<tbody>
									<tr>
										<td class="col-2" style="color: #8f8f8f;">수령인</td>
										<td class="col-8" style="border-bottom: 0px">
											[이름 표시 ex ) 홍길동 ]
										</td>
									</tr>
									<tr>
										<td class="col-2" style="color: #8f8f8f;">연락처</td>
										<td class="col-8" style="border-bottom: 0px">
											[연락처 표시] ex ) 010-0000-0000 ]
										</td>
									</tr>
									<tr>
										<td class="col-2" style="color: #8f8f8f;">배송지</td>
										<td class="col-8" style="border-bottom: 0px">
											[주소 표시 ex ) 전라북도 전주시 덕진구 백제대로 572 5층 이젠컴퓨터학원 ]
										</td>
									</tr>
									<tr>
										<td class="col-2" style="color: #8f8f8f;">배송 메모</td>
										<td class="col-8" style="border-bottom: 0px">
											[메모 표시 ex ) 부재시 경비실에 맡겨주세요. ]
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<div class="container mt-4">
							<div class="row">
								<h5 class="col mb-0">최종 주문 금액</h5>
								<p class="col text-end mb-0 fs-5" style="color: #ee4a44;">77,777원</p>
							</div>
							<hr>
							<table class="table">
								<tr>
									<td style="color: #8f8f8f;">상품 금액</td>
									<td style="text-align: right">64,800원</td>
								</tr>
								<tr>
									<td style="color: #8f8f8f;">배송비</td>
									<td style="text-align: right">0원</td>
								</tr>
								<tr>
									<td style="color: #8f8f8f;">적립금 사용</td>
									<td style="text-align: right">100원</td>
								</tr>
								<tr>
									<td style="color: #8f8f8f;">결제 수단</td>
									<td style="text-align: right">신한카드 / 일시불</td>
								</tr>
							</table>
						</div>
				
						<div class="container mt-4">
							<div>
								<h5>포인트 혜택</h5>
							</div>
							<hr>
							<table class="table">
								<tr>
									<td style="color: #8f8f8f;">구매 적립</td>
									<td style="text-align: right">648원</td>
								</tr>
							</table>
						</div>
						
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