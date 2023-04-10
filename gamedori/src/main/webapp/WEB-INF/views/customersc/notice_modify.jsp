<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>

<main>


<div id="notice" class="container">
    <h2>게시글 작성</h2>
    <form name="frm" action="modify.do?" method="post">
        
        <!-- Hidden input field for email -->
        <input type="hidden" name="member_email" value="${Login.member_email}">
        <input type="hidden" name="notice_idx" value="${noticeVO.notice_idx}">
        
        <div id="n_title" class="input-group mb-3">
          <span class="input-group-text" id="basic-addon1">공지사항 제목</span>
          <input type="text" class="form-control" placeholder="Title" aria-label="Username" aria-describedby="basic-addon1" name="notice_title">
        </div>
        
        <div id="n_contents" class="input-group">
          <span class="input-group-text">공지사항 내용</span>
          <textarea class="form-control" aria-label="With textarea" name="notice_contents"></textarea>
        </div>
    
        <button class="btn btn-dark">등록</button>
    </form>
</div>


</main>
<%@ include file="../include/foot.jsp" %>