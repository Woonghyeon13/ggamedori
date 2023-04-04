<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
<main>			
	<!-- 각 폼에 회원의 정보값이 나오게 해주세요 -->
	<div class="inner">
		<section id="join_Main">
			<div id="join_box">
				<form class="validation-form" novalidate><!-- novalidate 속성이 있으면 서버에서 유효성 검사를 안한다고합니다. 조율 후에 변경해야 할 듯 함. -->
					<!-- 유효성 검사는 ajax를 사용해도 될듯 참고해주세요 -->
					<div class="input-form input-form-background p-4">

						<h3 class="mb-5">회원 정보 수정</h3>

							<div class="mb-4">
								<label for="MEMBER_EMAIL" class="form-label fw-bold fs-6">이메일</label>
								<div class="input_s">
									<input type="email" class="form-control" disabled>
								</div>
							</div>

							<div class="mb-4">
								<label for="MEMBER_PW" class="form-label fw-bold fs-6">비밀번호</label>
								<input type="password" class="form-control input_s" id="MEMBER_PW" required>
								<div class="invalid-feedback">
									비밀번호를 입력해주세요
								</div>
							</div>

							<div class="mb-4">
								<label for="MEMBER_PWCheck" class="form-label fw-bold fs-6">비밀번호 확인</label>
								<input type="password" class="form-control input_s" id="MEMBER_PWCheck" required>
								<div class="invalid-feedback">
									비밀번호 확인을 해주세요
								</div>
							</div>

							<div class="mb-4">
								<label for="MEMBER_NAME" class="form-label fw-bold fs-6">이름</label>
								<input type="text" class="form-control input_s" id="MEMBER_NAME" disabled>
							</div>

							<div class="mb-4">
								<label for="MEMBER_PHONE" class="form-label fw-bold fs-6">휴대전화</label>
								<div class="input-group input_s">
									<input type="text" class="form-control" id="MEMBER_PHONE" required>
									<button class="btn btn-outline-secondary" type="button" id="button-addon2">본인확인</button>
									<div class="invalid-feedback">
										휴대전화 번호를 입력해주세요.
									</div>
								</div>
							</div>


							<!-- 주소검색 api -->
							<div class="mb-4">
								<label for="ADDR_2" class="form-label mt-1 fw-bold fs-6">주소</label>
								<input type="button" class="btn btn-outline-secondary btn-sm" onclick="sample6_execDaumPostcode()" value="주소 검색">
								<input type="text" class="form-control input_s" id="ADDR_1" placeholder="우편번호" required>
								<input type="text" class="form-control input_s mt-1" id="ADDR_2" placeholder="주소" required>
								<input type="text" class="form-control input_s mt-1" id="ADDR_3" placeholder="상세주소">
								<div class="invalid-feedback">
									주소를 입력해주세요
								</div>
							</div>
							
							<!--
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
						-->
						
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