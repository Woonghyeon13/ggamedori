<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
<main>
	<div class="inner">
		<div>
			<div>
				<div>
					<h2 id="product_title">
						<c:if test="${param.cate_refcode eq '100' or param.cate_code eq '101' or param.cate_code eq '102' or param.cate_code eq '103' or param.cate_code eq '104'}">
							닌텐도 Switch
						</c:if>
						<c:if test="${param.cate_refcode eq '200' or param.cate_code eq '201' or param.cate_code eq '202' or param.cate_code eq '203'}">
							PlayStation5
						</c:if>
						<c:if test="${param.cate_refcode eq '300' or param.cate_code eq '301' or param.cate_code eq '302' or param.cate_code eq '303'}">
							PlayStation4
						</c:if>
						<c:if test="${param.cate_refcode eq '400' or param.cate_code eq '401' or param.cate_code eq '402' or param.cate_code eq '403'}">
							XBOX
						</c:if>
						<c:if test="${param.cate_refcode eq '500'}">
							GOODS
						</c:if>
						<c:if test="${param.cate_rsv eq '1'}">
							예약상품
						</c:if>
					</h2>
					<br>
					<c:if test="${param.cate_refcode eq '100' or param.cate_code eq '101' or param.cate_code eq '102' or param.cate_code eq '103' or param.cate_code eq '104'}">
						<img src="<c:url value='/images/shop1_26_top_ps4.jpg' />">
					</c:if>
					<c:if test="${param.cate_refcode eq '200' or param.cate_code eq '201' or param.cate_code eq '202' or param.cate_code eq '203'}">
						<img src="<c:url value='/images/shop1_26_top_ps4.jpg' />">
					</c:if>
					<c:if test="${param.cate_refcode eq '300' or param.cate_code eq '301' or param.cate_code eq '302' or param.cate_code eq '303'}">
						<img src="<c:url value='/images/shop1_26_top_ps4.jpg' />">
					</c:if>
					<c:if test="${param.cate_refcode eq '400' or param.cate_code eq '401' or param.cate_code eq '402' or param.cate_code eq '403'}">
						<img src="<c:url value='/images/shop1_26_top_ps4.jpg' />">
					</c:if>
					<c:if test="${param.cate_refcode eq '500'}">
						<img src="<c:url value='/images/shop1_26_top_ps4.jpg' />">
					</c:if>
					<c:if test="${param.cate_rsv eq '1'}">
						<img src="<c:url value='/images/shop1_26_top_ps4.jpg' />">
					</c:if>
				</div>
				<div class="mt-5 border-top border-2 border-dark">
					<ul class="d-flex justify-content-evenly mt-4 ps-0">
						<c:if test="${param.cate_refcode eq '100' or param.cate_code eq '101' or param.cate_code eq '102' or param.cate_code eq '103' or param.cate_code eq '104'}">
							<li><a href="<c:url value='/prod/list.do?cate_refcode=100'/>">전체</a></li>
							<li><a href="<c:url value='/prod/list.do?cate_code=101'/>">하드웨어</a></li>
							<li><a href="<c:url value='/prod/list.do?cate_code=102'/>">타이틀</a></li>
							<li><a href="<c:url value='/prod/list.do?cate_code=103'/>">주변기기</a></li>
							<li><a href="<c:url value='/prod/list.do?cate_code=104'/>">아미보</a></li>
						</c:if>
						<c:if test="${param.cate_refcode eq '200' or param.cate_code eq '201' or param.cate_code eq '202' or param.cate_code eq '203'}">
							<li><a href="<c:url value='/prod/list.do?cate_refcode=200'/>">전체</a></li>
							<li><a href="<c:url value='/prod/list.do?cate_code=201'/>">하드웨어</a></li>
							<li><a href="<c:url value='/prod/list.do?cate_code=202'/>">타이틀</a></li>
							<li><a href="<c:url value='/prod/list.do?cate_code=203'/>">주변기기</a></li>
						</c:if>
						<c:if test="${param.cate_refcode eq '300' or param.cate_code eq '301' or param.cate_code eq '302' or param.cate_code eq '303'}">
							<li><a href="<c:url value='/prod/list.do?cate_refcode=300'/>">전체</a></li>
							<li><a href="<c:url value='/prod/list.do?cate_code=301'/>">하드웨어</a></li>
							<li><a href="<c:url value='/prod/list.do?cate_code=302'/>">타이틀</a></li>
							<li><a href="<c:url value='/prod/list.do?cate_code=303'/>">주변기기</a></li>
						</c:if>
						<c:if test="${param.cate_refcode eq '400' or param.cate_code eq '401' or param.cate_code eq '402' or param.cate_code eq '403'}">
							<li><a href="<c:url value='/prod/list.do?cate_refcode=400'/>">전체</a></li>
							<li><a href="<c:url value='/prod/list.do?cate_code=401'/>">하드웨어</a></li>
							<li><a href="<c:url value='/prod/list.do?cate_code=402'/>">타이틀</a></li>
							<li><a href="<c:url value='/prod/list.do?cate_code=403'/>">주변기기</a></li>
						</c:if>
					</ul>
				</div>
			</div>
			<div class="row mt-5">
				<p class="col-6">
					<c:if test="${param.cate_refcode eq '100'}">닌텐도 Switch</c:if>
					<c:if test="${param.cate_refcode eq '200'}">PlayStation5</c:if>
					<c:if test="${param.cate_refcode eq '300'}">PlayStation4</c:if>
					<c:if test="${param.cate_refcode eq '400'}">XBOX</c:if>
					<c:if test="${param.cate_refcode eq '500'}">GOODS</c:if>
					<c:if test="${param.cate_code eq '101' or param.cate_code eq '201' or param.cate_code eq '301' or param.cate_code eq '401'}">하드웨어</c:if>
					<c:if test="${param.cate_code eq '102' or param.cate_code eq '202' or param.cate_code eq '302' or param.cate_code eq '402'}">타이틀</c:if>
					<c:if test="${param.cate_code eq '103' or param.cate_code eq '203' or param.cate_code eq '303' or param.cate_code eq '403'}">주변기기</c:if>
					<c:if test="${param.cate_code eq '104'}">아미보</c:if>
					카테고리에 총 ${listCnt}개의 상품이있습니다.
				</p>
				<ul class="col-6 d-flex justify-content-end product_sort">
					<li id="li1"><a href="<c:url value='/.do'/>" id="tag">높은가격순</a></li>
					<li id="li1"><a href="<c:url value='/.do'/>" id="tag">낮은가격순</a></li>
					<li id="li1"><a href="<c:url value='/.do'/>" id="tag">인기상품</a></li>
					<li><a href="<c:url value='/.do'/>" id="tag">최근순</a></li>
				</ul>
			</div>
		</div>
        
		<div class="mt-5">
			<ul class="d-flex flex-wrap" style="padding: 0;">
				<c:forEach var="pvo" items="${plist}">
				<li class="ms-1 me-1 mb-4" style="width: 200px;">
					<a href="<c:url value='/prod/detail.do?prod_idx=${pvo.prod_idx}'/>">
						<div style="text-align: center;">
							<img src="<c:url value='/images/${pvo.prod_imgt}'/>" alt="...">
							<div>
								<p class="text-center fs-6 mb-0">${pvo.prod_name}</p>
								<p class="text-center fs-5 fw-bold mb-0" style="color: #cc0033;">${pvo.prod_price}</p>
								<c:if test="${pvo.prod_stock eq 0}">
									<p class="text-center"><img src="<c:url value='/images/ico_product_soldout.gif' />"></p>
								</c:if>
							</div>
						</div>
					</a> 
				</li>
				</c:forEach>
            </ul>
        </div>

        <!--페이지네이션-->
		<div class="d-flex justify-content-center">
		    <nav>
		        <ul class="pagination">
		            <li class="page-item">
		                <a class="page-link text-reset" href="<c:url value='/.do'/>" aria-label="Previous">
		                <span aria-hidden="true">&laquo;</span>
		                </a>
		            </li>
		            <li class="page-item"><a class="page-link text-reset" href="#">1</a></li>
		            <li class="page-item"><a class="page-link text-reset" href="#">2</a></li>
		            <li class="page-item"><a class="page-link text-reset" href="#">3</a></li>
					<li class="page-item">
						<a class="page-link text-reset" href="#" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</ul>
			</nav>
		</div>

	</div>

</main>

<%@ include file="../include/foot.jsp" %>