<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/head.jsp" %>
<main>		
	<div class="inner">
		<c:set var="plusBtn" value="p"/>
		<c:set var="minusBtn" value="m"/>
		<section class="container mb-4" id="cart_page" >
			<h3 class="text-center fw-bold mt-5 mb-5">장바구니</h3><br>
			<div class="pt-5 pb-5">
				<form name="frm" method="get" action="orderForm.do">
					<table class="table border-top">
						<thead>
							<tr>
								<th width="3%" id="Check"><input type="checkbox" id="check-all"></th>
								<th width="10%" class="text-center">상품이미지</th>
								<th width="50%" class="text-center">상품정보</th>
								<th class="text-center">수량</th>
								<th class="text-center">판매가</th>
								<th class="text-center">소계</th>
								<th class="text-center">적립금</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${cartList}" varStatus="status">
							<tr>
								<td id="Check">
									<fmt:formatNumber var="PricesCal" value="${vo.cart_amount * vo.opt_price}" pattern="#,###"/>
									<fmt:formatNumber var="optPrice" value="${vo.opt_price}" pattern="#,###"/>
									<fmt:parseNumber var="pointCal" value="${(vo.cart_amount * vo.opt_price)/10}" integerOnly="true" />
									<fmt:formatNumber var="pointCom" value="${pointCal}" pattern="#,###"/>
									<input type="hidden" id="optIdx" value="${vo.opt_idx}">
									<input type="hidden" id="optQty" value="${vo.cart_amount}">
									<input id="checkBoxes" type="checkbox" class="item">
									<input type="hidden" id="cartIdx" value="${vo.cart_idx}">
									<input type="hidden" id="pricePlus" value="${vo.cart_amount * vo.opt_price}">
								</td>
								<td class="text-center align-middle"><a href="#">
		                        <img src="<c:url value='/images/prod/thumb/${vo.prod_imgt}'/>" alt="...">
								</a></td>
								<td class="align-middle">
									<ul class="list-unstyled mb-0 ps-2 pe-2">
										<li><a href="#">${vo.prod_name}</a></li>
										<li style="color: #b9b9b9;">${vo.opt_name}</li>
										<li><button type="button" onclick="cartView(${vo.cart_idx},${Login.member_idx},${vo.prod_idx})" class="btn btn-sm btn-secondary mt-2">옵션 수정</button></li>
									</ul>
								</td>
								<td class="text-center align-middle">${vo.cart_amount}개</td>
								<td class="text-center align-middle">${optPrice}원</td>
								<td class="text-center align-middle">${PricesCal}원</td>
								<td class="text-center align-middle">${pointCom}원</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<button type="button" onclick="cartDelBtn()" class="btn btn-outline-secondary btn-sm mb-5">선택삭제</button>
					<table class="table table-sm text-center align-middle border-top" id="order_wnans">
						<thead>
							<tr>
								<th class="align-middle">총 상품 가격</th>
								<th class="align-middle">배송비</th>
								<th class="align-middle">총 결제금액</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="align-middle text-center">
									<span class="fs-3 me-1 ms-2 fw-bold" id="total_amount">0</span>원
								</td>
								<td class="align-middle text-center">
									<span class="fs-3 me-1 ms-2 fw-bold" id="del_amount">3,000</span>원
									<p class="">30,000원 이상 구매시 배송비 무료</p>
								</td> <!-- 고정 -->
								<td class="align-middle text-center" style="color: #dd1111;">
									<span class="fs-3 me-1 ms-2 fw-bold" id="total_amountCal"
									style="color: #ee4a44;">0</span>원
								</td>
							</tr>
						</tbody>
					</table>
					<input type="hidden" name="opt_idx">
					<input type="hidden" name="opt_qty">
					<input type="hidden" name="cart_idx">
					<button type="submit" class="btn btn-outline-light login mt-5 d-grid gap-2 col-6 mx-auto"><b>주문하기</b></button>
				</form>
			</div>
			<!-- Modal -->
			<div class="container-fluid modal-body" id="modalCnt"></div>
		</section>
	</div>
</main>


