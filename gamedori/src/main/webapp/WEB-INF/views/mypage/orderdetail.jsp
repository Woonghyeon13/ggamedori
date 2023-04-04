<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
<main>

	<!-- 주문 상세조회 --------------------------------------------------------- -->

	<div id="detail_inner2" class="container">
		<div id="head" class="container">
			<h4>주문 상세정보</h4>
		</div>

		<div id="o_number" class="container-fluid">
			<p>주문번호 : 12345678</p>
			<p>주문일자 : 2023-03-27</p>
			<button type="button" class="btn btn-outline-secondary btn-sm">내역삭제</button>
			<button type="button" class="btn btn-outline-secondary btn-sm"
				data-bs-toggle="modal" data-bs-target="#exampleModal2">영수증조회</button>
		</div>
		<hr>
		<div id="product2" class="container">
			<div id="p_left" class="col-sm-5">
				<img src="<c:url value='/images/mario.png'/>">
			</div>
			<div id="p_right" class="col-sm-6">
				<p>[겜도리]GameDori</p>
				<p>
					<span>구매확정 / 구매 준비중 [둘중 하나 선택]</span>
				</p>
				<p>닌텐도 스위치 마리오 + 래비드 반짝이는 희망 은하계 에디션</p>
				<p>가격 : 64800원</p>
				<p>주문 수량 : 1개</p>
				<br> <br> <br> <br>

			</div>
			<button type="button" class="btn btn-outline-secondary btn-sm"
				data-bs-toggle="modal" data-bs-target="#exampleModal">배송조회</button>
		</div>
		<!-- end:#product2 -->

		<div id="addr_info" class="container">
			<h4>배송지정보</h4>
			<hr>
			<table id="addr_" class="table">
				<tbody>
					<tr>
						<th class="col-2"><strong>수령인</strong></th>
						<td class="col-8" style="border-bottom: 0px"><span>[
								이름 표시 ex ) 홍길동 ]</span></td>
					</tr>
					<tr>
						<th class="col-2"><strong>연락처</strong></th>
						<td class="col-8" style="border-bottom: 0px"><span>[
								연락처 표시] ex ) 010-0000-0000 ]</span></td>
					</tr>
					<tr>
						<th class="col-2"><strong>배송지</strong></th>
						<td class="col-8" style="border-bottom: 0px"><span>[
								주소 표시 ex ) 전라북도 전주시 덕진구 백제대로 572 5층 이젠컴퓨터학원 ]</span></td>
					</tr>
					<tr>
						<th class="col-2"><strong>배송 메모</strong></th>
						<td class="col-8" style="border-bottom: 0px"><span>[
								메모 표시 ex ) 부재시 경비실에 맡겨주세요. ] </span></td>
					</tr>
				</tbody>
			</table>

		</div>
		<!-- end:#addr_info -->

		<div id="pay_money" class="container">
			<table class="table">
				<tr>
					<th style="border-bottom: 0px"><strong>최종 주문 금액</strong></th>
					<td style="text-align: right; border-bottom: 0px"><strong>58000원</strong></td>
				</tr>
				<tr>
					<th></th>
					<td></td>
				</tr>
				<tr>
					<th>상품 금액</th>
					<td style="text-align: right">64800원</td>
				</tr>
				<tr>
					<th>배송비</th>
					<td style="text-align: right">0원</td>
				</tr>
				<tr>
					<th>쿠폰 할인</th>
					<td style="text-align: right">-10%</td>
				</tr>
			</table>
		</div>
		<!-- end:#pay_money -->

		<div id="pay_detail">
			<h4>포인트 혜택</h4>
			<table class="table">
				<tr>
					<th>구매 적립</th>
					<td style="text-align: right">648원</td>
				</tr>
			</table>
		</div>
		<div id="check_btn">
			<button type="button" class="btn btn-outline-secondary btn-sm">확인</button>

		</div>
	</div>
	<!-- end:#detail_inner2 -->


	<!-- 배송 조회--------------------------------------------------------------- -->

	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">배송조회</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div id="detail_inner3" class="container">

						<div id="head" class="container"></div>

						<div id="delivery_check" class="container">
							<p>
								<strong>OO월 OO일 (O요일) OO:OO </strong>
							</p>
							<p>
								<strong>배송 완료 / 배송 준비중</strong>
							</p>
							<!-- 배송 완료 [글씨색 초록색] , 배송 준비중 [글씨색 회색]-->
							<p>
								<span>아직 상품을 받지 못하셨다면 택배사로 문의해주세요.</span>
							</p>
						</div>

						<hr>

						<div id="d_list" class="container">
							<ul>
								<li><img src="<c:url value='/images/mario.png'/>"></li>
								<li>
									<p>닌텐도 스위치 마리오 + 래비드 반짝이는 희망 은하계 에디션</p>
									<p>
										<span>ex ) 3월 27일 (월) 구매</span>
									</p>
								</li>
								<li>
									<p>
										<a href="order_detail2.html" class="link-secondary">주문 상세
											></a>
									</p>
								</li>
							</ul>
						</div>
						<!-- end:#d_list -->

						<div id="post_num" class="container">
							<ul>
								<li><span>송장번호</span> <strong>12345678</strong></li>
								<li><span>배송업체</span> <strong>이젠택배</strong></li>
							</ul>
						</div>
						<!-- end:#post_num -->

						<div id="enquiry2" class="container">
							<ul>
								<li><img src="<c:url value='/images/신발.jpg'/>"></li>
								<li>
									<p>GameDoRi겜도리</p> <span>판매자문의</span>
								</li>
								<li>
									<button type="button" class="btn btn-outline-secondary">
										<img src="<c:url value='/images/one-to-one.png'/>">
									</button>
								</li>
								<li>
									<button onclick="btn();" type="button"
										class="btn btn-outline-secondary">
										<img src="<c:url value='/images/phone.png'/>">
									</button> <script>
										function btn() {
											alert('문의 주실 번호는 010-0000-0000 입니다.');
										}
									</script>
								</li>
							</ul>
						</div>
						<!-- end:#enquiry -->

						<div id="accordion" class="container">
							<h5>자주하는 질문</h5>
							<div class="accordion accordion-flush" id="accordionFlushExample">
								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button collapsed" type="button"
											data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
											aria-expanded="false" aria-controls="flush-collapseOne">
											상품 배송기간은 얼마나 걸려요?</button>
									</h2>
									<div id="flush-collapseOne" class="accordion-collapse collapse"
										data-bs-parent="#accordionFlushExample">
										<div class="accordion-body">
											<span> 상품 배송기간은 배송방법, 고객님의 수령지역 및 배송사에 따라 차이가 있습니다. <br>
												<code>대부분 상품 배송기간은 판매자가 상품을 발송한 날로부터 영업일 기준 3~5일 정도
													소요됩니다.</code> <br> - 오늘출발 : 상품정보에 기재된 제한 시한까지 결제하면 당일 발송
												처리되며, 택배사 사정에 따라 배송기간은 영업일 기준 2~3일 정도 소요될 수 있습니다. - 희망일배송 :
												주문시 선택하신 배송희망일에 맞춰 배송이 진행되며 변경을 원하실 경우 판매자에게 문의해 주셔야 합니다.

												구매한 상품의 발송 예정일은 판매자에게 문의하면 자세하게 확인할 수 있습니다. 판매자 문의는
												결제내역>쇼핑>주문건 또는 주문상세정보 페이지의 판매자 연락처와 [문의하기]를 통해 할 수 있습니다.
											</span>
										</div>
									</div>
								</div>
								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button collapsed" type="button"
											data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
											aria-expanded="false" aria-controls="flush-collapseTwo">
											발송처리가 되었는데, 배송조회가 정상적으로 되지 않아요. 어떻게 해야 하나요?</button>
									</h2>
									<div id="flush-collapseTwo" class="accordion-collapse collapse"
										data-bs-parent="#accordionFlushExample">
										<div class="accordion-body">
											<span> 송장번호는 등록되었으나 배송추적이 안된다면 불가사유에 따라 아래 내용을 확인해
												주세요. <br> <br> <code>1. 판매자가 실제 배송이 시작되기 전에
													미리 송장 번호를 등록한 경우</code> <br> 판매자가 빠른 발송처리를 위해 실제 택배사 배송이 시작되기
												전, 송장을 먼저 출력한 후 송장번호를 등록하는 경우가 있습니다. 이런 경우라면 보통 송장번호가 등록된 당일
												또는 다음날 상품배송이 진행됨과 동시에 배송추적이 가능합니다. <br> <code>2.
													판매자(가맹점)이 송장번호를 잘못 등록한 경우</code> <br> 판매자가 실수로 택배사와 송장번호를 잘못
												입력한 경우에도 배송추적 정보가 확인되지 않습니다. 이런 경우라면 판매자에게 직접 상품의 실제 발송여부 및
												송장번호 수정 요청해 주세요. 판매자가 정상 송장번호를 등록한 후에 배송조회를 할 수 있습니다. <br>
												<code>3. 배송조회 서비스가 제공되지 않는 택배사인 경우</code> <br> CJ대한통운,
												우체국택배, 한진, 옐로우캡, 로젠택배, 동부택배, KGB택배, gtx로지스, 현대택배, 우편등기,
												대신택배, 일양로지스, 경동택배, 천일택배, 편의점택배, 합동택배, DHL(익스프레스인 경우만), EMS,
												UPS, FedEx, CJ대한통운(국제특송), TNT, 성원글로벌, 대운글로벌, GSMNTON, 범한판토스,
												ACI 송장에 대해서만 배송조회 서비스가 제공됩니다. 이외의 택배사는 네이버페이에서 배송추적이 어렵기 때문에
												정확한 배송현황은 판매자에게 직접 문의해 주세요.
											</span>
										</div>
									</div>
								</div>
								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button collapsed" type="button"
											data-bs-toggle="collapse"
											data-bs-target="#flush-collapseThree" aria-expanded="false"
											aria-controls="flush-collapseThree">구매확정을 미루고 싶어요.
											어떻게 해야 하나요?</button>
									</h2>
									<div id="flush-collapseThree"
										class="accordion-collapse collapse"
										data-bs-parent="#accordionFlushExample">
										<div class="accordion-body">
											<span> 배송중 또는 배송완료 상태에서 상품에 문제가 있어 구매확정을 보류해야 하는 경우,
												'네이버페이 홈> 결제내역> 쇼핑> 주문건' 또는 주문상세정보 페이지에서 <code>[구매확정
													연장] 버튼을 클릭하여 자동 구매확정되지 않도록 예정일을 연장</code>부탁드립니다. <br> ※ 구매확정
												연장은 <code>1회에 10일씩, 최대 3회까지(총 30일까지)연장</code>할 수 있으며, <code>자동
													구매확정 예정 3일 전부터 진행 가능</code>합니다.
											</span>
										</div>
									</div>
								</div>
								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button collapsed" type="button"
											data-bs-toggle="collapse"
											data-bs-target="#flush-collapseFour" aria-expanded="false"
											aria-controls="flush-collapseFour">주문을 취소했는데, 상품이
											발송되어 버렸어요. 어떻게 해야 하나요?</button>
									</h2>
									<div id="flush-collapseFour"
										class="accordion-collapse collapse"
										data-bs-parent="#accordionFlushExample">
										<div class="accordion-body">
											<span>취소요청을 했는데 이미 판매자가 상품을 발송해버린 경우, 상품을 받으신 뒤 반품처리를
												진행해주셔야 합니다. <br> 단, <code>구매자 귀책사유로 반품이 요청되는 경우
													반품배송비가 청구</code> 될 수 있습니다.
											</span>
										</div>
									</div>
								</div>
								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button collapsed" type="button"
											data-bs-toggle="collapse"
											data-bs-target="#flush-collapseFive" aria-expanded="false"
											aria-controls="flush-collapseFive">주문한 상품을 반품/교환하고
											싶어요.</button>
									</h2>
									<div id="flush-collapseFive"
										class="accordion-collapse collapse"
										data-bs-parent="#accordionFlushExample">
										<div class="accordion-body">
											<span> '전자상거래에 의한 소비자보호에 관한 법률'에 의거, 반품기간 이내에는 언제든지
												판매자(가맹점)에 반품/교환을 요청하실 수 있습니다. (반품운송비 원인제공자가 부담 원칙) 반품을 원하시는
												경우 우선 판매자(가맹점)에 직접 연락하여 사유, 배송방법, 운송비를 협의하신 후 상품을 반송하시면 됩니다.
												<br> <code>반품/교환요청은 배송완료 후 7일 이내까지 결제내역 페이지에서
													가능하며, 구매확정 이후에는 반품/교환요청을 하실 수 없습니다.</code>
											</span>
										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- end:#accordion-->

					</div>
					<!-- end:#detail_inner3 -->
				</div>
			</div>
		</div>
	</div>


	<!-- 영수증 발급 내역 (영수증 조회) ------------------------------------------------------ -->

	<div class="modal fade" id="exampleModal2" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">영수증 발급 내역</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<div id="detail_inner4" class="container">

						<div id="head" class="container">

							<br>
						</div>

						<div id="order" class="container">
							<ul>
								<li><span>주문 번호</span></li>
								<li><strong>123345678</strong></li>
							</ul>
							<button type="button" class="btn btn-outline-success"
								data-bs-toggle="modal" data-bs-target="#exampleModal3">구매
								영수증</button>

						</div>
						<!-- end:#order -->

						<div id="cash_receipt" class="container">
							<ul>
								<li>
									<h4>
										<a href="#">GameDoRi 겜도리</a>
									</h4>
								</li>
								<li>배송비 OOOO원</li>
							</ul>
							<button type="button" class="btn btn-outline-secondary"
								data-bs-toggle="modal" data-bs-target="#exampleModal4">현금
								영수증</button>

						</div>
						<!-- end:#cash_receipt -->

						<hr>
						<div id="p_info" class="container">
							<ul>
								<li><img src="<c:url value='/images/mario.png'/>"></li>
								<li>[게임정보 출력되는 곳]<span>닌텐도 스위치 마리오 + 래비드 반짝이는 희망 은하계
										에디션</span> <br> [가격 출력되는 곳]<strong>58000 원</strong>
								</li>
							</ul>
							<button type="button" class="btn btn-outline-secondary"
								data-bs-toggle="modal" data-bs-target="#exampleModal4">현금
								영수증</button>
						</div>
						<!-- end:#p_info -->

						<hr>
						<div id="receipt_guide" class="container">
							<p>
								<span>신용카드 매출전표는 결제완료 시 자동 발급되며, 결제완료 후 확인 및 출력이 가능합니다.</span>
							</p>
							<p>현금 영수증 안내</p>
							<p>현금영수증은 발급 완료된 주문건에 한해 조회 및 출력이 가능하며, 구매확정일 및 반품완료일 기준으로
								발급됩니다. 구매확정 전까지 [주문상세 > 영수증 조회 > 현금영수증 정보변경]에서 현금영수증 신청정보를 변경할 수
								있습니다. 네이버페이 포인트로 결제한 금액에 대해서는 현금영수증이 발급되지 않습니다. 네이버페이 머니로 결제한
								금액에 대해서만 현금영수증이 발급되며, 충전 내역은 NPay머니에서 확인하실 수 있습니다. 현금영수증에는
								개인소득공제용과 사업자증빙용이 있으며, 세금계산서가 필요하신 경우 사업자증빙용 현금영수증을 신청하시면 됩니다.
								일회용컵 보증금과 리유저블컵 보증금은 현금영수증 발급대상에 포함되지 않습니다.</p>

						</div>

					</div>
					<!-- end:#detail_inner4 -->
				</div>
			</div>
		</div>
	</div>


	<!-- 구매 영수증 -------------------------------------------------------------- -->

	<div class="modal fade" id="exampleModal3" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">구매 영수증</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" onclick="location.href='order_detail2.html'"></button>
				</div>
				<div class="modal-body">
					<div id="detail_inner5" class="container">
						<div id="head" class="container"></div>
						<table id="p_receipt" class="table">
							<tbody>
								<tr>
									<th class="col-3" scope="row"><strong>주문 번호</strong></th>
									<td class="col-8">[ 주문번호 표시 ex ) 12345678 ]</td>
								</tr>
								<tr>
									<th class="col-3" scope="row"><strong>구매 일시</strong></th>
									<td class="col-8">[ 구매일시 표시 ex ) 2023-03-28 ]</td>
								</tr>
								<tr>
									<th class="col-3" scope="row"><strong>상품 명</strong></th>
									<td class="col-8">[ 상품명 표시 ex ) 닌텐도 스위치 마리오 + 래비드 반짝이는 희망
										은하계 에디션 ]</td>
								</tr>
								<tr>
									<th class="col-3" scope="row"><strong>구매 가격</strong></th>
									<td class="col-8">[ 가격 표시 ex 58000원 ]</td>
								</tr>
								<tr>
									<th class="col-3" scope="row"><strong>회사 명</strong></th>
									<td class="col-8">[ 회사명 표시 ex ) GameDoRi 겜도리 ]</td>
								</tr>
								<tr>
									<th class="col-3" scope="row"><strong>서명</strong></th>
									<td class="col-8">[ 이름 표시 ex ) 홍길동 ]</td>
								</tr>
							</tbody>
						</table>

						<hr style="clear: both;">
						<div id="explain" class="container">
							<p>구매 영수증은 세금계산서 등 세무상 증빙서류로 활용할 수 없으며, 거래내역 및 거래금액을 확인하는
								용도로만 사용 가능합니다.</p>
						</div>
					</div>
					<!-- end:#detail_inner5 -->
				</div>
			</div>
		</div>
	</div>

	<!-- 현금 영수증 화면 (준비중) ------------------------------------------- -->

	<div class="modal fade" id="exampleModal4" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">현금 영수증</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" onclick="location.href='order_detail2.html'"></button>
				</div>
				<div class="modal-body">

					<div id="detail_inner6" class="container">

						<div id="ready" class="container">
							<p>현재 준비중</p>
						</div>
					</div>
					<!-- end:#detail_inner6-->
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- end#detail_inner -->

</main>
<!-- end : main------------------------------->


<%@ include file="../include/foot.jsp" %>