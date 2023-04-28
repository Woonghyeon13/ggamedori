<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/head.jsp" %>

<style>
.ck.ck-editor {
	width:100%;
}
.ck-editor__editable {
	 min-height: 20vw;
}
</style>

<script>
	function sessionToModal(idx, title, contents, name, reply){
	  // 세션 값 가져오기
	  var otoIdx = idx;
	  var otoTitle = title;
	  var otoContents = contents;
	  var memberName = name;
	  var otoReply = reply;
	  
	  // input 태그에 세션 값 할당
	  document.getElementById('otoIdx').value = otoIdx;
	  document.getElementById('otoTitle').value = otoTitle;
	  document.getElementById('otoContents').value = otoContents;
	  document.getElementById('memberName').value = memberName;
	  //document.getElementById('otoReply').value = otoReply;

	 editor.setData(otoReply) ;
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
				<li class="nav-item">
					<!-- 선택시 클래스 fw-bold --> 
					<a class="nav-link active text-reset fw-bold" href="<c:url value='/admin/qaprod.do' />">문의/공지관리</a>
				</li>
				<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/member.do' />">회원 관리</a></li>
			</ul>
		</div>
	</div>
	<!-- 문의/공지사항 탭  -->
	<div class="container mt-4">
		<ul class="nav justify-content-end text-black">
			<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/qaprod.do' />">상품 문의 관리</a></li>
			<li class="nav-item"><a class="nav-link active text-reset fw-bold" href="<c:url value='/admin/oto.do' />">1:1 문의 관리</a></li>
			<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/notice.do' />">공지사항 관리</a></li>
		</ul>
	</div>

	<div class="container mt-1">

		<div class="container">

				<table class="table">
					<thead class="table-light">
						<tr>
							<th class="text-center">번호</th>
							<th class="text-center">제목</th>
							<th class="text-center">회원명</th>
							<th class="text-center">작성일자</th>
							<th class="text-center">처리상태</th>
							<th class="text-center">답변</th>
						</tr>
					</thead>
					  <tbody id = "table-body" >
					<c:forEach var="otol" items="${otoList }">
						<tr>
							<td class="text-center">${otol.qa_idx }</td>
							<td class="text-center">${otol.qa_title }</td>
							<td class="text-center">${otol.member_name }</td>
							<td class="text-center">${otol.qa_wdate }</td>
						<c:if test="${otol.qa_yn == 1 }">
							<td class="text-center">답변 완료</td>
						</c:if>	
						<c:if test="${otol.qa_yn == 2 }">
							<td class="text-center">답변 대기 중</td>
						</c:if>	
							<td class="text-center">
								<button type="button" class="btn btn-secondary btn-sm"
									data-bs-toggle="modal" data-bs-target="#otoRefund" 
									onclick="sessionToModal('${otol.qa_idx }', '${otol.qa_title }',
									 '${otol.qa_contents }', '${otol.member_name }', '${otol.qa_reply }')">답변</button>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
		</div>

		<!-- 답변 모달 -->
		<div class="modal fade" id="otoRefund" data-bs-backdrop="static">
			<div class="modal-dialog modal-dialog-centered modal-lg">
				<div class="modal-content">
					<div class="modal-header d-flex flex-column logo">
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						<h4 class="modal-title fs-5">1:1 문의 관리</h4>
					</div>
					<div class="modal-body">
						<form name="oto" method="post" action="oto_answer.do">
							<input type="hidden" id="otoIdx" name="qa_idx">
							<div class="form-group">
								<label for="memberName" class="form-label">회원명</label>
								<input type="text" id="memberName" class="form-control" readonly disabled>
							</div>
							<div class="form-group mt-3">
								<label for="otoTitle" class="form-label">제목</label>
								<input type="text" id="otoTitle" class="form-control" readonly disabled>
							</div>
							<div class="form-group mt-3">
								<label for="otoContents" class="form-label">문의 내용</label>
								<textarea id="otoContents" class="form-control" style="resize: none;" readonly disabled></textarea>
							</div>
							<hr>
							<div class="form-group mt-2 d-flex flex-column justify-content-center align-items-center">
								<textarea id="otoReply" name="qa_reply" placeholder="1:1 문의 답변 내용" class="form-control"></textarea>
								<script>
									//ck에디터 적용 및 한글 설정, 내용 없을 시에 submit막기까지 구현
									let editor;
	
									ClassicEditor.create(document.querySelector('#otoReply'), {
									  language: 'ko'
									}).then(newEditor => {
									  editor = newEditor;
									  
									  editor.model.document.on('change:data', () => {
									    const textareaValue = editor.getData().trim();
									    const submitBtn = document.querySelector('input[type="submit"]');
	
									    if (textareaValue === '') {
									      submitBtn.disabled = true;
									    } else {
									      submitBtn.disabled = false;
									    }
									  });
									}).catch(error => {
									  console.error(error);
									});
	
									document.querySelector('form').addEventListener('submit', event => {
									  const textareaValue = editor.getData().trim();
	
									  if (textareaValue === '') {
									    event.preventDefault();
									    alert('상품 문의 답변 내용을 입력해주세요.');
									  }
									});			
									
								</script>
							</div>

							<div class="d-flex gap-1 mt-2">
								<input type="submit"
									class="btn btn-outline-secondary btn-lg form-control"
									value="답변등록">
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
		                <option value="name" selected>회원명으로 검색</option>
		                <option value="title">제목으로 검색</option>
		                <option value="content">내용으로 검색</option>
		            </select>
		        </div>
		        <div class="me-2">
		            <input class="form-control form-control-sm" type="text" name="searchText">
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
	    sendAjaxRequest('aoto',searchText, searchOption, page, function(response) {
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
	
	            newRow.append($('<td class="text-center">').text(result.qa_idx));
	            newRow.append($('<td class="text-center">').text(result.qa_title));
	            newRow.append($('<td class="text-center">').text(result.member_name));
	            newRow.append($('<td class="text-center">').text(result.qa_wdate));
	            if (result.qa_yn === 1){
	                newRow.append($('<td class="text-center">').text('답변 완료'));
	            } else {
	                newRow.append($('<td class="text-center">').text('답변 대기 중'));
	            }

	            // Add answer button
	            var answerBtn = $('<button type="button" class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#otoRefund">답변</button>').click(function () {
	                sessionToModal(result.qa_idx, result.qa_title, result.qa_contents, result.member_name, result.qa_reply);
	            });
	            newRow.append($('<td class="text-center">').append(answerBtn));

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
	
	</div>
</main>


<%@ include file="../include/foot.jsp" %>