<script>	
// 상품 선택삭제 인덱스 꺼내옴
function cartDelBtn(){
	var cartCheck = [];
	$('input[id=checkBoxes]:checked').each(function(){
		var checking = $(this).next().val();
		cartCheck.push(checking);
	});
	console.log(cartCheck);
	
	$.ajax({
		url : '<%=request.getContextPath()%>/mypage/cartDel.do',
		type : 'post',
		data : { cart_idx : cartCheck},
		traditional: true,
		success : function(){
			alert('삭제 완료');
			document.location.reload();
		}
	});
}
</script>
<script>
// 수정모달
function cartView(cart_idx, member_idx, prod_idx ){
	var cart_idx = cart_idx;
	$.ajax({
		url : '<%=request.getContextPath()%>/mypage/cartView.do',
		data : { cart_idx : cart_idx,
			member_idx : member_idx,},
		type : 'post',
		success : function(data){
			htmlStr = "";
			htmlStr +=	'<div class="modal" id="optModal" tabindex="-1" aria-hidden="true">';
			htmlStr +=	'<div class="modal-dialog modal-sm modal-dialog-centered">';
			htmlStr +=	'<div class="modal-content">';
			htmlStr +=	'<div class="modal-header">';
			htmlStr +=	'<h1 class="modal-title fs-5">옵션 수정</h1>';
			htmlStr +=	'<button onclick="cartViewClose()" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>';
			htmlStr +=	'</div>';
			htmlStr +=	'<div class="modal-body">';
			htmlStr +=	'<div class="border-bottom pb-2">';	
			htmlStr +=	'<div>';
			htmlStr +=	'<p class="mb-2 fs-6">옵션</p>';
			htmlStr +=	'</div>';
			htmlStr +=	'<div>';
			htmlStr +=	'<input name="cartIddx" type="hidden" value="'+cart_idx+'">';
			htmlStr +=	'<div id="htmlCnt">';
				$.ajax({
					url : '<%=request.getContextPath()%>/mypage/cartView2.do',
					data : { prod_idx : prod_idx},
					type : 'post',
					success : function(data){
						htmlStrs = "";
						htmlStrs +=	'<select name="cartOptMod" class="form-select">';
						$(data).each(function(){
							htmlStrs +=	'<option value="'+ this.opt_idx +'">'+this.opt_name+'</option>';
						});
						
						$("#htmlCnt").html(htmlStrs);
					}
				});
			htmlStr +=	'</select>';
			htmlStr +=  '</div>';
			htmlStr +=	'</div>';
			htmlStr +=	'</div>';
			htmlStr +=	'<div class="border-bottom pb-2 mt-3">';
			htmlStr +=	'<div>';
			htmlStr +=	'<div>';
			htmlStr +=	'<p class="mb-2 fs-6">옵션 수량</p>';
			htmlStr +=	'</div>';
			htmlStr +=	'<div class="btn-group btn-group-sm" role="group" >';
			htmlStr +=	'<button onclick="change_qty(';
			htmlStr +=	"'m'";
			htmlStr +=	')" type="button" class="btn btn-secondary" style="width: 2vw;">-</button>';
			htmlStr +=	'<input type="text" name="ct_qty" id="ct_qty" value="1" readonly="readonly" class="text-center" style="width: 3vw;">';
			htmlStr +=	'<button onclick="change_qty(';
			htmlStr +=  "'p'";
			htmlStr +=	')" type="button" class="btn btn-secondary" style="width: 2vw;">+</button>';
			htmlStr +=	'</div>';
			htmlStr +=	'</div>';
			htmlStr +=	'</div>';
			htmlStr +=	'<div class="modal-footer">';
			htmlStr +=	'<button type="button" onclick="cartViewClose()" class="btn btn-outline-secondary" data-bs-dismiss="modal">닫기</button>';
			htmlStr +=	'<button type="button" onclick="cartModify()" class="btn btn-outline-light login">수정하기</button>';
			htmlStr +=	'</div>';
			htmlStr +=	'</div>';
			htmlStr +=	'</div>';
			htmlStr +=	'</div>';
			
			$("#modalCnt").html(htmlStr);
			$("#optModal").show();
		}
	});
}
</script>
<script>
// 주문수정
function cartModify(){
	
	var cart_idx = $('input[name=cartIddx]').val();
	var opt_tb_idx = $('select[name=cartOptMod]').val();
	var cart_amount= $('input[id=ct_qty]').val();
	
	console.log("장바구니 번호"+cart_idx);
	console.log("모달 옵션 번호"+opt_tb_idx);
	console.log("모달 옵션 수량"+cart_amount);

	$.ajax({
		url : '<%=request.getContextPath()%>/mypage/cartModify.do',
		data : { cart_idx : cart_idx,
				opt_tb_idx : opt_tb_idx,
				cart_amount : cart_amount
		},
		type : 'post',
		success : function(){
			alert("옵션이 수정 되었습니다.");
			location.href='<%=request.getContextPath()%>/mypage/cart.do';
		}
	});
};
</script>
<script>
// 수량바꾸기
function change_qty(t) {
    var min_qty = 1;
    var max_qty = 2;
    var ct_qty = $("#ct_qty");
    var this_qty = ct_qty.val() * 1;

    if (t == "m") {
        this_qty -= 1;
        if (this_qty < min_qty) {
            alert("수량은 1개 이상 입력해 주십시오.");
            return;
        }
    } else if (t == "p") {
        this_qty += 1;
        if (this_qty > max_qty) {
            alert("최대 구매가능 수량을 초과하였습니다");
            return;
        }
    }
    ct_qty.val(this_qty);
};
// 모달닫기
function cartViewClose(){
	$("#modalCnt").empty();
}
// 모달밖선택
$('html').click(function(e){
	if($(e.target).parents('#optModal').length < 1){
    	$("#modalCnt").empty();
    }
})
</script>
<script>

