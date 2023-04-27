<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ include file="../include/head.jsp" %>

<!-- 별점 등록 자바스크립트 -->
<script>
const starRating = document.querySelector(".starRatingVt");

if (starRating) {
  const stars = starRating.querySelectorAll("input[type='radio']");
  const labels = starRating.querySelectorAll("label");

  stars.forEach((star) => {
    star.addEventListener("click", function (e) {
      labels.forEach((label) => {
        if (label.htmlFor === e.target.getAttribute("id")) {
          label.classList.add("checked");
        } else {
          label.classList.remove("checked");
        }
      });
    });
  });
}

</script>

<main>
	<!-- 상품 정보 -------------------------------------------->
	<input type="hidden" name="member_idx" value="${Login.member_idx}">
	<div class="container inner">
		<div class="container mt-5">
			<div class="row">
				<div class="col-7">
					<img class="border" src="<c:url value='/images/${pvo.prod_imgm}' />">
				</div>
				<div class="col-5">
					<div class="container">
						<div>
							<h2 class="fw-bold">${pvo.prod_name}</h2>
						</div>
						<div class="mb-4" style="border-bottom: 1px solid #000;">
							<p>한글판</p>
						</div>
						<div class="row align-items-start">
							<div class="col-3">
								<p class="fw-semibold">판매가격</p>
							</div>
							<div class="col-9 d-flex">
								<h6>
									<span class="fw-bold fs-5 me-1" style="color: #ee4a44;">${pvo.prod_price}</span>
								</h6>
								<p>원</p>
							</div>
						</div>
						<div class="row align-items-start">
							<div class="col-3">
								<p class="fw-semibold">적림금</p>
							</div>
							<div class="col-9">
								<p>
									<span>구매금액(추가옵션 제외)의 1%</span>
								</p>
							</div>
						</div>
						<div class="row align-items-start">
							<div class="col-3">
								<p class="fw-semibold">배송비</p>
							</div>
							<div class="col-9">
								<p>주문시 결제</p>
							</div>
						</div>
						<hr>
							<div class="row align-items-start">
								<div class="col-3">
									<p class="fw-semibold">제조사</p>
								</div>
								<div class="col-9">
									<p>${pvo.prod_co}</p>
								</div>
							</div>
							<div class="row align-items-start">
								<div class="col-3">
									<p class="fw-semibold">출시일</p>
								</div>
								<div class="col-9">
									<p>${pvo.prod_rdate}</p>
								</div>
							</div>
							<div class="row align-items-start">
								<div class="col-3">
									<p class="fw-semibold">기종</p>
								</div>
								<div class="col-9">
									<c:if test="${pvo.category_tb_code eq '100' or pvo.category_tb_code eq '101' or pvo.category_tb_code eq '102' or pvo.category_tb_code eq '103' or pvo.category_tb_code eq '104'}">
										닌텐도 Switch
									</c:if>
									<c:if test="${param.cate_refcode eq '200' or pvo.category_tb_code eq '201' or pvo.category_tb_code eq '202' or pvo.category_tb_code eq '203'}">
										PlayStation5
									</c:if>
									<c:if test="${param.cate_refcode eq '300' or pvo.category_tb_code eq '301' or pvo.category_tb_code eq '302' or pvo.category_tb_code eq '303'}">
										PlayStation4
									</c:if>
									<c:if test="${pvo.category_tb_code eq '400' or pvo.category_tb_code eq '401' or pvo.category_tb_code eq '402' or pvo.category_tb_code eq '403'}">
										XBOX
									</c:if>
									<c:if test="${pvo.category_tb_code eq '500'}">
										GOODS
									</c:if>
								</div>
							</div>
							<p style="font-size: 12px;">
								최소 구매수량은 <span class="fw-bold" style="color: #ee4a44;">1개</span>,
								최대 구매수량은 <span class="fw-bold" style="color: #ee4a44;">2개</span>입니다.
							</p>
							<div class="row align-items-baseline">
								<div class="col-3">
									<p class="fw-semibold">제품옵션</p>
								</div>
								<!--옵션선택에 따른 영억 block-->
								<div class="col-9">
									  <select id="optSel" class="form-select" aria-label="Default select example">
							            <option>선택</option>
							            <c:forEach var="opt" items="${optlist}" varStatus="status">
							                <option value="${status.count}" ${status.count == 1 ? 'selected' : ''}>${opt.opt_name}</option>
							            </c:forEach>
							        </select>
									<div class="choice_product mt-3" style="margin: auto 0;">
										<c:forEach var="optt" items="${optlist}" varStatus="status">
										<input type="hidden" id="optPrice${status.count}" value="${optt.opt_price}">
										<input type="hidden" id="opttIdx${status.count}" value="${optt.opt_idx}">
										<div class="border-top border-bottom mx-2" id="optSel${status.count}"
											style="display: none;">
											<div class="d-flex justify-content-between">
												<div class="mt-3">
													<p>${pvo.prod_name} : ${optt.opt_name}</p>
												</div>
												<div class="btn-group btn-group-sm my-3" role="group">
												  <button type="button" class="btn btn-secondary"
												    style="width: 2vw;" onclick="change_qty(${status.count}, 'm')">-</button>
												  <input type="text" name="ct_qty1" id="ct_qty${status.count}" value="1"
												    readonly="readonly" class="text-center"
												    style="width: 3vw;">
												  <button type="button" class="btn btn-secondary"
												    style="width: 2vw;" onclick="change_qty(${status.count}, 'p')">+</button>
												</div>
												<div class="mt-3">
													<button class="btn" id="optClo${status.count}">x</button>
												</div>
											</div>
										</div>
										</c:forEach>
									</div>
								</div>
							</div>
							<p class="d-flex justify-content-end my-4 align-items-end">
								총 금액<span class="fs-3 me-1 ms-2 fw-bold" id="total_amount"
									style="color: #ee4a44;">${pvo.prod_price}</span>원
							</p>
							<div
								class="d-grid gap-2 d-md-flex justify-content-between align-items-baseline">
								<button class="btn btn-secondary" type="button"
									style="width: 280px; height: 60px;">장바구니 담기</button>
							<c:if test="${empty sessionScope.Login}">
									<button class="btn btn-outline-light login" onclick="javascript:prodBtn()"
										style="width: 280px; height: 60px;">바로 구매하기</button>
							</c:if>
							<c:if test="${not empty sessionScope.Login}">
								<form name="frm" action="orderForm.do" method="get">
									<input type="hidden" name="opt_idx1" id="optIdx1">
									<input type="hidden" name="opt_idx2" id="optIdx2" value="0">
									<input type="hidden" name="opt_idx3" id="optIdx3" value="0">
									<input type="hidden" name="opt_idx4" id="optIdx4" value="0">
									<input type="hidden" name="opt_idx5" id="optIdx5" value="0">
									<input type="hidden" name="opt_qty1" id="optQty1">
									<input type="hidden" name="opt_qty2" id="optQty2" value="0">
									<input type="hidden" name="opt_qty3" id="optQty3" value="0">
									<input type="hidden" name="opt_qty4" id="optQty4" value="0">
									<input type="hidden" name="opt_qty5" id="optQty5" value="0">
									<button class="btn btn-outline-light login"
										style="width: 280px; height: 60px;">바로 구매하기</button>
								</form>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 상품 상세정보 -------------------------------- -->
		<div class="container mt-5">
			<ul class="nav justify-content-center nav-fill nav-tabs text-black">
				<li class="nav-item"><a id="productNav1"
					class="nav-link active text-reset fw-bold" aria-current="page"
					href="#productNav1">상품상세</a></li>
				<li class="nav-item"><a class="nav-link text-reset"
					href="#productNav2">배송안내</a></li>
				<li class="nav-item"><a class="nav-link text-reset"
					href="#productNav3">고객리뷰(0)</a></li>
				<li class="nav-item"><a class="nav-link text-reset"
					href="#productNav4">상품문의</a></li>
			</ul>
			<!--상세 사진 영역-->
			<div class="container d-flex justify-content-center mt-3">
				<img src="<c:url value='/images/${pvo.prod_imgd}' />" alt="">
			</div>
		</div>
		<!-- 배송안내 -->
		<div class="container mt-5">
			<ul class="nav justify-content-center nav-fill nav-tabs text-black">
				<li class="nav-item"><a class="nav-link text-reset"
					aria-current="page" href="#productNav1">상품상세</a></li>
				<li class="nav-item"><a id="productNav2"
					class="nav-link active text-reset fw-bold" href="#productNav2">배송안내</a>
				</li>
				<li class="nav-item"><a class="nav-link text-reset"
					href="#productNav3">고객리뷰(0)</a></li>
				<li class="nav-item"><a class="nav-link text-reset"
					href="#productNav4">상품문의</a></li>
			</ul>
			<!--배송 안내 사진 영역-->
			<div class="container">
				<div class="container d-flex justify-content-center mt-3">
					<img src="<c:url value='/images/겜우리 합배송 관련 주의사항.jpg' />" alt="">
				</div>
			</div>
		</div>
		<!-- 리뷰 ------------------------------------------------------------------------->
		
		<div class="container mt-5">
			<ul class="nav justify-content-center nav-fill nav-tabs text-black">
				<li class="nav-item"><a class="nav-link text-reset"
					aria-current="page" href="#productNav1">상품상세</a></li>
				<li class="nav-item"><a class="nav-link text-reset"
					href="#productNav2">배송안내</a></li>
				<li class="nav-item"><a id="productNav3"
					class="nav-link active text-reset fw-bold" href="#productNav3">고객리뷰(0)</a>
				</li>
				<li class="nav-item"><a class="nav-link text-reset"
					href="#productNav4">상품문의</a></li>
			</ul>
		</div>
		<div class="container mt-5">
			<div style="border-bottom: 2px solid #000;">
				<h2>고객리뷰(0)</h2>
			</div>
			<table class="table w-100 text-center">
				<tr>
					<td class="col-1 ps-3">
					<div class="starCnt">
						<div class="starRating-wrap">
							<div id="starCenter">
								<fieldset class="starRating">
									<input type="radio" id="star5" name="review_star" value="10" onclick="return(false);"/><label for="star5" class="full" title="Awesome"></label>
									<input type="radio" id="star4.5" name="review_star" value="9" onclick="return(false);"/><label for="star4.5" class="half"></label>
									<input type="radio" id="star4" name="review_star" value="8" onclick="return(false);"/><label for="star4" class="full"></label>
									<input type="radio" id="star3.5" name="review_star" value="7" onclick="return(false);" checked="checked"/><label for="star3.5" class="half"></label>
									<input type="radio" id="star3" name="review_star" value="6" onclick="return(false);"/><label for="star3" class="full"></label>
									<input type="radio" id="star2.5" name="review_star" value="5" onclick="return(false);"/><label for="star2.5" class="half"></label>
									<input type="radio" id="star2" name="review_star" value="4" onclick="return(false);"/><label for="star2" class="full"></label>
									<input type="radio" id="star1.5" name="review_star" value="3" onclick="return(false);"/><label for="star1.5" class="half"></label>
									<input type="radio" id="star1" name="review_star" value="2" onclick="return(false);"/><label for="star1" class="full"></label>
									<input type="radio" id="star0.5" name="review_star" value="1" onclick="return(false);"/><label for="star0.5" class="half"></label>
								</fieldset>
							</div>
						</div>
					</div>
					</td>
					<td class="col-1 align-bottom"><p>작성자</p></td>
					<td class="col-10 align-bottom" style="text-align: left;"><p>작성일</p></td>
				</tr>
				<tr>
					<td class="ps-3" colspan="3" style="text-align: left;"><span
						class="fw-bold fs-4">title</span> <br> 내용 <br> <img
						src="<c:url value='/images/GU1vXFJpbzGYNV6UN3U0Cnnb.jpg' />" class="me-3 mt-3"
						style="border-radius: 6px;" alt="" width="100px" height="100px">
						<img src="<c:url value='/images/GU1vXFJpbzGYNV6UN3U0Cnnb.jpg' />" class="me-3 mt-3"
						style="border-radius: 6px;" alt="" width="100px" height="100px">
					</td>
				</tr>
				<!-- 리뷰 없음 -->
				
