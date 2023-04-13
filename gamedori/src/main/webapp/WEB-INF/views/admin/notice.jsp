<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
<script src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>

<style>
.ck.ck-editor {
	width:100%;
}
.ck-editor__editable {
	 min-height: 30vw;
}
</style>

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
				<li class="nav-item"><a class="nav-link active text-reset fw-bold" href="<c:url value='/admin/qaprod.do' />">문의/공지관리</a></li>
				<li class="nav-item">
					<!-- 선택시 클래스 fw-bold --> 
					<a class="nav-link text-reset" aria-current="page" href="<c:url value='/admin/member.do' />">회원 관리</a>
				</li>
			</ul>
		</div>
	</div>
	<!-- 문의/공지사항 탭  -->
	<div class="container mt-4">
		<ul class="nav justify-content-end text-black">
			<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/qaprod.do' />">상품 문의 관리</a></li>
			<li class="nav-item"><a class="nav-link text-reset" href="<c:url value='/admin/oto.do' />">1:1 문의 관리</a></li>
			<li class="nav-item"><a class="nav-link active text-reset fw-bold" href="<c:url value='/admin/notice.do' />">공지사항 관리</a></li>
		</ul>
	</div>

	<div class="container mt-1">

		<div class="container">
			
				<table class="table">
					<thead class="table-light">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일자</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody id="table-body">
						<c:forEach var="noticeVO" items="${notice}">
					    <tr>
					      <td>${noticeVO.notice_idx}</td>
					      <td><a href="view.do?notice_idx=${noticeVO.notice_idx}">${noticeVO.notice_title}</a></td>
					      <td>${noticeVO.notice_writer}</td>
					      <td>${noticeVO.notice_hit}</td>
					      <td>${noticeVO.notice_wdate}</td>
						<td>
						  <button type="button" class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#noticeModify" onclick="prepareModify(${noticeVO.notice_idx})">수정</button>
						</td>
						<td>
							 <button class="btn btn-secondary btn-sm" onclick="deleteNotice(${noticeVO.notice_idx})">삭제</button>
						</td>
						 </tr>
		 			 </c:forEach>
					</tbody>
				</table>
		</div>
		</form>


		<!-- 삭제버튼 눌렀을때 작업해줄 내용 -->
		<script>
		    function deleteNotice(noticeIdx) {
		        if (confirm("정말 삭제하시겠습니까?")) {
		            // AJAX 요청을 통해 서버에 삭제 작업을 요청합니다.
		            fetch("notice_delete.do?notice_idx=" + noticeIdx)
		                .then(response => response.json())
		                .then(data => {
		                    if (data.result > 0) {
		                        alert("글 삭제 성공");
		                       location.reload(); // 페이지를 새로 고침합니다.
		                    } else {
		                        alert("글 삭제 실패");
		                    }
		                });
		        }
		    }
		    
		    
		</script>
		
		
<!-- 공지사항 등록 -->
<div class="container d-flex justify-content-end">
    <button type="button" class="btn btn-outline-secondary btn-sm me-4"
            data-bs-toggle="modal" data-bs-target="#noticeWrite">글쓰기</button>
</div>
<div class="modal fade" id="noticeWrite" data-bs-backdrop="static">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header d-flex flex-column logo">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <h4 class="modal-title fs-5">공지사항 등록</h4>
            </div>
            <div class="modal-body">
                <form name="review" method="POST" action="notice_white.do">
                
                  <input type="hidden" name="member_email" value="${Login.member_email}">
                    <div class="form-group d-flex justify-content-around "></div>
                    <div
                            class="form-group mt-2 d-flex justify-content-between align-items-center">
                        <input type="text" class="form-control noticetitle" id="notice_title"
                               placeholder="공지사항 제목" name="notice_title">
                    </div>
                    <div class="form-group mt-2 d-flex justify-content-between align-items-center">
                        <textarea name="notice_contents" id="notice_contents" class="form-control noticecontents"
                                  placeholder="공지사항 내용"></textarea>
                        <script>
                            ClassicEditor.create(document.querySelector('#notice_contents'), {
                                language: "ko"
                            });
                        </script>
                    </div>
                    <div class="d-grid gap-1 mt-2">
                        <input type="submit"
                               class="btn btn-outline-secondary btn-lg form-control"
                               value="공지사항 등록" onclick="validateForm(event)">
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
		                <option value="name" selected>이름으로 검색</option>
		                <option value="content">내용으로 검색</option>
		                <option value="ncontent">이름+내용으로검색</option>
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

	        // 입력값이 있는지 확인하고 AJAX 요청 전송
	        if (searchText.trim() === '' || searchOption === '검색 옵션') {
	            alert('검색어와 검색 옵션을 선택해주세요.');
	            return;
	        } else {
	            $.ajax({
	                url: '<%=request.getContextPath()%>/admin/search.do',
	                method: 'GET',
	                dataType: 'json',
	                data: {
	                    searchText: searchText,
	                    searchOption: searchOption
	                },
	                success: function (response) {
	                    // 검색 결과를 테이블에 추가합니다.
	                    updateTable(response);
	                },
	                error: function (xhr, status, error) {
	                    // 에러 처리
	                    console.log('Error:', error);
	                }
	            });
	        }
	    });
	});

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
	            row.append($('<td>').append($('<button>').addClass('btn btn-secondary btn-sm').attr({ 'type': 'button', 'data-bs-toggle': 'modal', 'data-bs-target': '#noticeModify' }).text('수정').click(function () { prepareModify(notice.notice_idx); })));
	            row.append($('<td>').append($('<button>').addClass('btn btn-secondary btn-sm').attr('onclick', 'deleteNotice(' + notice.notice_idx + ')').text('삭제')));
	            tableBody.append(row);
	        });
	    }
	    // 테이블을 보여줍니다.
	    $('table').show();
	}
	  </script>
		