// 금액 계산
	$("input[id=check-all]").change(function() {
		if($("input[id=check-all]").is(":checked")) {
			$("input[id=checkBoxes]").prop("checked", true);
		}else{
			$("input[id=checkBoxes]").prop("checked", false);
		}

		var priceCal = 0;
		var priceDel = 0;
		priceCal = parseInt(priceCal);
		$('input[id=checkBoxes]:checked').each(function(){
			var plusCal = $(this).next().next().val();
			plusCal = parseInt(plusCal);
			priceCal = priceCal+plusCal;
		});
			console.log("배송비"+priceCal)
		if( priceCal == 0 ){
			priceDel = 3000;
			$("#del_amount").html(priceDel.toLocaleString());
			$("#total_amount").html(priceCal.toLocaleString());
			$("#total_amountCal").html(0);
		}else if( priceCal < 30000 ){
			priceDel = 3000;
			priceCalDel = priceCal + 3000;
			$("#del_amount").html(priceDel.toLocaleString());
			$("#total_amount").html(priceCal.toLocaleString());
			$("#total_amountCal").html(priceCalDel.toLocaleString());
		}else{
			$("#del_amount").html(priceDel.toLocaleString());
			$("#total_amount").html(priceCal.toLocaleString());
			$("#total_amountCal").html(priceCal.toLocaleString());
		}
			var opt_idx = [];
			var opt_qty = [];
			var cart_idx = [];
			$('input[id=checkBoxes]:checked').each(function(){
				var opt_idxs = $(this).prev().prev().val();
				var opt_qtys = $(this).prev().val();
				var cart_idxs = $(this).next().val();
				opt_idx.push(opt_idxs);
				opt_qty.push(opt_qtys);
				cart_idx.push(cart_idxs);
			});
			$('input[name=opt_idx]').val(opt_idx);
			$('input[name=opt_qty]').val(opt_qty);
			$('input[name=cart_idx]').val(cart_idx);
	});
</script>
<script>
$('input[id=checkBoxes]').change(function(){
		var total = $("input[id=checkBoxes]").length;
		var checkedd = $("input[id=checkBoxes]:checked").length;
		if(total != checkedd){
			$("input[id=check-all]").prop("checked", false);
		}else if( total == checkedd){
			$("input[id=check-all]").prop("checked", true); 
		}
	var priceCal = 0;
	var priceDel = 0;
	priceCal = parseInt(priceCal);
	$('input[id=checkBoxes]:checked').each(function(){
		var plusCal = $(this).next().next().val();
		plusCal = parseInt(plusCal);
		priceCal = priceCal+plusCal;
	});
		console.log("배송비"+priceCal)
		if( priceCal == 0 ){
			priceDel = 3000;
			$("#del_amount").html(priceDel.toLocaleString());
			$("#total_amount").html(priceCal.toLocaleString());
			$("#total_amountCal").html(0);
		}else if( priceCal < 30000 ){
			priceDel = 3000;
			priceCalDel = priceCal + 3000;
			$("#del_amount").html(priceDel.toLocaleString());
			$("#total_amount").html(priceCal.toLocaleString());
			$("#total_amountCal").html(priceCalDel.toLocaleString());
		}else{
			$("#del_amount").html(priceDel.toLocaleString());
			$("#total_amount").html(priceCal.toLocaleString());
			$("#total_amountCal").html(priceCal.toLocaleString());
		}
		var opt_idx = [];
		var opt_qty = [];
		var cart_idx = [];
		$('input[id=checkBoxes]:checked').each(function(){
			var opt_idxs = $(this).prev().prev().val();
			var opt_qtys = $(this).prev().val();
			var cart_idxs = $(this).next().val();
			opt_idx.push(opt_idxs);
			opt_qty.push(opt_qtys);
			cart_idx.push(cart_idxs);
		});
		$('input[name=opt_idx]').val(opt_idx);
		$('input[name=opt_qty]').val(opt_qty);
		$('input[name=cart_idx]').val(cart_idx);
	});


</script>


<%@ include file="../include/foot.jsp" %>