<!-- 
		<tr>
          <td class="py-5">등록된 리뷰가 없습니다.</td>
     	</tr>
       -->
			</table>
			<div class="container d-flex justify-content-between mt-3">
				<div></div>
				<nav aria-label="Page navigation example">
					<ul class="pagination text-black">
						<li class="page-item"><a class="page-link text-reset"
							href="#">&lt;</a></li>
						<li class="page-item"><a class="page-link text-reset"
							href="#">1</a></li>
						<li class="page-item"><a class="page-link text-reset"
							href="#">2</a></li>
						<li class="page-item"><a class="page-link text-reset"
							href="#">3</a></li>
						<li class="page-item"><a class="page-link text-reset"
							href="#">&gt;</a></li>
					</ul>
				</nav>
				<button type="button" class="btn btn-outline-light login me-2"
					data-bs-toggle="modal" data-bs-target="#review"
					style="height: 38px;">리뷰 작성하기</button>
					
				<!-- 리뷰 작성 모달---------------------------------------------------------------------------------------------------------->
				
				<div class="modal fade" id="review">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header d-flex flex-column logo">
								<div class="mt-2">
									<h4 class="modal-title fs-5">리뷰 작성</h4>
								</div>
							</div>
							<div class="modal-body">
								<form name="review_reg" method="post" action="review_reg.do">
									<div class="form-group">
										<input type="text" class="form-control" id="review_title" placeholder="제목" name="review_title">
										<input type="hidden" name="member_email" value="${Login.member_email}"> 
									</div>
									<div class="form-group mt-2 col">
										<textarea class="form-control h-25" rows="10" id="review_contents" placeholder="내용" name="review_contents"></textarea>
									</div>
										<div class="form-group mt-2 d-flex justify-content-between align-items-center">
										  <div class="starCntVt">
										    <div class="starRating-wrapVt">
										      <div id="starCenterVt">
										        <fieldset class="starRatingVt">
										          <input type="radio" id="star5" name="review_star" value="10" /><label for="star5" class="full" title="Awesome"></label>
										          <input type="radio" id="star4.5" name="review_star" value="9" /><label for="star4.5" class="half"></label>
										          <input type="radio" id="star4" name="review_star" value="8"/><label for="star4" class="full"></label>
										          <input type="radio" id="star3.5" name="review_star" value="7"/><label for="star3.5" class="half"></label>
										          <input type="radio" id="star3" name="review_star" value="6"/><label for="star3" class="full"></label>
										          <input type="radio" id="star2.5" name="review_star" value="5"/><label for="star2.5" class="half"></label>
										          <input type="radio" id="star2" name="review_star" value="4"/><label for="star2" class="full"></label>
										          <input type="radio" id="star1.5" name="review_star" value="3"/><label for="star1.5" class="half"></label>
										          <input type="radio" id="star1" name="review_star" value="2"/><label for="star1" class="full"></label>
										          <input type="radio" id="star0.5" name="review_star" value="1"/><label for="star0.5" class="half"></label>
										        </fieldset>
										      </div>
										    </div>
										  </div>
										</div>

									<div class="form-group mt-2">
										<div class="input-group mb-3">
											<input type="file" class="form-control" id="inputGroupFile02" name="review_img">
											<label class="input-group-text" for="inputGroupFile02">Upload</label>
										</div>
									</div>
									<div class="d-grid gap-1 mt-2">
										<input type="submit" class="btn btn-outline-light login btn-lg form-control" value="작성">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 문의----------------------------------------------------------- -->
		<div class="container mt-5">
			<ul class="nav justify-content-center nav-fill nav-tabs text-black">
				<li class="nav-item"><a class="nav-link text-reset"
					aria-current="page" href="#productNav1">상품상세</a></li>
				<li class="nav-item"><a class="nav-link text-reset"
					href="#productNav2">배송안내</a></li>
				<li class="nav-item"><a class="nav-link text-reset"
					href="#productNav3">고객리뷰(0)</a></li>
				<li class="nav-item"><a id="productNav4"
					class="nav-link active text-reset fw-bold" href="#productNav4">상품문의</a>
				</li>
			</ul>
		</div>
		<div class="container mt-5">
			<div class="d-flex align-items-end"
				style="border-bottom: 2px solid #000;">
				<h2>상품문의(${pqlCnt})</h2>
				<h6 class="ms-3">
					상품의 취소/반품/교환/환불 및 배송관련 문의는 <a href="#"><strong>1:1문의</strong></a>를
					이용해 주세요.
				</h6>
			</div>
			<table class="w-100 table table-hover recruit mt-3">
				<thead class="text-center">
					<th class="col-1 fw-bold">답변상태</th>
					<th class="col-8 fw-bold">제목</th>
					<th class="col-1 fw-bold">이름</th>
					<th class="col-1 fw-bold">작성일</th>
				</thead>
				<tbody>
					<c:if test="${not empty pqllist}">
						<c:forEach var="pql" items="${pqllist}">
						<tr class="text-center qa_item border-bottom" style="cursor: pointer;">
							<td style="text-align:center;">
								<c:if test="${pql.prod_q_yn eq '1'}">답변완료</c:if>
								<c:if test="${pql.prod_q_yn eq '2'}">미답변</c:if>
							</td>
							<td style="text-align: left;">${pql.prod_q_title}
								<c:if test="${pql.prod_q_secret eq '1'}">
								<i style="vertical-align: middle;" class="xi-lock-o"></i>
								</c:if>
							</td>
							<td style="text-align:center;">${pql.member_name}</td>
							<c:set var="pqlwdate" value="${pql.prod_q_wdate}" />
							<c:set var="pqlwdates" value="${fn:substring(pqlwdate,0,10)}" />
							<td style="text-align:center;">${pqlwdates}</td>
						</tr>
						<tr class="hide border-bottom">
							<td></td>
							<td colspan="4">${pql.prod_q_contents} <br>
								<hr> <i style="vertical-align: middle;" class="xi-subdirectory"></i><i style="vertical-align: middle;" class="xi-message"></i>
								${pql.prod_q_reply}
							</td>
						</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty pqllist}">
						<tr>
							<td></td>
							<td class="py-5">등록된 문의가 없습니다.</td>
						</tr>
					</c:if>
				</tbody>
			</table>
			<div class="container d-flex justify-content-between">
				<div></div>
				<nav aria-label="Page navigation example">
					<ul class="pagination text-black">
						<li class="page-item"><a class="page-link text-reset"
							href="#">&lt;</a></li>
						<li class="page-item"><a class="page-link text-reset"
							href="#">1</a></li>
						<li class="page-item"><a class="page-link text-reset"
							href="#">2</a></li>
						<li class="page-item"><a class="page-link text-reset"
							href="#">3</a></li>
						<li class="page-item"><a class="page-link text-reset"
							href="#">&gt;</a></li>
					</ul>
				</nav>
				<button type="button" class="btn btn-outline-light login me-2"
					data-bs-toggle="modal" data-bs-target="#qa" style="height: 38px;">문의
					작성하기</button>
				<!-----------------------------------문의작성하기 모달----------------------------------------------->
				<div class="modal fade" id="qa">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header d-flex flex-column logo">
								<div class="mt-2">
									<h4 class="modal-title fs-5">문의 하기</h4>
								</div>
							</div>
							<div class="modal-body">
								<form name="qa" method="post" action="detail.do">
									<input value="${pvo.prod_idx}" type="hidden" name="product_tb_idx" >
									<input value="${Login.member_idx}" type="hidden" name="member_tb_idx" >
									<div class="form-group">
										<input type="text" class="form-control"	placeholder="제목" name="prod_q_title">
									</div>
									<div class="form-group mt-2 col">
										<textarea class="form-control h-25" rows="10"
											placeholder="내용" name="prod_q_contents"></textarea>
									</div>
									<div class="d-grid gap-1 mt-2 d-flex align-items-center">
										<span class="input-group-text" id="basic-addon1">비밀글여부</span>
											<input name="prod_q_secret" type="radio" value="1">Y
											<input name="prod_q_secret" type="radio" value="2">N
									</div>
									<div class="d-grid gap-1 mt-2">
										<input type="submit"
											class="btn btn-outline-light login btn-lg form-control"
											value="작성">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<script>
	// 비로그인 상품구매 닫기
	function prodBtn(){
		alert('로그인이 필요합니다');
	}
	// 상품문의 답변
	$(function(){  
		var article = (".recruit .show");  
		$(".recruit .qa_item  td").click(function() {  
			var myArticle =$(this).parents().next("tr");  
	
			if($(myArticle).hasClass('hide')) {  
				$(article).removeClass('show').addClass('hide');  
				$(myArticle).removeClass('hide').addClass('show');  
			}else {
				$(myArticle).addClass('hide').removeClass('show');  
			}
		});
	});
