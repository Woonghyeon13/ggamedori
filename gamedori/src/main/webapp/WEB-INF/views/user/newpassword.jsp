<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 스크립트 구문 -->
<script>
    //비밀번호 확인검사
    function validatePassword() {
        const membernPw = document.getElementById("membernpw");
        const memberPwCheck = document.getElementById("MEMBER_PWCheck");
        const pwRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$/;
        const pwIsValid = pwRegex.test(membernPw.value);
        const errorMsgDiv = document.getElementById("password-error-msg");

        if (!pwIsValid) {
            membernPw.setCustomValidity("비밀번호는 영문 대/소문자, 숫자, 8~20자의 길이 특수문자 중 1개 이상 입력해주세요.");
            errorMsgDiv.innerText = "비밀번호는 영문 대/소문자, 숫자, 8~20자의 길이, 특수문자 중 1개 이상 입력해주세요.";
            errorMsgDiv.style.display = "block";
        } else {
            membernPw.setCustomValidity("");
            errorMsgDiv.style.display = "none";
        }

        if (membernPw.value !== memberPwCheck.value) {
            memberPwCheck.setCustomValidity("비밀번호가 일치하지 않습니다.");
            errorMsgDiv.innerText = "비밀번호가 일치하지 않습니다.";
            errorMsgDiv.style.display = "block";
        } else {
            memberPwCheck.setCustomValidity("");
            if (!errorMsgDiv.innerText) {
                // 숨길 에러 메시지가 없는 경우에만 div 엘리먼트를 숨깁니다.
                errorMsgDiv.style.display = "none";
            }
        }
    }

    document.getElementById("membernpw").addEventListener("input", validatePassword);
    document.getElementById("MEMBER_PWCheck").addEventListener("input", validatePassword);

</script>

<style>
    .form-container {
        max-width: 500px;
        margin: auto;
        padding:  20px; }
        
        
    .input_s {
        max-width: 250px;
    }
</style>

<main>
    <div class="form-container">
        <form id="updateMemberForm" class="validation-form" action="<%=request.getContextPath()%>/user/newpassword" method="POST" novalidate>
            <!-- 새 비밀번호 입력 필드 -->
            <div class="mb-4">
                <!-- 이메일 hidden input 필드 -->
				<input type="hidden" id="email" name="email" value="${param.email}">
                <label for="MEMBER_PW" class="form-label fw-bold fs-6">새 비밀번호</label>
                
                <input type="password" class="form-control input_s" id="membernpw" name="membernpw" oninput="validatePassword();" required>
                <div class="invalid-feedback">
                  	  비밀번호를 입력해주세요
                </div>
                <!-- 새 비밀번호 에러 메시지를 나타내는 div 엘리먼트 -->
                <div id="password-error-msg" style="color:red;display:none;"></div>
            </div>

            <!-- 새 비밀번호 확인 입력 필드 -->
            <div class="mb-4">
                <label for="MEMBER_PWCheck" class="form-label fw-bold fs-6">새 비밀번호 확인</label>
                <input type="password" class="form-control input_s" id="MEMBER_PWCheck" oninput="validatePassword();" required>
                <div class="invalid-feedback">
                    비밀번호 확인을 해주세요
                </div>
            </div>

            <!-- 비밀번호 변경 버튼 -->
            <div class="mb-3">
                <button type="submit" class="btn btn-primary">비밀번호 변경</button>
            </div>
        </form>
    </div>
</main>

<%@ include file="../include/foot.jsp" %>