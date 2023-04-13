<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>


<main>
   
    <div claas="container">
        <div calss="row">
            <div class="col-12 text-center">
                <h2>고객센터</h2>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="d-flex justify-content-center py-3">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a style="color: black;" class="nav-link active" href="#">공지사항</a></li>
                    <li class="nav-item">
                        <a style="color: black;" class="nav-link" href="#">Q&A</a></li>
                </ul>
        </div>
    </div>
    <div class="container" >
        <table class="table" style=" border-top:1px solid black;">
            <thead>
                <tr>
                    <th style="font-size:40px; font-weight:bold;">${noticeVO.notice_title}</th>
                </tr>
                <tr>
                    <th style="float:left; color:gray;">관리자 : ${noticeVO.notice_writer}  </th>
                    <th style="float:left; color:gray;">작성일 : ${noticeVO.notice_wdate}</th>
                    <th style="float:right; color:gray;">조회수 : ${noticeVO.notice_hit}</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td colspan="4" style="height:700px; text-align:left; font-size:20px; background:rgb(242,242,242);">${noticeVO.notice_contents}</td>
                </tr>
                
            </tbody>
        </table>
      
        <div class="btn-group btn-group-lg" role="group" aria-label="Large button group" style="float:right;">
        
        <c:if test="${Login.member_role == 2}">
			 <button type="button" class="btn btn-outline-dark" onclick="location.href='${pageContext.request.contextPath}/customersc/modify.do?notice_idx=${noticeVO.notice_idx}'">수정</button>
    		 <button type="button" class="btn btn-outline-dark" onclick="location.href='${pageContext.request.contextPath}/customersc/delete.do?notice_idx=${noticeVO.notice_idx}'">삭제</button>
		</c:if>  
            <button type="button" class="btn btn-outline-dark"  onclick="location.href='${pageContext.request.contextPath}/customersc/main.do'">글목록</button>
          </div>



    </div>
    
</main>



<%@ include file="../include/foot.jsp" %>