</script>
<script>
//옵션창 
$(document).ready(function() {
    initializeOption(1);
});

function initializeOption(optVal) {
    $("#optSel" + optVal).show();
    $("#ct_qty" + optVal).val(0);
    change_qty(optVal, "p");
}

$("#optIdx1").val($("#opttIdx1").val());
$("#optQty1").val($("#ct_qty1").val());

$("#optSel").change(function() {
    var optVal = $("#optSel option:selected").val();
    
    if (optVal == "1") {
        $("#optSel1").show();
        $("#ct_qty1").val(1);
        change_qty(1, "p");
        $("#optIdx1").val($("#opttIdx1").val());
		$("#optQty1").val($("#ct_qty1").val());
    } else if (optVal == "2") {
        $("#optSel2").show();
        $("#ct_qty2").val(0);
        change_qty(2, "p");
        $("#optIdx2").val($("#opttIdx2").val());
		$("#optQty2").val($("#ct_qty2").val());
    } else if (optVal == "3") {
        $("#optSel3").show();
        $("#ct_qty3").val(0);
        change_qty(3, "p");
        $("#optIdx3").val($("#opttIdx3").val());
		$("#optQty3").val($("#ct_qty3").val());
    } else if (optVal == "4") {
        $("#optSel4").show();
        $("#ct_qty4").val(0);
        change_qty(4, "p");
        $("#optIdx4").val($("#opttIdx4").val());
		$("#optQty4").val($("#ct_qty4").val());
    } else if (optVal == "5") {
        $("#optSel5").show();
        $("#ct_qty5").val(0);
        change_qty(5, "p");
        $("#optIdx5").val($("#opttIdx5").val());
		$("#optQty5").val($("#ct_qty5").val());
    }
});

