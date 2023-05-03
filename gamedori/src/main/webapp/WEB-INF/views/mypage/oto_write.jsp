<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
<main>		

    <!-- 1 : 1 문의 전체보기 ---------------------------------------------------- -->
	<script><!-- 마이페이지 적립금 계산 -->
		let savept_balance = ${vo.savept_balance};
		et pt_used_amount = ${vo.pt_used_amount};
					  	
		let result = savept_balance - pt_used_amount;
	</script><!-- 마이페이지 적립금 계산 END -->
	
    <div class="container mypage_inner">
        <h4>1 : 1 문의 전체보기</h4>
        <div id="mypage_1" class="col">
            <ul>
				<li>
					<h4>등급</h4>
					<p>
					<c:choose>
						<c:when test="${level == 1}">
						    <c:out value="브론즈" />
						</c:when>
						<c:when test="${level == 2}">
						    <c:out value="실버" />
						 </c:when>
						 <c:when test="${level == 3}">
						    <c:out value="골드" />
						 </c:when>
					</c:choose>
					</p>
				</li>
				<li>
					<h4>적립금</h4>
					<fmt:formatNumber var="savePointt" value="${savePoint}" pattern="#,###"/>
					<p>${savePointt}원</p> <a href="<c:url value='/mypage/point.do' />">적립금 확인 > </a>
					<!--s_money_check.html -->
				</li>
				<li>
					<h4>쿠폰</h4>
					<p> <c:out value="${CouponCount}"/>개</p> <a href="<c:url value='/mypage/coupon.do' />">쿠폰 확인 > </a> <!-- coupon_check.html -->
				</li>
				<li>
					<h4>나의 후기</h4>
					<p><c:out value="${ReviewCount}"/>개</p> <a href="<c:url value='/mypage/reviewlist.do' />">후기 확인 > </a> <!-- review_list.html -->
				</li>
            </ul>
        </div>
        <div id="mypage_inner2" class="container">
        
			<div id="mypage_list" class="col-3">
				<p id="nickname">
					<strong>${sessionScope.Login.member_name}</strong>님 환영합니다.
				</p>

				<ol id="ol_li" class="list-group">
					<li class="list-group-item"><a
						href="<c:url value='/mypage/cart.do'/>">장바구니</a></li>
					<li class="list-group-item"><a
						href="<c:url value='/mypage/prodqa.do'/>">상품문의</a></li>
					<li class="list-group-item"><a
						href="<c:url value='/mypage/oto.do'/>">1 : 1문의</a></li>
					<li class="list-group-item"><a
						href="<c:url value='/mypage/reviewlist.do'/>">나의 후기</a></li>
					<li class="list-group-item"><a
						href="<c:url value='/user/modify.do'/>">회원정보수정</a></li>
					<li class="list-group-item"><a
						href="<c:url value='/user/withdraw.do'/>">탈퇴하기</a></li>
					<!-- unregister2.html -->
				</ol>
			</div>	<!-- mypage_list -->
			
            <div id="one_to_one_inner" class="col-8">     
            
                <div id="oto" class="container">
			        <h2>1 : 1 문의사항 등록</h2>
			        <form name="frm" action="<%=request.getContextPath()%>/mypage/oto_write.do" method="post">
			            
			            <!-- Hidden input field for email -->
			            <input type="hidden" name="member_email" value="${Login.member_email}">
			            
			            <div id="qa_title" class="input-group mb-3">
			                <span class="input-group-text " id="basic-addon1">문의사항 제목</span>
			                <input type="text" class="form-control qa_title" placeholder="Title" aria-label="Username" aria-describedby="basic-addon1"
			                 name="qa_title" id="qa_title" >
			                <div>${fn:escapeXml(qa_title)}</div>
			            </div>
			            
			            <div id="qa_contents" class="input-group">
			                <textarea id="classic" class="form-control otocontents" aria-label="With textarea" name="qa_contents"></textarea>
			                <div>${fn:escapeXml(qa_contents)}</div>
			            </div>

			            <button class="btn btn-dark" style="margin-top:20px; padding:10px 20px; float:right;" onclick="location.href='${pageContext.request.contextPath}/mypage/oto.do'">등록</button>
			        </form>
			    </div>
      
             
        	</div> <!-- end:#ono_to_ono_inner -->
    	</div> <!-- end:#mypage_inner2 -->
    </div>	<!-- end:.mypage_inner -->
    
    
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
		    var qa_title = $('.qa_title').val();
		    var qa_contents = ''; // 변수 초기화
		
		    // CKEditor 인스턴스가 있는 경우, 편집기의 데이터를 가져옵니다.
		    if (classicEditorInstance) {
		    	qa_contents = classicEditorInstance.getData();
		    }
		
		    // 입력값이 있는지 확인
		    if (!otoTitle || otoTitle.trim() === '' || !otoContents || otoContents.trim() === '') {
		        alert('1 : 1 문의사항 제목과 내용을 모두 입력해주세요.');
		        event.preventDefault();
		    } else {
		        $('form[name="frm"]').submit();
		    }
		}

</script>

    <!---------------------------------------------------------------------------->


	</main>


<%@ include file="../include/foot.jsp" %>