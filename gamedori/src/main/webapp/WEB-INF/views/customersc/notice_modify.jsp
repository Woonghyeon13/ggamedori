<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<main>
    <div id="notice" class="container">
        <h2>공지사항 수정</h2>
        <form name="frm" action="<%=request.getContextPath()%>/customersc/modify.do?" method="post">
            
            <!-- Hidden input field for email -->
            <input type="hidden" name="member_email" value="${Login.member_email}">
            <input type="hidden" name="notice_idx" value="${noticeVO.notice_idx}">
            
            <div id="n_title" class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">공지사항 제목</span>
           		
                <input type="text" class="form-control noticetitle " placeholder="Title" aria-label="Username" aria-describedby="basic-addon1" 
                	name="notice_title" id="notice_title"  value="${noticeVO.notice_title}">    
                	<div>${fn:escapeXml(notice_title)}</div>      
            </div>
            
            <div id="n_contents" class="input-group ">
                <textarea id="classic" class="form-control noticecontents" aria-label="With textarea" name="notice_contents" >${noticeVO.notice_title} </textarea>
                	<div>${fn:escapeXml(notice_contents)}</div>    
            </div>


<!-- 넓이 높이 조절 -->
<style>
	.ck.ck-editor {
		width:100%;
	   	max-width: 100%;
	}
	
	.ck-editor__editable {
		height:400px;
	    min-height: 400px;
	}
</style>


            <button class="btn btn-dark" style="margin-top:20px; padding:10px 20px; float:right;" onclick="validateForm(event)">수정</button>
        </form>
    </div>

   
<script>
	let classicEditorInstance;
	
	ClassicEditor
	    .create( document.querySelector( '#classic' ))
	    .then( editor => {
	        classicEditorInstance = editor;
	    })
	    .catch( error => {
	        console.error( error );
	    } );
	
	function validateForm(event) {
	    // 검색어와 검색 옵션 가져오기
	    var noticeTitle = $('.noticetitle').val();
	    var noticeContents = $('.noticecontents').val(); // 변수 초기화
	
	    // CKEditor 인스턴스가 있는 경우, 편집기의 데이터를 가져옵니다.
	    if (classicEditorInstance) {
	        noticeContents = classicEditorInstance.getData();
	    }
	
	    // 입력값이 있는지 확인
	    if (!noticeTitle || noticeTitle == '' || !noticeContents || noticeContents == '') {
	        alert('공지사항 제목과 내용을 모두 입력해주세요.');
	        event.preventDefault();
	    } else {
	        $('form[name="frm"]').submit();
	    }
	}
 
</script>




</main>

<%@ include file="../include/foot.jsp" %>