$("#optClo1").on("click",function(){
	$("#optSel1").hide();
	$("#optIdx1").val("0");
	$("#optQty1").val("0");
});
$("#optClo2").on("click",function(){
	$("#optSel2").hide();
	$("#optIdx2").val("0");
	$("#optQty2").val("0");
});
$("#optClo3").on("click",function(){
	$("#optSel3").hide();
	$("#optIdx3").val("0");
	$("#optQty3").val("0");
});
$("#optClo4").on("click",function(){
	$("#optSel4").hide();
	$("#optIdx4").val("0");
	$("#optQty4").val("0");
});
$("#optClo5").on("click",function(){
	$("#optSel5").hide();
	$("#optIdx5").val("0");
	$("#optQty5").val("0");
});

function updateTotalAmount() {
    var total_amount = 0;
    var opt_count = $("input[id^='optPrice']").length;

    for (var i = 1; i <= opt_count; i++) {
        var opt_price = parseInt($("#optPrice" + i).val());
        var qty = parseInt($("#ct_qty" + i).val());
        var isVisible = $("#optSel" + i).is(":visible");
        
        if (isVisible) {
            total_amount += opt_price * qty;
        }
    }

    $("#total_amount").text(total_amount.toLocaleString());
}

function closeOption(optionIndex) {
    $("#optSel" + optionIndex).hide();
    $("#ct_qty" + optionIndex).val(0);
    updateTotalAmount();
}

