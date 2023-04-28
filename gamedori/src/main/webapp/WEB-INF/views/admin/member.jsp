<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
					<tbody id="table-body">
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

		</div>
	
	<!-- 검색 -->
	<div class="container">
	    <form class="d-flex justify-content-center align-items-center" role="form">
	        <div class="me-2">
	            <select class="form-select" name="searchOption" aria-label="검색 옵션" style="width: 150px;">
	                <option disabled style="background-color: #f2f2e7;">검색 옵션</option>
	                <option value="name" selected>이름으로 검색</option>
	                <option value="email">이메일로 검색</option>
	            </select>
	        </div>
	        <div class="me-2">
	            <input class="form-control form-control-sm" type="text" name="searchText"aria-label=".form-control-sm example">
	        </div>
	        <div>
	            <button type="submit" class="btn btn-dark btn_search">검색</button>
	        </div>
	    </form>
	</div>
	
	<script>
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
	    sendAjaxRequest('member',searchText, searchOption, page, function(response) {
	        updateTable(response);
	        updatePagination(response.totalPages, searchText, searchOption, page);
	        updatePaginationForAll();
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

	    if (startPage > 1) {
	        var prevPageSetItem = $('<li>').addClass('page-item');
	        var prevPageSetLink = $('<a>').addClass('page-link').attr('href', '#').text('<');
	        prevPageSetLink.on('click', function (event) {
	            event.preventDefault();
	            searchAndDisplayResults(searchText, searchOption, startPage - 1);
	        });
	        prevPageSetItem.append(prevPageSetLink);
	        pagination.append(prevPageSetItem);
	    }

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

	    if (endPage < totalPages) {
	        var nextPageSetItem = $('<li>').addClass('page-item');
	        var nextPageSetLink = $('<a>').addClass('page-link').attr('href', '#').text('>');
	        nextPageSetLink.on('click', function (event) {
	            event.preventDefault();
	            searchAndDisplayResults(searchText, searchOption, endPage + 1);
	        });
	        nextPageSetItem.append(nextPageSetLink);
	        pagination.append(nextPageSetItem);
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
            newRow.append($('<td class="text-center">').text(result.member_idx));
            newRow.append($('<td class="text-center">').text(result.member_name));
            newRow.append($('<td class="text-center">').text(result.member_email));
            newRow.append($('<td class="text-center">').text(result.member_phone));
		if (result.member_level === 1){
   			newRow.append($('<td class="text-center">').text('브론즈'));
       	}else if (result.member_level === 2){
       		newRow.append($('<td class="text-center">').text('실버'));
       	}else{
       		newRow.append($('<td class="text-center">').text('골드'));
       	}
            
			// member_state 셀렉트 박스 추가
			var stateSelect = $('<select class="form-select" onchange="updateMemberState(this,' + result.member_idx + ');">');
			stateSelect.append('<option value="1" ' + (result.member_state === 1 ? 'selected' : '') + '>정상</option>');
			stateSelect.append('<option value="2" ' + (result.member_state === 2 ? 'selected' : '') + '>정지</option>');
			stateSelect.append('<option value="3" ' + (result.member_state === 3 ? 'selected' : '') + '>탈퇴</option>');
			newRow.append($('<td class="text-center">').append(stateSelect));

            tableBody.append(newRow);
        });
    }

    // 테이블을 보여줍니다.
    $('table').show();
}

	  
	  </script>
			
	<!-- 페이징 -->
	<div class="mt-3">
		<nav>
		  <ul class="pagination justify-content-center">
		    <c:forEach var="i" begin="1" end="${totalPages}">
		      <li class="page-item ${param.page == i || (fn:trim(param.page) == '' && i == 1) ? 'active' : ''}">
		        <a class="page-link" >
		          ${i}
		        </a>
		      </li>
		    </c:forEach>
		  </ul>
		</nav>
	</div>
</main>


<%@ include file="../include/foot.jsp" %>