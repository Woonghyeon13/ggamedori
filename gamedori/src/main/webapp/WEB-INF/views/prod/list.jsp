<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
<main>
	<div class="inner">
		<div>
			<div>
				<div>
					<h2 id="product_title">Playstation4</h2>
					<br>
					<img src="<c:url value='/images/shop1_26_top_ps4.jpg' />">
				</div>
				<div class="mt-5 border-top border-2 border-dark">
					<ul class="d-flex justify-content-evenly mt-4 ps-0">
						<li><a href="<c:url value='/.do'/>">전체</a></li>
						<li><a href="<c:url value='/.do'/>">하드웨어</a></li>
						<li><a href="<c:url value='/.do'/>">타이틀</a></li>
						<li><a href="<c:url value='/.do'/>">주변기기</a></li>
					</ul>
				</div>
			</div>
			<div class="row mt-5">
				<p class="col-6">Playstation4 카테고리에 총 xx개의 상품이있습니다.</p>
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
				<li class="ms-1 me-1 mb-4">
					<a href="<c:url value='/prod/detail.do'/>">
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