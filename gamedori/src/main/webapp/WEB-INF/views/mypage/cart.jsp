<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/head.jsp" %>
<main>		
	<div class="inner">
		<section class="container mb-4" id="cart_page" >
			<h3 class="text-center fw-bold mt-5 mb-5">장바구니</h3><br>
			<div class="pt-5 pb-5">
				<form>
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
									<input id="checkBoxes" type="checkbox" class="item">
									<input type="hidden" id="cartIdx" value="${vo.cart_idx}">
								</td>
								<td class="text-center align-middle"><a href="#"><img src=></a></td>
								<td class="align-middle">
									<ul class="list-unstyled mb-0 ps-2 pe-2">
										<li><a href="#">${vo.prod_name}</a></li>
										<li style="color: #b9b9b9;">${vo.opt_name}</li>
										<li><button type="button" onclick="cartView(${vo.cart_idx})" class="btn btn-sm btn-secondary mt-2" data-bs-toggle="modal" data-bs-target="#option${status.count}">옵션 수정</button></li>
									</ul>
								</td>
								<fmt:formatNumber var="PricesCal" value="${vo.cart_amount * vo.opt_price}" pattern="#,###"/>
								<fmt:formatNumber var="optPrice" value="${vo.opt_price}" pattern="#,###"/>
								<fmt:parseNumber var="pointCal" value="${(vo.cart_amount * vo.opt_price)/10}" integerOnly="true" />
								<fmt:formatNumber var="pointCom" value="${pointCal}" pattern="#,###"/>
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
								<td class="align-middle text-center">178,000원</td>
								<td class="align-middle text-center">3,000원</td> <!-- 고정 -->
								<td class="align-middle text-center" style="color: #dd1111;">181,000원</td>
							</tr>
						</tbody>
					</table>
					<button type="button" onclick="cartOrder()" class="btn btn-outline-light login mt-5 d-grid gap-2 col-6 mx-auto"><b>주문하기</b></button>
				</form>
			</div>
			<!-- Modal -->
			<c:forEach var="vo" items="${cartList}" varStatus="status">
			<div class="modal fade" id="option${status.count}" tabindex="-1">
				<div class="modal-dialog modal-sm modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5">옵션 수정</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">				
							<div class="border-bottom pb-2">	
								<div>
									<p class="mb-2 fs-6">옵션</p>
								</div>
								<div>
									<input name="cartIddx${status.count}" type="hidden" value="${vo.cart_idx}">
									<select name="cartOptMod${status.count}" class="form-select">
										<option>선택해주세요</option>
										<c:forEach var="opts" items="${vo.optlist}" varStatus="status">
											<option value="${opts.opt_idx}">${opts.opt_name}</option><!--옵션리스트를 선택할 수 있어야 합니다.-->
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="border-bottom pb-2 mt-3">
								<div>
									<p class="mb-2 fs-6">옵션 수량</p>
								</div>
								<div class="btn-group btn-group-sm" role="group" >
									<button type="button" class="btn btn-secondary" style="width: 2vw;" onclick="change_qty2(${status.count}, 'm')">-</button>
									<input type="text" name="ct_qty" id="ct_qty${status.count}" value="1" readonly="readonly" class="text-center" style="width: 3vw;">
									<button type="button" class="btn btn-secondary" style="width: 2vw;" onclick="change_qty2(${status.count}, 'p')">+</button>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">닫기</button>
							<button type="button" onclick="cartModify()" class="btn btn-outline-light login">수정하기</button>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
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

function cartView(cart_idx){
	var cart_idx = cart_idx; 
	
	$.ajax({
		url : '<%=request.getContextPath()%>/mypage/cartView',
		data : { cart_idx : cart_idx },
		type : 'post',
		success : function(data){
			htmlStr = "";
			htmlStr +=	<div class="modal fade" id="option${status.count}" tabindex="-1">
			htmlStr +=	<div class="modal-dialog modal-sm modal-dialog-centered">
			htmlStr +=		<div class="modal-content">
			htmlStr +=			<div class="modal-header">
			htmlStr +=				<h1 class="modal-title fs-5">옵션 수정</h1>
			htmlStr +=				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			htmlStr +=			</div>
			htmlStr +=			<div class="modal-body">				
			htmlStr +=				<div class="border-bottom pb-2">	
			htmlStr +=					<div>
			htmlStr +=						<p class="mb-2 fs-6">옵션</p>
			htmlStr +=					</div>
			htmlStr +=					<div>
			htmlStr +=						<input name="cartIddx${status.count}" type="hidden" value="${vo.cart_idx}">
			htmlStr +=					<select name="cartOptMod${status.count}" class="form-select">
			htmlStr +=						<option>선택해주세요</option>
			htmlStr +=						<c:forEach var="opts" items="${vo.optlist}" varStatus="status">
			htmlStr +=							<option value="${opts.opt_idx}">${opts.opt_name}</option><!--옵션리스트를 선택할 수 있어야 합니다.-->
			htmlStr +=						</c:forEach>
			htmlStr +=					</select>
			htmlStr +=				</div>
			htmlStr +=			</div>
			htmlStr +=			<div class="border-bottom pb-2 mt-3">
			htmlStr +=				<div>
			htmlStr +=					<p class="mb-2 fs-6">옵션 수량</p>
			htmlStr +=				</div>
			htmlStr +=				<div class="btn-group btn-group-sm" role="group" >
			htmlStr +=					<button type="button" class="btn btn-secondary" style="width: 2vw;" onclick="change_qty2(${status.count}, 'm')">-</button>
			htmlStr +=					<input type="text" name="ct_qty" id="ct_qty${status.count}" value="1" readonly="readonly" class="text-center" style="width: 3vw;">
			htmlStr +=					<button type="button" class="btn btn-secondary" style="width: 2vw;" onclick="change_qty2(${status.count}, 'p')">+</button>
			htmlStr +=				</div>
			htmlStr +=			</div>
			htmlStr +=		</div>
			htmlStr +=		<div class="modal-footer">
			htmlStr +=			<button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">닫기</button>
			htmlStr +=	'<button type="button" onclick="cartModify()" class="btn btn-outline-light login">수정하기'</button>';
			htmlStr +=	'</div>';
			htmlStr +=	'</div>';
			htmlStr +=	'</div>';
			htmlStr +=	'</div>';
		}
	});
}

function cartModify(){
	
	var cart_idx = $('select[name=cartOptMod]').prev().val();
	var opt_tb_idx = $('select[name=cartOptMod]').val();
	var cart_amount= $('input[id=ct_qty]').val();
	
	console.log("장바구니 번호"+cart_idx);
	console.log("모달 옵션 번호"+opt_tb_idx);
	console.log("모달 옵션 수량"+cart_amount);

	$.ajax({
		url : '<%=request.getContextPath()%>/mypage/cartModify.do',
		data : {},
		type : 'post',
		success : function(){
			
		}
	});
}
</script>


<%@ include file="../include/foot.jsp" %>