</tr>
</table>
</div>


</div>
		<!-- 공지사항 수정 -->
		<div class="modal fade" id="noticeModify" data-bs-backdrop="static">
			<div class="modal-dialog modal-dialog-centered modal-xl">
				<div class="modal-content">
					<div class="modal-header d-flex flex-column logo">
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						<h4 class="modal-title fs-5">공지사항 수정</h4>
					</div>
					<div class="modal-body">
						<form name="review" method="post" action="notice_modify.do">
							 <input type="hidden" name="member_email" value="${Login.member_email}">
							 <input type="hidden" name="notice_idx" id="notice_idx" value="">
							<div class="form-group d-flex justify-content-around"></div>
							<div
								class="form-group mt-2 d-flex justify-content-between align-items-center">
								<input type="text" class="form-control mnoticetitle" id="notice_title"
									placeholder="공지사항 제목" name="notice_title">
							</div>
							<div class="form-group mt-2 d-flex justify-content-between align-items-center">
								<textarea name="notice_contents" id="notice_modify" class="form-control mnoticecontents" placeholder="공지사항 내용"></textarea>
								   <script>
								   	ClassicEditor.create( document.querySelector( '#notice_modify' ), {
								        language: "ko"
								        
								      } );
								   	</script>
							</div>
							<div class="d-grid gap-1 mt-2">
							<input type="submit" class="btn btn-outline-secondary btn-lg form-control"
								    value="공지사항 수정" onclick="modify(${noticeVO.notice_idx})">
						</form>
					</div>
				</div>
			</div>
		</div>


		<div>
			<table>
					
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
	</div>
	
	 <script>
	 function prepareModify(noticeIdx) {
		    // noticeIdx를 hidden input에 저장합니다.
		    $('#notice_idx').val(noticeIdx);

		    // 모달 창을 엽니다.
		    $('#noticeModify').modal('show');
		}
    function validateForm(event) {
        // 검색어와 검색 옵션 가져오기
        var noticeTitle = $('.noticetitle').val();
		var noticeContents = $('.noticecontents').val();
		
		
		console.log(noticeTitle);
		console.log(noticeContents);
        // 입력값이 있는지 확인
       if (!noticeTitle || noticeTitle.trim() === '' ) {
            alert('공지사항 제목과 내용을 모두 입력해주세요.');
            
            
            event.preventDefault();
        } else {
            $('form[name="frm"]').submit();
        }
    }
    
    function modify(noticeIdx) {
        if (confirm("정말 수정하시겠습니까?")) {
            // 공지사항 제목과 내용을 가져옵니다.
            var noticeTitle = $('#notice_title').val();
            var noticeContents = CKEDITOR.instances.notice_contents.getData();

            // 입력값이 있는지 확인
            if (!noticeTitle || noticeTitle.trim() === '' || !noticeContents || noticeContents.trim() === '') {
                alert('공지사항 제목과 내용을 모두 입력해주세요.');
            } else {
                // noticeIdx를 hidden input에 저장합니다.
                $('#notice_idx').val(noticeIdx);

                // 공지사항 수정을 위한 폼을 서버로 전송합니다.
                $('form[name="review"]').submit();
            }
        }
    }
</script>
	
</main>


<%@ include file="../include/foot.jsp" %>