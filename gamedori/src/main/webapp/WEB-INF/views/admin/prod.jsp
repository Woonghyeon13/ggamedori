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
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/orderList.do' />">주문 관리</a></li>
				<li class="nav-item">
					<!-- 선택시 클래스 fw-bold --> 
					<a class="nav-link text-reset active fw-bold" href="<c:url value='/admin/prod.do' />">상품 관리</a>
				</li>
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/mainPageModify.do' />">화면 관리</a></li>
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/qaprod.do' />">문의/공지관리</a>
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/member.do' />">회원 관리</a></li>
				</li>
			</ul>
		</div>
	</div>
	<!-- 서브메뉴 -->
	<div class="container mt-4">
		<ul class="nav justify-content-end text-black">
			<li class="nav-item"><a class="nav-link active text-reset fw-bold" href="<c:url value='/admin/prod.do' />">상품 등록</a></li>
			<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='' />">판매량 확인</a></li>
		</ul>
	</div>
	<div class="container mt-1">
		<!-- 상품 리스트 -->
		<div class="container">
			<table class="table table-sm ">
				<thead class="table-light">
					<tr>
						<th class="text-center">상품 번호</th>
						<th class="text-center">상품 분류</th>
						<th class="text-center">상품 이름</th>
						<th class="text-center">상품 등록일</th>
						<th class="text-center">재고 수량</th>
						<th class="text-center">재고 상태</th>
						<th class="text-center">상품 관리</th>
					</tr>
				</thead>
				<tbody id = "table-body" >
					<%-- <c:forEach var="pvo" items="${plist}">
						<tr>
							<td class="text-center">${pvo.prod_idx}</td>
							<td class="text-center">${pvo.category_tb_code}</td>
							<td class="text-center">${pvo.prod_name}</td>
							<td class="text-center">${pvo.prod_wdate}</td>
							<td class="text-center">${pvo.prod_stock}</td>
							<td class="text-center">
								<c:if test="${pvo.prod_stock eq 0 }">
									품절
								</c:if>
								<c:if test="${pvo.prod_stock ne 0 }">
									정상
								</c:if>
							</td>
							<td class="col-2">
								<div class="d-flex justify-content-around">
									<button type="button" onclick="location.href='prodmodify.do?prod_idx=${pvo.prod_idx}'" class="btn btn-outline-secondary btn-sm">수정</button>
									<form name="frm" action="prodDelete.do" method="post">
										<input name="prod_idx" type="hidden" value="${pvo.prod_idx}">
										<button id="prodDel" class="btn btn-outline-secondary btn-sm">삭제</button>
									</form>
								</div>
							</td>
						</tr>
					</c:forEach> --%>
				</tbody>
			</table>
		</div>
		<!-- 상품 등록 -->
		<div class="container d-flex justify-content-end">
			<button onclick="location.href='prodinsert.do'" type="button" class="btn btn-outline-secondary btn-sm me-4" >상품 등록</button>
		</div>
			<!-- 검색 -->
	<div class="container">
	    <form class="d-flex justify-content-center align-items-center" role="form">
	        <div class="me-2">
	            <select class="form-select" name="searchOption" aria-label="검색 옵션" style="width: 150px;">
	                <option disabled style="background-color: #f2f2e7;">검색 옵션</option>
	                <option value="name" selected>상품명 </option>
	                <option value="idx" >상품번호 </option>
	            
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
	    sendAjaxRequest('prod',searchText, searchOption, page, function(response) {
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
    } else {
        // 검색 결과가 있는 경우
        $.each(searchResults, function (index, result) {
            var newRow = $('<tr>');

            newRow.append($('<td class="text-center">').text(result.prod_idx));
            newRow.append($('<td class="text-center">').text(result.prod_name));
            newRow.append($('<td class="text-center">').text(result.category_tb_code));
            newRow.append($('<td class="text-center">').text(result.prod_price));
            newRow.append($('<td class="text-center">').text(result.prod_wdate));
            newRow.append($('<td class="text-center">').text(result.prod_stock));
            newRow.append($('<td class="text-center">').text(result.prod_co));

            // 답변 버튼 추가 (이 경우에는 필요 없어보이므로 제거합니다.)

            tableBody.append(newRow);
        });
    }

    // 테이블을 보여줍니다.
    $('table').show();
}
	
	  </script>	
			
	
		<!-- 페이징 -->
		<div class="mt-3">
			<nav aria-label="Page navigation example">
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

	</div>
</main>
<!-- 카테고리 -->
<script>
	// 데이터
	var jsonData = JSON.parse('${category}');
	console.log(jsonData);
	
	var cate1Arr = new Array();
	var cate1Obj = new Object();
	
	for( var i = 0; i < jsonData.length; i ++ )
	{
		if( jsonData[i].level == "1" )
		{
			cate1Obj = new Object();
			cate1Obj.cate_code = jsonData[i].cate_code;
			cate1Obj.cate_name = jsonData[i].cate_name;
			cate1Arr.push(cate1Obj);
		}
	}
	
	var cateSelect1 = $("select.category1");
	
	for( var i =0; i < cate1Arr.length; i++ )
	{
		cateSelect1.append("<option value='" + cate1Arr[i].cate_code + "'>" +cate1Arr[i].cate_name + "</option>");
	}
	
	$(document).on("change","select.category1",function(){
		var cate2Arr = new Array();
		var cate2Obj = new Object();
		
		for( var i = 0; i < jsonData.length; i++ )
		{
			if( jsonData[i].level == "2" )
			{
				cate2Obj = new Object();
				cate2Obj.cate_code = jsonData[i].cate_code;
				cate2Obj.cate_name = jsonData[i].cate_name;
				cate2Obj.cate_refcode = jsonData[i].cate_refcode;
				
				cate2Arr.push(cate2Obj);
			}
		}
		var cateSelect2 = $("select.category2");

		cateSelect2.children().remove();
		
		$("option:selected",this).each(function(){
			var selectVal = $(this).val();
			cateSelect2.append("<option value='"+ selectVal +"'>2차 카테고리</option>");
			
			for( var i = 0; i < cate2Arr.length; i++ )
			{
				if( selectVal == cate2Arr[i].cate_refcode )
				{
					cateSelect2.append("<option value='" + cate2Arr[i].cate_code + "'>" + cate2Arr[i].cate_name + "</option>");
				}
			}
		});
	});
	

</script>

<%@ include file="../include/foot.jsp" %>