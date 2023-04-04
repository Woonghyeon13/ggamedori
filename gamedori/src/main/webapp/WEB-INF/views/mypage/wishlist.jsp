<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
<main>		
	<div class="inner">
		<section class="container mb-4" id="wishlist">

			<h3 class="text-center fw-bold mt-5 mb-5">찜목록</h3>

			<div class="pt-5 pb-5">
				<form>
					<table class="table border-top">
						<thead>
							<tr>
								<th width="3%" id="Check"><input type="checkbox" id="check-all"></th>
								<th width="10%" class="text-center">상품이미지</th>
								<th width="50%" class="text-center">상품정보</th>
								<th class="text-center">가격</th>
								<th width="20%"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td id="Check"><input type="checkbox" class="item"></td>
								<!-- img url c태그 -->
								<c:url value='/images/ps4 피파23_180x180.jpg' var="img"/>
								<td class="text-center align-middle"><a href="<c:url value='/prod/detail.do' />"><img src="${img}"></a></td>
								<td class="align-middle">
									<ul class="list-unstyled mb-0 ps-2 pe-2">
										<li><a href="#">PS4 피파23</a></li>
										<li style="color: #b9b9b9;">옵션 내용</li>
									</ul>
								</td>
								<td class="text-center align-middle">70,000원</td>
								<td class="text-center align-middle">
									<ul class="list-unstyled mb-0">
										<li><button type="button" class="btn btn-secondary w-50" data-toggle="popover">
											장바구니담기
										</button></li>
										<li><button class="btn btn-outline-danger mt-2 w-50">삭제</button></li>
									</ul>
								</td>
								
							</tr>

							<tr>
								<td id="Check"><input type="checkbox" class="item"></td>
								<td class="text-center align-middle"><a href="<c:url value='/prod/detail.do' />"><img src="${img}"></a></td>
								<td class="align-middle">
									<ul class="list-unstyled mb-0 ps-2 pe-2">
										<li><a href="#">PS4 피파23</a></li>
										<li style="color: #b9b9b9;">옵션 내용</li>
									</ul>
								</td>
								<td class="text-center align-middle">70,000원</td>
								<td class="text-center align-middle">
									<ul class="list-unstyled mb-0">
										<li><button type="button" class="btn btn-secondary w-50" data-toggle="popover">
											장바구니담기
										</button></li>
										<li><button class="btn btn-outline-danger mt-2 w-50">삭제</button></li>
									</ul>
								</td>
						
							</tr>
						</tbody>
					</table>
					<button type="button" class="btn btn-outline-secondary btn-sm mb-5">선택삭제</button>

				</form>
			</div>
		</section>
	</div>
</main>


<%@ include file="../include/foot.jsp" %>