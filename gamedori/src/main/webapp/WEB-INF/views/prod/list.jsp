<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/head.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


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
							<li><a href="#" onclick="changeCategory('cate_refcode', '100', event)">전체</a></li>
							<li><a href="#" onclick="changeCategory('cate_code', '101', event)">하드웨어</a></li>
							<li><a href="#" onclick="changeCategory('cate_code', '102', event)">타이틀</a></li>
							<li><a href="#" onclick="changeCategory('cate_code', '103', event)">주변기기</a></li>
							<li><a href="#" onclick="changeCategory('cate_code', '104', event)">아미보</a></li>
							
						</c:if>
						<c:if test="${param.cate_refcode eq '200' or param.cate_code eq '201' or param.cate_code eq '202' or param.cate_code eq '203'}">
							<li><a href="#" onclick="changeCategory('cate_refcode', '200', event)">전체</a></li>
							<li><a href="#" onclick="changeCategory('cate_code', '201', event)">하드웨어</a></li>
							<li><a href="#" onclick="changeCategory('cate_code', '202', event)">타이틀</a></li>
							<li><a href="#" onclick="changeCategory('cate_code', '203', event)">주변기기</a></li>
						
						</c:if>
						<c:if test="${param.cate_refcode eq '300' or param.cate_code eq '301' or param.cate_code eq '302' or param.cate_code eq '303'}">
									<li><a href="#" onclick="changeCategory('cate_refcode', '300', event)">전체</a></li>
							<li><a href="#" onclick="changeCategory('cate_code', '301', event)">하드웨어</a></li>
							<li><a href="#" onclick="changeCategory('cate_code', '302', event)">타이틀</a></li>
							<li><a href="#" onclick="changeCategory('cate_code', '303', event)">주변기기</a></li>
						</c:if>
						<c:if test="${param.cate_refcode eq '400' or param.cate_code eq '401' or param.cate_code eq '402' or param.cate_code eq '403'}">
							<li><a href="#" onclick="changeCategory('cate_refcode', '400', event)">전체</a></li>
							<li><a href="#" onclick="changeCategory('cate_code', '401', event)">하드웨어</a></li>
							<li><a href="#" onclick="changeCategory('cate_code', '402', event)">타이틀</a></li>
							<li><a href="#" onclick="changeCategory('cate_code', '403', event)">주변기기</a></li>
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
				    <li id="li1"><a href="#" onclick="sortProducts('high', event)">높은가격순</a></li>
				    <li id="li1"><a href="#" onclick="sortProducts('row', event)">낮은가격순</a></li>
				    <li id="li1"><a href="#" onclick="sortProducts('hot', event)">인기상품</a></li>
				    <li><a href="#" onclick="sortProducts('new', event)">최근순</a></li>
				</ul>
				<script>
				
				function changeCategory(paramName, paramValue, event) {
				    event.preventDefault();
				    var sort = '<%=request.getParameter("sort")%>' || '';

				    var data = {sort: sort};
				    data[paramName] = paramValue;

				    $.ajax({
				        url: '<%=request.getContextPath()%>/prod/list.do',
				        method: 'GET',
				        data: data,
				        success: function (data) {
				            console.log(data);
				            var product_list = $(data).find('.product-list');
				            $('.product-list').html(product_list.html());
				        },
				        error: function (xhr, status, error) {
				            console.log('Error:', error);
				        }
				    });
				}
				function sortProducts(sort, event) {
				  
				    event.preventDefault();
				    var cate_refcode 	= '<%=request.getParameter("cate_refcode")%>'|| '';
				    var cate_code 		= '<%=request.getParameter("cate_code")%>'	 || '';
				    var cate_rsv 		= '<%=request.getParameter("cate_rsv")%>'	 || '';
				    var cate_new 		= '<%=request.getParameter("cate_new")%>'	 || '';
				    
				    $.ajax
				    ({
				        url: '<%=request.getContextPath()%>/prod/list.do',
				        method: 'GET',
				        data: 
				        {	//파라미터
				            sort:sort, 
				            cate_refcode: cate_refcode, 
				            cate_code: cate_code,
				            cate_rsv: cate_rsv,
				            cate_new: cate_new
				        },
				        success: function(data)
				        {
				             console.log(data)
				             var product_list = $(data).find('.product-list');
				             $('.product-list').html(product_list.html());
				             
				        },
				        error: function(xhr, status, error)
				        {
				            console.log('Error:', error);	
				        }
				        
				    });
				}
				</script>
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
       <!-- 페이징 -->
		<div class="mt-3">
			<nav>
			  <ul class="pagination justify-content-center">
			    <c:forEach var="i" begin="1" end="${totalPages}">
			      <li class="page-item ${param.page == i || (fn:trim(param.page) == '' && i == 1) ? 'active' : ''}">
			        <a class="page-link" >
			          ${i}
			        </a>
			      </li>
			    </c:forEach>
			  </ul>
			</nav>
		</div>
            

	</div>
	
	


	<script>
	function sortProducts(sort) {
		event.preventDefault();
		var sort = $(this).attr('id');
	    var cate_refcode 	= '<%=request.getParameter("cate_refcode")%>'|| '';
	    var cate_code 		= '<%=request.getParameter("cate_code")%>'	 || '';
	    var cate_rsv 		= '<%=request.getParameter("cate_rsv")%>'	 || '';
	    var cate_new 		= '<%=request.getParameter("cate_new")%>'	 || '';
	    
		$.ajax
		({
			url: '<%=request.getContextPath()%>/prod/list.do',
			method: 'GET',
			data: 
			{	//파라미터
				sort:sort, 
				cate_refcode: cate_refcode, 
		        cate_code: cate_code,
		        cate_rsv: cate_rsv,
		        cate_new: cate_new
			},
			success: function(data)
			{
				 console.log(data)
				 var product_list = $(data).find('.product-list');
	                $('.product-list').html(product_list.html());
		             
			},
			error: function(xhr, status, error)
			{
				console.log('Error:', error);	
			}
			
		});
	});
	
	
</script>


</main>

<%@ include file="../include/foot.jsp" %>