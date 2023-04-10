<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>

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

		<table class="table table-hover" style="border-top: 1px solid black; margin-left:2%;">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
			 <!-- 검색 결과가 있을 경우 -->
				  <c:if test="${not empty searchResult}">
				    <c:forEach var="noticeVO" items="${searchResult}">
				      <tr>
				        <td>${noticeVO.notice_idx}</td>
				        <td><a href="view.do?notice_idx=${noticeVO.notice_idx}">${noticeVO.notice_title}</a></td>
				        <td>${noticeVO.notice_writer}</td>
				        <td>${noticeVO.notice_hit}</td>
				        <td>${noticeVO.notice_wdate}</td>
				      </tr>
				    </c:forEach>
				  </c:if>
				  <!-- 검색 결과가 없을 경우 또는 검색을 하지 않았을 경우 -->
				  <c:if test="${empty searchResult}">
				    <c:forEach var="noticeVO" items="${notice}">
				      <tr>
				        <td>${noticeVO.notice_idx}</td>
				        <td><a href="view.do?notice_idx=${noticeVO.notice_idx}">${noticeVO.notice_title}</a></td>
				        <td>${noticeVO.notice_writer}</td>
				        <td>${noticeVO.notice_hit}</td>
				        <td>${noticeVO.notice_wdate}</td>
				      </tr>
				    </c:forEach>
				  </c:if>
			</tbody>
		</table>


		<div>
			<table>
				<tr>						
					<td>
					    <form action="search.do" method="GET">
					        <!-- 검색 옵션 드롭다운 추가 -->
					        <input class="form-control" style="width: 300px;" type="text" name="searchText" aria-label="default input example">
					        <select class="form-select" name="searchOption" aria-label="검색 옵션" style="width: 150px;">
					            <option selected>검색 옵션</option>
					            <option value="name">이름으로 검색</option>
					            <option value="content">내용으로 검색</option>
					        </select>
					        <button type="submit" class="btn btn-dark btn_search">검색</button>
					    </form>
					    <c:if test="${Login.member_role == 2}">
					        <button type="button" class="btn btn-dark" onclick="location.href='notice_write.do'">글쓰기</button>
					    </c:if>
					</td>
					
	<script>

		   	 $(document).ready(function() {
		        $('.btn_search').click(function(event) {
		            event.preventDefault();

		            // 검색어와 검색 옵션 가져오기
		            var searchText = $('input[name="searchText"]').val();
		            var searchOption = $('select[name="searchOption"]').val();

		            // 입력값이 있는지 확인하고 AJAX 요청 전송
		            if (searchText.trim() === '' || searchOption === '검색 옵션') {
		                alert('검색어와 검색 옵션을 선택해주세요.');
		                return;
		            } else {
		                $.ajax({
		                    url: '<%=request.getContextPath()%>/customersc/search.do',
		                    method: 'GET',
		                    dataType: 'json',
		                    data: {
		                        searchText: searchText,
		                        searchOption: searchOption
		                    },
		                    success: function(response) {
		                        // 검색 결과를 테이블에 추가합니다.
		                    	updateTable(response);
		                    	console.log('데이터 들어온거맞아?:', response);
		         
		                    },
		                    error: function(xhr, status, error) {
		                        // 에러 처리
		                        console.log('Error:', error);
		                    }
		                });
		            }
		        });
		    });
		   	 
		   	function updateTable(results) {
		   	    var tableBody = $('table').children('tbody');
		   	    if (tableBody.length === 0) {
		   	        tableBody = $('<tbody>');
		   	        $('table').append(tableBody);
		   	    }
		   	    // 검색 결과를 테이블에 추가합니다.
		   	    tableBody.empty(); // tbody의 내용을 지우고
		   	    if (results.length === 0) {
		   	        // 검색 결과가 없는 경우
		   	        tableBody.append($('<tr>').append($('<td>').text('검색 결과가 없습니다.')));
		   	    } else {
		   	        // 검색 결과가 있는 경우
		   	        $.each(results, function(index, notice) {
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
			
			
			</script>
										
						<!-- 페이징 -->
						
						<nav aria-label="Page navigation example">
  							<ul class="pagination justify-content-center" >
								<c:forEach var="i" begin="1" end="${totalPages}">
									<li class="page-item" class="${param.page == i ? 'active' : ''}"><a class="page-link" href="?page=${i}">${i}</a></li>
								</c:forEach>
							</ul>
						</nav>
				</tr>
			</table>
		</div>


	</div>
	<!---------customer 끝-------------------------------------------------------------->


</main>
<%@ include file="../include/foot.jsp" %>