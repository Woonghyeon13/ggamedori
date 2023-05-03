<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
<main>
	<div class="inner product_list">
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
						<c:if test="${param.cate_new eq '1'}">
							새로운상품
						</c:if>
						<c:if test="${param.cate_rsv eq '1'}">
							예약상품
						</c:if>
					</h2>
					<br>
					<c:if test="${param.cate_refcode eq '100' or param.cate_code eq '101' or param.cate_code eq '102' or param.cate_code eq '103' or param.cate_code eq '104'}">	
						<c:if test="${not empty cateImgs.cate_switchImg}">
							<img src="<c:url value='/images/categoryImg/${cateImgs.cate_switchImg}' />">
						</c:if>				
					</c:if>
					<c:if test="${param.cate_refcode eq '200' or param.cate_code eq '201' or param.cate_code eq '202' or param.cate_code eq '203'}">
						<c:if test="${not empty cateImgs.cate_ps5Img}">	
							<img src="<c:url value='/images/categoryImg/${cateImgs.cate_ps5Img}' />">
						</c:if>
					</c:if>
					<c:if test="${param.cate_refcode eq '300' or param.cate_code eq '301' or param.cate_code eq '302' or param.cate_code eq '303'}">
						<c:if test="${not empty cateImgs.cate_ps4Img}">		
							<img src="<c:url value='/images/categoryImg/${cateImgs.cate_ps4Img}' />">
						</c:if>
					</c:if>
					<c:if test="${param.cate_refcode eq '400' or param.cate_code eq '401' or param.cate_code eq '402' or param.cate_code eq '403'}">
						<c:if test="${not empty cateImgs.cate_xboxImg}">
							<img src="<c:url value='/images/categoryImg/${cateImgs.cate_xboxImg}' />">
						</c:if>
					</c:if>
					<c:if test="${param.cate_refcode eq '500'}">
						<c:if test="${not empty cateImgs.cate_goodsImg}">		
							<img src="<c:url value='/images/categoryImg/${cateImgs.cate_goodsImg}' />">
						</c:if>
					</c:if>
					<c:if test="${param.cate_new eq '1'}">
						<c:if test="${not empty cateImgs.cate_newImg}">
							<img src="<c:url value='/images/categoryImg/${cateImgs.cate_newImg}' />">
						</c:if>
					</c:if>
					<c:if test="${param.cate_rsv eq '1'}">
						<c:if test="${not empty cateImgs.cate_resImg}">
							<img src="<c:url value='/images/categoryImg/${cateImgs.cate_resImg}' />">
						</c:if>
					</c:if>
				</div>
				<div class="mt-5 border-top border-2 border-dark">
					<ul class="d-flex justify-content-evenly mt-4 ps-0">
						<c:if test="${param.cate_refcode eq '100' or param.cate_code eq '101' or param.cate_code eq '102' or param.cate_code eq '103' or param.cate_code eq '104'}">
						    <li><a href="<c:url value='/prod/list.do'><c:param name="cate_refcode" value="100"/></c:url>">전체</a></li>
						    <li><a href="<c:url value='/prod/list.do'><c:param name="cate_code" value="101"/></c:url>">하드웨어</a></li>
						    <li><a href="<c:url value='/prod/list.do'><c:param name="cate_code" value="102"/></c:url>">타이틀</a></li>
						    <li><a href="<c:url value='/prod/list.do'><c:param name="cate_code" value="103"/></c:url>">주변기기</a></li>
						    <li><a href="<c:url value='/prod/list.do'><c:param name="cate_code" value="104"/></c:url>">아미보</a></li>
						</c:if>
						<c:if test="${param.cate_refcode eq '200' or param.cate_code eq '201' or param.cate_code eq '202' or param.cate_code eq '203'}">
						    <li><a href="<c:url value='/prod/list.do'><c:param name="cate_refcode" value="200"/></c:url>">전체</a></li>
						    <li><a href="<c:url value='/prod/list.do'><c:param name="cate_code" value="201"/></c:url>">하드웨어</a></li>
						    <li><a href="<c:url value='/prod/list.do'><c:param name="cate_code" value="202"/></c:url>">타이틀</a></li>
						    <li><a href="<c:url value='/prod/list.do'><c:param name="cate_code" value="203"/></c:url>">주변기기</a></li>
						</c:if>
						<c:if test="${param.cate_refcode eq '300' or param.cate_code eq '301' or param.cate_code eq '302' or param.cate_code eq '303'}">
						 <li><a href="<c:url value='/prod/list.do'><c:param name="cate_refcode" value="300"/></c:url>">전체</a></li>
						    <li><a href="<c:url value='/prod/list.do'><c:param name="cate_code" value="301"/></c:url>">하드웨어</a></li>
						    <li><a href="<c:url value='/prod/list.do'><c:param name="cate_code" value="302"/></c:url>">타이틀</a></li>
						    <li><a href="<c:url value='/prod/list.do'><c:param name="cate_code" value="303"/></c:url>">주변기기</a></li>
						</c:if>
						<c:if test="${param.cate_refcode eq '400' or param.cate_code eq '401' or param.cate_code eq '402' or param.cate_code eq '403'}">
							 <li><a href="<c:url value='/prod/list.do'><c:param name="cate_refcode" value="400"/></c:url>">전체</a></li>
						    <li><a href="<c:url value='/prod/list.do'><c:param name="cate_code" value="401"/></c:url>">하드웨어</a></li>
						    <li><a href="<c:url value='/prod/list.do'><c:param name="cate_code" value="402"/></c:url>">타이틀</a></li>
						    <li><a href="<c:url value='/prod/list.do'><c:param name="cate_code" value="403"/></c:url>">주변기기</a></li>
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
					<li><a href="#" data-sort="high" id="tag">높은가격순</a></li>
					<li><a href="#" data-sort="row" id="tag">낮은가격순</a></li>
					<li><a href="#" data-sort="hot" id="tag">인기상품</a></li>
					<li><a href="#" data-sort="new" id="tag">최근순</a></li>
				</ul>
			</div>
		</div>
        
		<div class="mt-5">
			 <ul class="d-flex flex-wrap product-list" style="padding: 0;">
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


	</div>


<script>

function changeSort(event, sort, cateRefCode, cateCode) {
    event.preventDefault();

    var contextPath = '<%= request.getContextPath() %>';
    var url = contextPath + '/prod/list.do?sort=' + sort;
    
    // cateRefCode와 cateCode가 존재한다면 URL에 추가
    if (cateRefCode) {
        url += '&cate_refcode=' + cateRefCode;
    }
    if (cateCode) {
        url += '&cate_code=' + cateCode;
    }
    if (cateNew) {
        url += '&cate_new=' + cateNew;
    }
    if (cateRsv) {
        url += '&cate_rsv=' + cateRsv;
    }

    $.ajax({
        url: url,
        method: 'GET',
        success: function (data) {
            var product_list = $(data).find('.product-list');
            $('.product-list').html(product_list.html());
        },
        error: function (xhr, status, error) {
            console.log('Error:', error);
        }
    });
}

$('.product_sort a').on('click', function (event) {
    var sort = $(this).data('sort');
    var cateRefCode = '<%= request.getParameter("cate_refcode") %>';
    var cateCode = '<%= request.getParameter("cate_code") %>';
    var cateNew = '<%= request.getParameter("cate_new") %>';
    var cateRsv = '<%= request.getParameter("cate_rsv") %>';
    changeSort(event, sort, cateRefCode, cateCode, cateNew, cateRsv);
});
	
	
	
</script>

</main>

<%@ include file="../include/foot.jsp" %>