<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script>

var emailRegex = /\S+@\S+\.\S+/;

var isEmailAvailable = false;

function validateEmail() {
	  var email = $("#member_email").val();
	  var emailIsValid = emailRegex.test(email);

	  if (!email) {
	    emailInput.addClass("is-invalid");
	    emailInput.nextAll(".invalid-feedback:first").show();
	  } else if (!emailIsValid) {
	    emailInput.addClass("is-invalid");
	    emailInput.nextAll(".invalid-feedback:last").show();
	  } else {
	    emailInput.removeClass("is-invalid");
	    emailInput.nextAll(".invalid-feedback").hide();
	    if (!$("#member_email").data("checked")) { // 중복 체크가 수행되지 않은 경우에만 체크
	      checkID();
	    }
	  }
	}

	$("#emailCheck").on("click", function() {
	  $("#member_email").data("checked", false); // 중복 체크 버튼 클릭 시에만 체크
	  checkID();
	});

	function checkID() {
		  var email = $(".memberemail").val();

		  if (!emailRegex.test(email)) {
		    alert("유효한 이메일 주소를 입력해주세요.");
		    return;
		  }

		  var contextPath = '<%=request.getContextPath()%>';

		  $.ajax({
		    url: contextPath + "/user/checkID.do",
		    type: "get",
		    data: { member_email : email },
		    success: function(data) {
		    	  $("#member_email").data("checked", true); // 중복 체크 완료
		    	  if (data == '0') {
		    	    alert("사용할 수 없는 이메일입니다.");	
		    	    $("#member_email").val("");
		    	    isEmailAvailable = false;
		    	  } else if (data == '1') {
		    	    alert("사용할 수 있는 이메일입니다.");	
		    	    isEmailAvailable = true;
		    	  }
		    	},
		    error: function() {
		      alert("에러입니다!");
		    }
		  });
		}
