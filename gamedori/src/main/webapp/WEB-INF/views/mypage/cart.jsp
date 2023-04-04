<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
							<tr>
								<td id="Check"><input type="checkbox" class="item"></td>
								<td class="text-center align-middle"><a href="#"><img src="<c:url value='/images/ps4 피파23_180x180.jpg' />"></a></td>
								<td class="align-middle">
									<ul class="list-unstyled mb-0 ps-2 pe-2">
										<li><a href="#">PS4 피파23</a></li>
										<li style="color: #b9b9b9;">옵션 내용</li>
										<li><button type="button" class="btn btn-sm btn-secondary mt-2" data-bs-toggle="modal" data-bs-target="#option">선택사항수정</button></li>
									</ul>
								</td>
								<td class="text-center align-middle">1</td>
								<td class="text-center align-middle">69,800</td>
								<td class="text-center align-middle">69,800</td>
								<td class="text-center align-middle">690</td>
							</tr>

							<tr>
								<td id="Check"><input type="checkbox" class="item"></td>
								<td class="text-center align-middle"><a href="#"><img src="<c:url value='/images/ps4 피파23_180x180.jpg' />"></a></td>
								<td class="align-middle">
									<ul class="list-unstyled mb-0 ps-2 pe-2">
										<li><a href="#">[상품이름]</a></li>
										<li style="color: #b9b9b9;">옵션 내용</li>
										<li><button type="button" class="btn btn-sm btn-secondary mt-2" data-bs-toggle="modal" data-bs-target="#option">선택사항수정</button></li>
									</ul>
								</td>
								<td class="text-center align-middle">[0]</td>
								<td class="text-center align-middle">[10,000]</td>
								<td class="text-center align-middle">[10,000]</td>
								<td class="text-center align-middle">[100]</td>
							</tr>
						</tbody>
					</table>
					<button type="button" class="btn btn-outline-secondary btn-sm mb-5">선택삭제</button>

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
								<td class="align-middle">178,000원</td>
								<td class="align-middle">3,000원</td>
								<td class="align-middle" style="color: #dd1111;">181,000원</td>
							</tr>
						</tbody>
					</table>

					<button type="submit" class="btn btn-outline-light login mt-5 d-grid gap-2 col-6 mx-auto"><b>주문하기</b></button>
				</form>
			</div>
					
			<!-- Modal -->
			<div class="modal fade" id="option" tabindex="-1">
				<div class="modal-dialog modal-sm modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5">주문수정</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">				

							<div class="border-bottom pb-2">	
								<div>
									<p class="mb-2 fs-6">옵션</p>
								</div>
								<div>
									<select class="form-select">
										<option selected>선택하세요</option>
										<option value="1">옵션 내용</option><!--옵션리스트를 선택할 수 있어야 합니다.-->
									</select>
								</div>
							</div>
							
							<div class="border-bottom pb-2 mt-3">
								<div>
									<p class="mb-2 fs-6">옵션 내용</p>
								</div>
								<div class="btn-group btn-group-sm" role="group" >
									<button type="button" class="btn btn-secondary" style="width: 2vw;" onclick="change_qty2('m')">-</button>
									<input type="text" name="ct_qty" id="ct_qty" value="1" readonly="readonly" class="text-center" style="width: 3vw;">
									<button type="button" class="btn btn-secondary" style="width: 2vw;" onclick="change_qty2('p')">+</button>
								</div>
							</div>

							<div class="row mt-3">
								<p class="col-6 fs-5"><strong>상품금액</strong></p>
								<p class="col-6 mb-0 fs-5 text-end" id="total_amount" style="color:#dd1111">[74,000]원</p> <!--db에 저장된 상품 가격이 나와야합니다.-->
							</div>
							
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">닫기</button>
							<button class="btn btn-outline-light login">적용</button>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</main>


<script>	
//수량인풋
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
		
	var basic_amount = parseInt('74000');

	function change_qty2(t){
	//var min_qty = '수량버튼'*1;
	var min_qty = 1;
	var this_qty = $("#ct_qty").val()*1;
	var max_qty = '2'; // 최대구매수량
	if(t=="m"){
		this_qty -= 1;
		if(this_qty<min_qty){
		//alert("최소구매수량 이상만 구매할 수 있습니다.");
		alert("수량은 1개 이상 입력해 주십시오.");
		return;
		}
		}
		else if(t=="p"){
		this_qty += 1;
		if(this_qty>max_qty){
			//alert("죄송합니다. 재고가 부족합니다.");
			alert("최대 구매수량은 2개 입니다.");
			return;
			}
		}

	var show_total_amount = basic_amount * this_qty;
	//$("#ct_qty_txt").text(this_qty); 
	$("#ct_qty").val(this_qty);
	$("#it_pay").val(show_total_amount);
	$("#total_amount").html(show_total_amount.format());
	}
</script>


<%@ include file="../include/foot.jsp" %>