<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>

<main>
	<!-- 상품 정보 -------------------------------------------->
	<div class="container inner">
		<div class="container mt-5">
			<div class="row">
				<div class="col-7">
					<img class="border" src="<c:url value='/images/피파23 ps5_600x600.jpg' />">
				</div>
				<div class="col-5">
					<div class="container">
						<div>
							<h2 class="fw-bold">PS5 EA SPORTS FIFA 23</h2>
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
									<span class="fw-bold fs-5 me-1" style="color: #ee4a44;">52,000</span>
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
						<form name="" action="" method="">
							<div class="row align-items-start">
								<div class="col-3">
									<p class="fw-semibold">제조사</p>
								</div>
								<div class="col-9">
									<p>EA SPORTS</p>
								</div>
							</div>
							<div class="row align-items-start">
								<div class="col-3">
									<p class="fw-semibold">출시일</p>
								</div>
								<div class="col-9">
									<p>2022-09-30</p>
								</div>
							</div>
							<div class="row align-items-start">
								<div class="col-3">
									<p class="fw-semibold">기종</p>
								</div>
								<div class="col-9">
									<p>PlayStation 5</p>
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
								<script>
                  function num(value){
                  
                    for(i=1; i<=4 ;i++){
                    document.getElementById(i).style.display="none";
                    }
                    document.getElementById(value).style.display="block";
                  }
                  </script>
								<div class="col-9">
									<select class="form-select" onchange="num(this.value)"
										aria-label="Default select example">
										<option selected>선택</option>
										<option value="1">EA SPORTS FIFA23</option>
									</select>

									<div class="choice_product mt-3" style="margin: auto 0;">
										<div class="border-top border-bottom mx-2" id="1"
											style="display: none;">
											<div class="d-flex justify-content-between">
												<div class="mt-3">
													<p>EA SPORTS FIFA23</p>
												</div>
												<!--선택한 옵션 이름나오게 해주세요-->
												<div class="btn-group btn-group-sm my-3" role="group">
													<button type="button" class="btn btn-secondary"
														style="width: 2vw;" onclick="change_qty2('m')">-</button>
													<input type="text" name="ct_qty" id="ct_qty" value="1"
														readonly="readonly" class="text-center"
														style="width: 3vw;">
													<button type="button" class="btn btn-secondary"
														style="width: 2vw;" onclick="change_qty2('p')">+</button>
												</div>
											</div>
										</div>
										<div id="2" style="display: none">2</div>
										<div id="3" style="display: none">3</div>
										<div id="4" style="display: none">4</div>
									</div>
								</div>
							</div>
							<p class="d-flex justify-content-end my-4 align-items-end">
								총 금액<span class="fs-3 me-1 ms-2 fw-bold" id="total_amount"
									style="color: #ee4a44;">52,000</span>원
							</p>
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
				<img src="<c:url value='/images/피파23_PS5_상세.jpg' />" alt="">
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
					<td class="col-1 ps-3"><span class="star"> ★★★★★ <span
							style="width: 50%;">★★★★★</span>
					</span></td>
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
									<div
										class="form-group mt-2 d-flex justify-content-between align-items-center">
										<span>별점</span> <span class="star"> ★★★★★ <span>★★★★★</span>
											<input name="review_star" type="range"
											oninput="drawStar(this)" value="1" step="1" min="0" max="10">
										</span>
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
				<h2>상품문의(0)</h2>
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
					<tr class="text-center qa_item" style="cursor: pointer;">
						<td>답변완료</td>
						<td style="text-align: left;">제목</td>
						<td>이름</td>
						<td>작성일</td>
					</tr>
					<tr class="hide">
						<td></td>
						<td colspan="4">문의내용 <br>
							<hr> <i class="xi-subdirectory"></i><i class="xi-message"></i>
							답변내용
						</td>
					</tr>
					<tr class="text-center qa_item" style="cursor: pointer;">
						<td>답변완료</td>
						<td style="text-align: left;">제목</td>
						<td>이름</td>
						<td>작성일</td>
					</tr>
					<tr class="hide">
						<td></td>
						<td colspan="4">문의내용 <br>
							<hr> <i class="xi-subdirectory"></i><i class="xi-message"></i>
							답변내용
						</td>
					</tr>
					<tr class="text-center qa_item" style="cursor: pointer;">
						<td>답변완료</td>
						<td style="text-align: left;"><i class="xi-lock-o"></i>제목</td>
						<td>이름</td>
						<td>작성일</td>
					</tr>
					<tr class="hide">
						<td></td>
						<td colspan="4">문의내용 <br>
							<hr> <i class="xi-subdirectory"></i><i class="xi-message"></i>
							답변내용
						</td>
					</tr>
					<!-- 문의 없음 -->
					<!-- <tr>
            <td class="py-5">등록된 문의가 없습니다.</td>
          </tr> -->
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
								<form name="qa" method="post" action="loginAction.jsp">
									<div class="form-group">
										<input type="text" class="form-control" id="qa_title"
											placeholder="제목" name="qa_title">
									</div>
									<div class="form-group mt-2 col">
										<textarea class="form-control h-25" rows="10" id="qa_contents"
											placeholder="내용" name="qa_contents"></textarea>
									</div>
									<div class="d-grid gap-1 mt-2 d-flex align-items-center">
										<span>비밀글여부</span>
										<div>
											<input class="form-check-input" type="checkbox"
												id="checkboxNoLabel" value="" aria-label="...">
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
              
            var basic_amount = parseInt('52000');

            function change_qty2(t){
            //var min_qty = '수량버튼'*1;
            var min_qty = 1;
            var this_qty = $("#ct_qty").val()*1;
            var max_qty = '2'; // 최대 구매 수량
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
                alert("최대 구매가능 수량을 초과하였습니다");
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