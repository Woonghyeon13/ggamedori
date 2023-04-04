<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>

<main>
	<script>
	 	function checkID()
		{	
				var contextPath = '<%=request.getContextPath()%>';
				
				$.ajax({
					url:contextPath+"/user/checkID.do",
					type:"get",
					data:{member_email : $("#member_email").val()},
					success:function(data)
					{
						if(data == '0')
						{
							alert("사용할 수 없는 아이디입니다.");	
							$("#member_email").val("");
						}
						else if(data == '1')
						{
							alert("사용할 수 있는 아이디입니다.");	
						}
					},
					error:function(){
						alert("에러입니다!");
					}
				});
			}
	</script>
	<div class="inner">
		<section id="join_Main" class="d-flex p-2 ">
			<div id="join_box" class="container">
				<div class="input-form-backgroud row">
					<div class="input-form col-md-12">

						<h4 class="mb-3">회원가입</h4>
						<hr />
						<form class="validation-form"
							action="<%=request.getContextPath()%>/user/join.do" method="post">
							<div class="row">

								<div class="col-md-12 mb-3">
									<label for="MEMBER_EMAIL">*이메일</label>
									<div class="input-group mb-3">
										<input type="text" class="form-control" name="member_email"
											id="member_email" placeholder="이메일">

										<button onclick="checkID()" class="btn btn-outline-secondary"
											type="button" id="emailCheck">중복체크</button>
										<div class="invalid-feedback">이메일을 입력해주세요.</div>
									</div>

									<!-- <div class="input-group-addon">
							<button type="button" onclick="checkEamil()" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
						</div>
						<div class="mail-check-box">
						<input class="form-control mail-check-input" id="member_mail_key" name="member_mail_key" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
						</div>
							<span id="mail-check-warn"></span>
						</div> -->
								</div>

								<hr />

								<div class="col-md-6 mb-3">
									<label for="MEMBER_NAME">*비밀번호</label> <input type="password"
										class="form-control input_s" id="member_pw" name="member_pw"
										required>
									<div class="invalid-feedback">비밀번호를 입력해주세요</div>
									<br /> <label for="MEMBER_NAME" class="mt-3 ">*비밀번호 확인</label>
									<input type="password" class="form-control input_s"
										id="MEMBER_PWCheck" required>
									<div class="invalid-feedback">비밀번호를 입력해주세요</div>
								</div>

								<hr />

								<div class="col-md-6 mb-3">
									<label for="MEMBER_NAME">*이름</label> <input type="text"
										class="form-control input_s" name="member_name"
										id="member_name" required>
									<div class="invalid-feedback">이름을 입력해주세요.</div>
								</div>

								<hr />

							</div>

							<div class="mb-4">
								<label for="MEMBER_PHONE" class="form-label fw-bold fs-6">휴대전화</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" name="member_phone"
										id="member_phone" placeholder="휴대폰">

									<div class="invalid-feedback">휴대 번호를 입력해주세요.</div>
								</div>

							</div>




							<!-- 주소검색 api -->
							<label for="addr1">*우편번호</label> <input type="text"
								class="form-control col-md-6 input_s" id="addr_1" name="addr_1"
								placeholder="우편번호" required> <input type="button"
								class="btn btn-outline-secondary btn-sm"
								onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
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
				window.addEventListener('load', () => {
				  const forms = document.getElementsByClassName('validation-form');
			
				  Array.prototype.filter.call(forms, (form) => {
					form.addEventListener('submit', function (event) {
					  if (form.checkValidity() === false) {
						event.preventDefault();
						event.stopPropagation();
					  }
			
					  form.classList.add('was-validated');
					}, false);
				  });
				}, false);
			  </script>

		</section>

	</div>
</main>

<%@ include file="../include/foot.jsp" %>