</script>
<main>
	
	<div class="inner">
		<section id="join_Main" class="d-flex p-2 ">
			<div id="join_box" class="container">
				<div class="input-form-backgroud row">
					<div class="input-form col-md-12">

						<h4 class="mb-3">회원가입</h4>
						<hr />
						<form id="signupForm" class="validation-form" action="<%=request.getContextPath()%>/user/join.do" method="post">
							<div class="row">

							<div class="col-md-12 mb-3">
								 <label for="MEMBER_EMAIL">*이메일</label>
							        <div class="input-group mb-3">
							          <input type="email" class="form-control memberemail" name="member_email" id="member_email" placeholder="이메일" required>
							          <div>${fn:escapeXml(member_email)}</div>
							          <button type="button" onclick="checkID()" class="btn btn-outline-secondary" id="emailCheck">중복체크</button>
							          <div class="invalid-feedback">이메일을 입력해주세요.</div>
							          <div class="invalid-feedback">유효한 이메일 주소를 입력해주세요.</div>
							        </div>
								</div>


							
							<div class="col-md-6 mb-3">
							  <label for="member_pw">*비밀번호</label>
							  	<input type="password" class="form-control input_s memberpw" id="member_pw" name="member_pw" required>
							
							  <div class="invalid-feedback" id="pw-invalid-feedback">비밀번호는 영문 대/소문자, 숫자, 8~20자의 길이 특수문자 중 1개 이상 입력해주세요</div>
							  <br>
							  <label for="MEMBER_PWCheck" class="mt-3">*비밀번호 확인</label>
							 	 <input type="password" class="form-control input_s" id="MEMBER_PWCheck" name="MEMBER_PWCheck" required>
						
							  <div id="pwcheck-invalid-feedback" class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
							  <div id="pwcheck-valid-feedback" class="valid-feedback">비밀번호가 일치합니다.</div>
							  <br>
							
							<script>
							
							// 비밀번호 암호식  비밀번호 체크 스크립트 
							  var member_pw = document.querySelector(".memberpw");
							  var pwCheckInput = document.getElementById("MEMBER_PWCheck");
							  var pwRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$/;
							
							  function validatePassword() {
							    var pw = member_pw.value;
							    var pwCheck = pwCheckInput.value;
							    var pwIsValid = pwRegex.test(pw);
							
							    if (!pwIsValid) {
							      member_pw.classList.add("is-invalid");
							      document.getElementById("pw-invalid-feedback").style.display = "block";
							      return false;
							    } else {
							      member_pw.classList.remove("is-invalid");
							      document.getElementById("pw-invalid-feedback").style.display = "none";
							    }
							
							    if (pw !== pwCheck) {
							      pwCheckInput.classList.add("is-invalid");
							      document.getElementById("pwcheck-invalid-feedback").style.display = "block";
							      document.getElementById("pwcheck-valid-feedback").style.display = "none";
							      return false;
							    } else {
							      pwCheckInput.classList.remove("is-invalid");
							      document.getElementById("pwcheck-invalid-feedback").style.display = "none";
							      document.getElementById("pwcheck-valid-feedback").style.display = "block";
							      return true;
							    }
							  }
							
							  member_pw.addEventListener("input", validatePassword);
							  pwCheckInput.addEventListener("input", validatePassword);
							
							  function submitForm() {
							    var isPasswordValid = validatePassword();
							    if (!isPasswordValid) {
							      alert("비밀번호 보안식이 올바르지 않습니다. 다시 확인해주세요.");
							      return false;
							    } else {
							      return true;
							    }
							  }
							
							</script>
							</div>
							
							</div>
							
								<div class="col-md-6 mb-3">
									<label for="MEMBER_NAME">*이름</label> <input type="text"
										class="form-control input_s" name="member_name"
										id="member_name" required>
										<div>${fn:escapeXml(member_name)}</div>
									<div class="invalid-feedback">이름을 입력해주세요.</div>
								</div>
							
							

							<div class="mb-4">
								<label for="MEMBER_PHONE" class="form-label fw-bold fs-6">휴대전화</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" name="member_phone"
										id="member_phone" placeholder="휴대폰">
											<div>${fn:escapeXml(member_phone)}</div>
										

									<div class="invalid-feedback">휴대 번호를 입력해주세요.</div>
								</div>

							</div>




							<!-- 주소검색 api -->
							<label for="addr1">*우편번호</label> <input type="text"
								class="form-control col-md-6 input_s" id="addr_1" name="addr_1"
								placeholder="우편번호" required> 
								
								<input type="button" class="btn btn-outline-secondary btn-sm" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" name="member_addr">
								<div>${fn:escapeXml(member_addr)}</div>
								
							<div class="invalid-feedback mb-3">우편번호를 입력해주세요</div>
							
							<br /> <label for="addr2" class="mt-3">*주소</label> <input
								type="text" class="form-control col-md-6 input_s" id="addr_2"
								name="addr_2" placeholder="주소" required>
							<div class="invalid-feedback mt-3">주소를 입력해주세요</div>
							<br> <input type="text"
								class="form-control col-md-6 mb-3 input_s" id="addr_3"
								name="addr_3" placeholder="상세주소">


							<script
								src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
										document.getElementById('addr_1').value = data.zonecode;
										document.getElementById("addr_2").value = addr;
										// 커서를 상세주소 필드로 이동한다.
										document.getElementById("addr_3").focus();
									}
								}).open();
							}
						</script>



							<br />
							<button class="btn btn-primary btn-block mt-4" type="submit">가입
								완료</button>
							<div class="mb-4"></div>

						</form>
					</div>
				</div>
			</div>

			<script>
			$("#signupForm").on("submit", function(e) {
				  var isPasswordValid = validatePassword();

				  if (!$("#member_email").data("checked")) {
				    alert("이메일 중복 체크를 해주세요.");
				    e.preventDefault(); // 폼 제출을 중지합니다.
				  } else if (!isEmailAvailable) {
				    alert("중복된 이메일입니다. 다른 이메일을 사용해주세요.");
				    e.preventDefault(); // 폼 제출을 중지합니다.
				  } else if (!isPasswordValid) {
				    alert("비밀번호 보안식이 올바르지 않습니다. 다시 확인해주세요.");
				    e.preventDefault(); // 폼 제출을 중지합니다.
				  } else {
				    // 이메일 중복 체크와 비밀번호 유효성 검사가 모두 완료된 경우 폼이 정상적으로 제출됩니다.
				  }
				});
			  </script>

		</section>

	</div>
</main>

<%@ include file="../include/foot.jsp" %>