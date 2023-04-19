<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ include file="../include/head.jsp" %>
<main>
	<!-- 상품 정보 -------------------------------------------->
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
										<option selected>선택</option>
										<c:forEach var="opt" items="${optlist}" varStatus="status">
										<option value="${status.count}">${opt.opt_name}</option>
										</c:forEach>
									</select>
									<div class="choice_product mt-3" style="margin: auto 0;">
										<c:forEach var="optt" items="${optlist}" varStatus="status">
										<input type="hidden" id="optPrice${status.count}" value="${optt.opt_price}">
										<div class="border-top border-bottom mx-2" id="optSel${status.count}"
											style="display: none;">
											<div class="d-flex justify-content-between">
												<div class="mt-3">
													<p>${pvo.prod_name} : ${optt.opt_name}</p>
												</div>
												<div class="btn-group btn-group-sm my-3" role="group">
													<button type="button" class="btn btn-secondary"
														style="width: 2vw;" onclick="change_qty${status.count}('m')">-</button>
													<input type="text" name="ct_qty1" id="ct_qty${status.count}" value="1"
														readonly="readonly" class="text-center"
														style="width: 3vw;">
													<button type="button" class="btn btn-secondary"
														style="width: 2vw;" onclick="change_qty${status.count}('p')">+</button>
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
						<form name="" action="" method="">
							<div
								class="d-grid gap-2 d-md-flex justify-content-between align-items-baseline">
								<button class="btn btn-secondary"
									style="width: 280px; height: 60px;">장바구니 담기</button>
								<button class="btn btn-outline-light login"
									style="width: 280px; height: 60px;">바로 구매하기</button>
							</div>
						</form>
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
				<!-- <tr>
          <td class="py-5">등록된 리뷰가 없습니다.</td>
        </tr> -->
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
								<form name="review" method="post" action="loginAction.jsp">
									<div class="form-group">
										<input type="text" class="form-control" id="review_title"
											placeholder="제목" name="review_title">
									</div>
									<div class="form-group mt-2 col">
										<textarea class="form-control h-25" rows="10"
											id="review_contents" placeholder="내용" name="review_contents"></textarea>
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
											<input type="file" class="form-control" id="inputGroupFile02">
											<label class="input-group-text" for="inputGroupFile02">Upload</label>
										</div>
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
										<span>비밀글여부</span>
										<div>
											<input class="form-check-input" type="checkbox"
												id="prod_q_secret" name="prod_q_secret" value="" aria-label="...">
										</div>
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
	if($("#prod_q_secret").prop("checked")){
		$("#prod_q_secret").val(1);
	}else{
		$("#prod_q_secret").val(2);
	}

	let star = document.querySelectorAll('input');
	for (let i = 0; i < star.length; i++) {
		star[i].addEventListener('click', function() {
			i = this.value;
		});
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
$("#optSel").change(function() {
	var optVal = $("#optSel option:selected").val();
	if (optVal == "1") {
		$("#optSel1").show();
	}else if(optVal == "2"){
		$("#optSel2").show();
	}else if(optVal == "3"){
		$("#optSel3").show();
	}else if(optVal == "4"){
		$("#optSel4").show();
	}else if(optVal == "5"){
		$("#optSel5").show();
	}
});
$("#optClo1").on("click",function(){
	$("#optSel1").hide();
});
$("#optClo2").on("click",function(){
	$("#optSel2").hide();
});
$("#optClo3").on("click",function(){
	$("#optSel3").hide();
});
$("#optClo4").on("click",function(){
	$("#optSel4").hide();
});
$("#optClo5").on("click",function(){
	$("#optSel5").hide();
});
  //제품수량
  function fnCalCount(type, ths){
    var $input =  $(ths).parent("td").find("input[name='pop_out']");
    var tCount = Number($input.val());
    var tEqCount = Number($(ths).parents("tr").find("td.bseq_ea").html());
    if(type=='p'){
      if(tCount < tEqCount) $input.val(Number(tCount)+1);
    }else{
      if(tCount >0) $input.val(Number(tCount)-1);
    }
  }
//수량 버튼 스크립트
Number.prototype.format = function(){
	if(this==0) return 0;
	var reg = /(^[+-]?\d+)(\d{3})/;
	var n = (this + '');
	while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
	return n;
};

String.prototype.format = function(){
	var num = parseFloat(this);
	if( isNaN(num) ) return "0";
	return num.format();
};
//1번 옵션
var basic_amount1 = $("#optPrice1").val();
function change_qty1(t){
	//var min_qty = '수량버튼'*1;
	var min_qty1 = 1;
	var this_qty1 = $("#ct_qty1").val()*1;
	var max_qty1 = 2; // 최대 구매 수량
	if(t=="m"){
		this_qty1 -= 1;
		if(this_qty1<min_qty1){
		alert("수량은 1개 이상 입력해 주십시오.");
		return;
		}
	}else if(t=="p"){
		this_qty1 += 1;
		if(this_qty1>max_qty1){
			alert("최대 구매가능 수량을 초과하였습니다");
			return;
		}
	}
var show_total_amount = basic_amount1 * this_qty1;
//$("#ct_qty_txt").text(this_qty); 
$("#ct_qty1").val(this_qty1);
$("#it_pay").val(show_total_amount);
$("#total_amount").html(show_total_amount.format());
}
//2번 옵션
var basic_amount2 = $("#optPrice2").val();
function change_qty2(t){
	//var min_qty = '수량버튼'*1;
	var min_qty2 = 1;
	var this_qty2 = $("#ct_qty2").val()*1;
	var max_qty2 = 2; // 최대 구매 수량
	if(t=="m"){
		this_qty2 -= 1;
		if(this_qty2<min_qty2){
		alert("수량은 1개 이상 입력해 주십시오.");
		return;
		}
	}else if(t=="p"){
		this_qty2 += 1;
		if(this_qty2>max_qty2){
			alert("최대 구매가능 수량을 초과하였습니다");
			return;
		}
	}
var show_total_amount = basic_amount2 * this_qty2;
$("#ct_qty2").val(this_qty2);
$("#it_pay").val(show_total_amount);
$("#total_amount").html(show_total_amount.format());
}
//3번 옵션
var basic_amount3 = $("#optPrice3").val();
function change_qty3(t){
	//var min_qty = '수량버튼'*1;
	var min_qty3 = 1;
	var this_qty3 = $("#ct_qty3").val()*1;
	var max_qty3 = 2; // 최대 구매 수량
	if(t=="m"){
		this_qty3 -= 1;
		if(this_qty3<min_qty3){
		alert("수량은 1개 이상 입력해 주십시오.");
		return;
		}
	}else if(t=="p"){
		this_qty3 += 1;
		if(this_qty3>max_qty3){
			alert("최대 구매가능 수량을 초과하였습니다");
			return;
		}
	}
var show_total_amount = basic_amount3 * this_qty3;
$("#ct_qty3").val(this_qty3);
$("#it_pay").val(show_total_amount);
$("#total_amount").html(show_total_amount.format());
}
//4번 옵션
var basic_amount4 = $("#optPrice4").val();
function change_qty4(t){
	//var min_qty = '수량버튼'*1;
	var min_qty4 = 1;
	var this_qty4 = $("#ct_qty4").val()*1;
	var max_qty4 = 2; // 최대 구매 수량
	if(t=="m"){
		this_qty4 -= 1;
		if(this_qty4<min_qty4){
		alert("수량은 1개 이상 입력해 주십시오.");
		return;
		}
	}else if(t=="p"){
		this_qty4 += 1;
		if(this_qty4>max_qty4){
			alert("최대 구매가능 수량을 초과하였습니다");
			return;
		}
	}
var show_total_amount = basic_amount4 * this_qty4;
$("#ct_qty4").val(this_qty4);
$("#it_pay").val(show_total_amount);
$("#total_amount").html(show_total_amount.format());
}
//5번 옵션
var basic_amount5 = $("#optPrice5").val();
function change_qty5(t){
	//var min_qty = '수량버튼'*1;
	var min_qty5 = 1;
	var this_qty5 = $("#ct_qty5").val()*1;
	var max_qty5 = 2; // 최대 구매 수량
	if(t=="m"){
		this_qty5 -= 1;
		if(this_qty5<min_qty5){
		alert("수량은 1개 이상 입력해 주십시오.");
		return;
		}
	}else if(t=="p"){
		this_qty5 += 1;
		if(this_qty5>max_qty5){
			alert("최대 구매가능 수량을 초과하였습니다");
			return;
		}
	}
var show_total_amount = basic_amount5 * this_qty5;
$("#ct_qty5").val(this_qty5);
$("#it_pay").val(show_total_amount);
$("#total_amount").html(show_total_amount.format());
}
</script>
<%@ include file="../include/foot.jsp" %>