$("#optClo1").on("click", function() {
    closeOption(1);
});
$("#optClo2").on("click", function() {
    closeOption(2);
});
$("#optClo3").on("click", function() {
    closeOption(3);
});
$("#optClo4").on("click", function() {
    closeOption(4);
});
$("#optClo5").on("click", function() {
    closeOption(5);
});

function change_qty(optionIndex, t) {
    var min_qty = 1;
    var max_qty = 2;
    var ct_qty = $("#ct_qty" + optionIndex);
    var opt_qty = $("#optQty" + optionIndex);
    var this_qty = ct_qty.val() * 1;

    if (t == "m") {
        this_qty -= 1;
        opt_qty.val(this_qty);
        if (this_qty < min_qty) {
            alert("수량은 1개 이상 입력해 주십시오.");
            return;
        }
    } else if (t == "p") {
        this_qty += 1;
        opt_qty.val(this_qty);
        if (this_qty > max_qty) {
            alert("최대 구매가능 수량을 초과하였습니다");
            return;
        }
    }

    ct_qty.val(this_qty);
    updateTotalAmount();
}

$("#numSum1").change(function(){
	$.ajax({
		url : '<%=request.getContextPath()%>/prod/numSum.do',
		type : post,
		data : {},
		success : function(data){
			$("#total_amount").html(data);
		}
		
	});
});


</script>
<%@ include file="../include/foot.jsp" %>