<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<main>
    <div id="notice" class="container">
        <h2>게시글 작성</h2>
        <form name="frm" action="modify.do?" method="post">
            
            <!-- Hidden input field for email -->
            <input type="hidden" name="member_email" value="${Login.member_email}">
            <input type="hidden" name="notice_idx" value="${noticeVO.notice_idx}">
            
            <div id="n_title" class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">공지사항 제목</span>
                <input type="text" class="form-control noticetitle" placeholder="Title" aria-label="Username" aria-describedby="basic-addon1" name="notice_title" id="notice_title"  value="${noticeVO.notice_title}">
           		<div>${fn:escapeXml(notice_title)}</div>
           
            </div>
            
            <div id="n_contents" class="input-group">
                <span class="input-group-text">공지사항 내용</span>
                <textarea class="form-control noticecontents" aria-label="With textarea" name="notice_contents"></textarea>
                	<div>${fn:escapeXml(notice_contents)}</div>
           
            </div>
        
            <button class="btn btn-dark" onclick="validateForm(event)">등록</button>
        </form>
    </div>

   
    <script>
        function validateForm(event) {
            // 검색어와 검색 옵션 가져오기
            var noticeTitle = $('.noticetitle').val();
            var noticeContents = $('.noticecontents').val();

            // 입력값이 있는지 확인
            if (!noticeTitle || noticeTitle.trim() === '' || !noticeContents || noticeContents.trim() === '') {
                alert('공지사항 제목과 내용을 모두 입력해주세요.');
                event.preventDefault();
            } else {
                $('form[name="frm"]').submit();
            }
        }
    </script>

</main>

<%@ include file="../include/foot.jsp" %>