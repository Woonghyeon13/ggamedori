<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 스크립트 구문 -->
<script>
// 로그인 세션 확인 후 비어있으면 메인 페이지로 이동
$(document).ready(function () {
    if (!${!empty Login}) { // 로그인 세션이 비어있는 경우
        alert("로그인이 필요한 페이지입니다.");
        window.location.href = "<%=request.getContextPath()%>/"; // 메인 페이지로 이동
    }
});
//비밀번호 확인검사
function validatePassword() {
  const memberoPw = document.getElementById("memberopw");
  const membernPw = document.getElementById("membernpw");
  const memberPwCheck = document.getElementById("MEMBER_PWCheck");
  const pwRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$/;
  const pwIsValid = pwRegex.test(membernPw.value);
  const errorMsgDiv = document.getElementById("password-error-msg");

  if (!pwIsValid) {
    membernPw.setCustomValidity("비밀번호는 영문 대/소문자, 숫자, 8~20자의 길이 특수문자 중 1개 이상 입력해주세요.");
    errorMsgDiv.innerText = "비밀번호는 영문 대/소문자, 숫자, 8~20자의 길이, 특수문자 중 1개 이상 입력해주세요.";
    errorMsgDiv.style.display = "block";
  } else if (memberoPw.value === membernPw.value) { // 원래 비밀번호와 새 비밀번호가 같은 경우
    membernPw.setCustomValidity("새로운 비밀번호가 기존 비밀번호와 같습니다.");
    errorMsgDiv.innerText = "새로운 비밀번호가 기존 비밀번호와 같습니다. 다른 비밀번호를 입력해주세요.";
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

document.getElementById("memberopw").addEventListener("input", validatePassword);
document.getElementById("membernpw").addEventListener("input", validatePassword);
document.getElementById("MEMBER_PWCheck").addEventListener("input", validatePassword);
		
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	function updateMemberInfo(event) {
  const form = document.querySelector('.validation-form');

  if (!form.checkValidity()) {
    event.preventDefault();
    event.stopPropagation();
    form.classList.add('was-validated');
  } else {
    event.preventDefault(); // 폼 제출을 방지

    // 입력한 정보를 가져옵니다.
    const memberemail = document.getElementById('memberemail').value;
    const memberoPw = document.getElementById('memberopw').value;
    const membernPw = document.getElementById('membernpw').value;
    const memberPwCheck = document.getElementById('MEMBER_PWCheck').value;
    const memberPhone = document.getElementById('member_phone').value;
    const addr1 = document.getElementById('ADDR_1').value;
    const addr2 = document.getElementById('ADDR_2').value;
    const addr3 = document.getElementById('ADDR_3').value;

    // 새 비밀번호와 확인 비밀번호 일치 여부 확인
    if (membernPw !== '' && membernPw !== memberPwCheck) {
      alert('새 비밀번호와 비밀번호 확인이 일치하지 않습니다.');
      return;
    }

    const newPassword = membernPw !== '' ? membernPw : undefined;

    // Ajax 요청을 작성하여 회원 정보 수정을 처리하고 결과를 받아옵니다.
    $.ajax({
      type: 'POST',
      url: '<%=request.getContextPath()%>/user/Member_modfiy.do',
      data: {
        member_email: memberemail,
        member_pw: memberoPw,
        member_npw: newPassword,
        member_phone: memberPhone,
        addr_1: addr1,
        addr_2: addr2,
        addr_3: addr3,
      },
      success: function (response) {
        if (response.result > 0) {
          // 회원 정보 수정 성공
          alert('회원 정보가 정상적으로 수정되었습니다.');
          window.location.href = '<%=request.getContextPath()%>/'; // 홈으로 이동
        } else {
          // 회원 정보 수정 실패
          alert('회원 정보 수정에 실패했습니다. 기존 비밀번호가 일치하는지 확인해주세요.');
        }
      },
      error: function (error) {
        // 서버 오류 처리
        console.error('Error:', error);
        alert('서버 오류가 발생했습니다. 다시 시도해 주세요.');
      },
    });
  }
}

// Bootstrap 유효성 검사 스크립트 부트스트랩의 보안식처리가 올바른지 체크함 올바르지않으면 안넘어가게 
(function () {
  'use strict'
  var forms = document.querySelectorAll('.validation-form')
  Array.prototype.slice.call(forms).forEach(function (form) {
    form.addEventListener('submit', function (event) {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }
      form.classList.add('was-validated')
    }, false)
  })
})()
	

</script>

<main>			

	<div class="inner">
		<section id="join_Main">
			<div id="join_box">
				<form id="updateMemberForm" class="validation-form" onsubmit="updateMemberInfo(event);" novalidate>
				
					 <div class="input-form input-form-background p-4">

		                <h3 class="mb-5">회원 정보 수정</h3>
		
		                <div class="mb-4">
		                    <label for="member_email" class="form-label fw-bold fs-6">이메일</label>
		                    <div class="input_s">
		                        <input type="email" class="form-control" id="memberemail" name="memberemail" value="${Login.member_email}" disabled>
		                    </div>
		                </div>
						<!-- 기존 비밀번호 입력 필드 -->
							<div class="mb-4">
								<label for="MEMBER_PW" class="form-label fw-bold fs-6">기존비밀번호</label>
								<input type="password" class="form-control input_s" id="memberopw" name="memberopw" required>
								<div class="invalid-feedback">
									기존 비밀번호를 입력해주세요
								</div>
							</div>
						<!-- 새 비밀번호 입력 필드 -->
							<div class="mb-4">
							  <label for="MEMBER_PW" class="form-label fw-bold fs-6">새 비밀번호</label>
							  <input type="password" class="form-control input_s" id="membernpw" name="membernpw" oninput="validatePassword();" >
							  <div class="invalid-feedback">
							    비밀번호를 입력해주세요
							  </div>
							  <!-- 새 비밀번호 에러 메시지를 나타내는 div 엘리먼트 -->
							  <div id="password-error-msg" style="color:red;display:none;"></div>
							</div>
							
							<!-- 새 비밀번호 확인 입력 필드 -->
							<div class="mb-4">
							  <label for="MEMBER_PWCheck" class="form-label fw-bold fs-6">새 비밀번호 확인</label>
							  <input type="password" class="form-control input_s" id="MEMBER_PWCheck" oninput="validatePassword();" >
							  <div class="invalid-feedback">
							    비밀번호 확인을 해주세요
							  </div>
							</div>
		
		                <div class="mb-4">
		                    <label for="MEMBER_NAME" class="form-label fw-bold fs-6">이름</label>
		                    <input type="text" class="form-control input_s" id="member_name" name="member_name" value="${Login.member_name}"disabled>
		                </div>
		
		                  <div class="mb-4">
		                    <label for="MEMBER_PHONE" class="form-label fw-bold fs-6">휴대전화</label>
		                    <div class="input-group input_s">
		                        <input type="text" class="form-control" id="member_phone" name="member_phone" value="${Login.member_phone}" >
		                       	 <div>${fn:escapeXml(member_phone)}</div>
		                        <div class="invalid-feedback">
		                       	     휴대전화 번호를 입력해주세요.
		                        </div>
		                    </div>
		                </div>
							<!-- 주소검색 api -->
							<div class="mb-4">
								<label for="ADDR_2" class="form-label mt-1 fw-bold fs-6">주소</label>
								<input type="button" class="btn btn-outline-secondary btn-sm" onclick="sample6_execDaumPostcode()" id="member_addr"value="주소 검색">
								
								<input type="text" class="form-control input_s" id="ADDR_1" placeholder="우편번호"  value ="${Addresses.addr_1}"disabled>
								
								<input type="text" class="form-control input_s mt-1" id="ADDR_2" placeholder="주소" value ="${Addresses.addr_2}" disabled>
								<input type="text" class="form-control input_s mt-1" id="ADDR_3" placeholder="상세주소" value ="${Addresses.addr_3}">
								<div>${fn:escapeXml(ADDR_3)}</div>
								<div class="invalid-feedback">
									주소를 입력해주세요
								</div>
							</div>
							
						
							<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
							<script>
								function sample6_execDaumPostcode() 
								{
									new daum.Postcode(
										{
										oncomplete: function(data) 
										{
											// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
											// 각 주소의 노출 규칙에 따라 주소를 조합한다.
											// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
											var addr = ''; // 주소 변수
											var extraAddr = ''; // 참고항목 변수
											//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
											if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
												addr = data.roadAddress;
											} else { // 사용자가 지번 주소를 선택했을 경우(J)
												addr = data.jibunAddress;
											}
											// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
											if(data.userSelectedType === 'R')
											{
												// 법정동명이 있을 경우 추가한다. (법정리는 제외)
												// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
												if(data.bname !== '' && /[동|로|가]$/g.test(data.bname))
												{
													extraAddr += data.bname;
												}
												// 건물명이 있고, 공동주택일 경우 추가한다.
												if(data.buildingName !== '' && data.apartment === 'Y')
												{
													extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
												}
											}
											// 우편번호와 주소 정보를 해당 필드에 넣는다.
											document.getElementById('ADDR_1').value = data.zonecode;
											document.getElementById("ADDR_2").value = addr;
											// 커서를 상세주소 필드로 이동한다.
											document.getElementById("ADDR_3").focus();
										}
									}).open();
								}
							</script>
					
						
						<div class="d-flex flex-row-reverse input_s mt-4 mb-4">
							<button class="btn btn-outline-light login">수정 완료</button>
						</div>
					</div>
				</form>
			</div>
		</section>
	</div>


</main>

<%@ include file="../include/foot.jsp" %>