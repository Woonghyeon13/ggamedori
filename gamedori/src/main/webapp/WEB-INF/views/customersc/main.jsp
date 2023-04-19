<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<main>

	<div class="container">
		<div class="row">
			<div class="col-12 text-center">
				<h2>고객센터</h2>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="d-flex justify-content-center py-3">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a style="color: black;"
					class="nav-link active" href="<c:url value='/customersc/main.do' />"> 공지사항</a></li>
				<li class="nav-item"><a style="color: black;" class="nav-link"
					href="<c:url value='/customersc/faq.do' />"> 자주 묻는 질문</a></li>
			</ul>
		</div>
	</div>
	<div class="container">
		<table class="table table-bordered table-hover">
		
			<thead style="background:#000; color:#fff;">
				<tr>
					<th width="10%" style="text-align:center;">번호</th>
					<th width="55%">제목</th>
					<th width="10%"  style="text-align:center;">작성자</th>
					<th width="10%"  style="text-align:center;">조회수</th>
					<th width="15%"  style="text-align:center;">날짜</th>
				</tr>
			</thead>
			
		<tbody id = "table-body" >
		
		  <c:forEach var="noticeVO" items="${notice}">
		    <tr>
		      <td style="text-align:center;">${noticeVO.notice_idx}</td>
		      <td><a href="view.do?notice_idx=${noticeVO.notice_idx}">${noticeVO.notice_title}</a></td>
		      <td style="text-align:center;">${noticeVO.notice_writer}</td>
		      <td style="text-align:center;">${noticeVO.notice_hit}</td>
		      <td style="text-align:center;">${noticeVO.notice_wdate}</td>
		    </tr>
		  </c:forEach>
		  
		</tbody>
			
		</table>

	<!-- 검색 -->
	<div class="container">
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
	</div>
	
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
	            return;
	        }
	        
	        // AJAX 요청 전송
	        $.ajax({
	            url: '<%=request.getContextPath()%>/admin/search.do',
	            method: 'GET',
	            dataType: 'json',
	            data: {
	                searchText: searchText,
	                searchOption: searchOption
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
	
	    var searchText = $('input[name="searchText"]').val();
	    var searchOption = $('select[name="searchOption"]').val();
	
	    for (var i = 1; i <= totalPages; i++) {
	        var pageItem = $('<li>').addClass('page-item');
	        var pageLink = $('<a>').addClass('page-link')
	            .attr('href', '#')
	            .attr('data-search-text', searchText)
	            .attr('data-search-option', searchOption)
	            .text(i);
	        pageLink.on('click', function (event) {
	            event.preventDefault();
	            var page = $(this).text();
	            var searchText = $(this).data('searchText');
	            var searchOption = $(this).data('searchOption');
	
	            $.ajax({
	                url: '<%=request.getContextPath()%>/admin/search.do',
	                method: 'GET',
	                dataType: 'json',
	                data: {
	                    searchText: searchText,
	                    searchOption: searchOption,
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
	        $.each(results, function (index, notice) {
	            var row = $('<tr>');
	            row.append($('<td>').text(notice.notice_idx));
	            row.append($('<td>').append($('<a>').attr('href', 'view.do?notice_idx=' + notice.notice_idx).text(notice.notice_title)));
	            row.append($('<td>').text(notice.notice_writer));
	            row.append($('<td>').text(notice.notice_hit));
	            row.append($('<td>').text(notice.notice_wdate));
	            
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
				    <li class="page-item" class="${param.page == i ? 'active' : ''}">
				        <a class="page-link" href="?page=${i}" style="${param.page == i ? 'background-color: #dadbdd; border-color: #ffeeeee;' : ''}">
				            ${i}
				        </a>
				    </li>
				</c:forEach>
			</ul>
		</nav>
	</tr>
	</table>
	</div>

	<!---------customer 끝-------------------------------------------------------------->


</main>
<%@ include file="../include/foot.jsp" %>