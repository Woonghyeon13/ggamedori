<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="./include/head.jsp" %>
	<main>		
		<!--메인뷰-->	
		<div id="carouselExampleDark" class="inner carousel slide shadow-drop-center" data-bs-ride="carousel">
			<div class="carousel-indicators">
			<c:forEach var="calist" items="${clist }" varStatus="cnt">
				<c:choose>
					<c:when test="${(cnt.count - 1) == 0 }">
						<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active"></button>
					</c:when>
					<c:otherwise>
						<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="${cnt.count - 1 }"></button>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			</div>
			<div class="carousel-inner">
				<c:forEach var="calist" items="${clist }" varStatus="cnt">
					<c:choose>
						<c:when test="${cnt.count == 1 }">
							<div class="carousel-item active" data-bs-interval="8000">
								<a href="<c:url value='${calist.carousel_prod_link }'/>">
									<img src="<c:url value='/images/carousel/${calist.carousel_img_name }' />" class="d-block w-100" alt="...">
								</a>
							</div>
						</c:when>
						<c:otherwise>	
							<div class="carousel-item" data-bs-interval="8000">
								<a href="<c:url value='${calist.carousel_prod_link }'/>">
									<img src="<c:url value='/images/carousel/${calist.carousel_img_name }' />" class="d-block w-100" alt="...">
								</a>
							</div>
						</c:otherwise>
					</c:choose>	
				</c:forEach>
			</div>

			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
			</button>

		</div>

		<!--광고영역-->
		<section id="AD">
			<c:forEach var="alist" items="${adlist }">
			<div id="index_1" class="inner container">
				<img id="index_1_img" src="<c:url value='/images/ad/${alist.ad_img_b }' />" class="mt-4"/>
				<img id="index_1_img2" src="<c:url value='/images/ad/${alist.ad_img_s }' />" />
				<div id="index_1_text" class="fade-in">
					<h3>${alist.ad_title }</h3>
					<div>${alist.ad_contents }</div>
					<button type="button" class="btn btn-outline-dark btn-sm MC">
						<a href="<c:url value='${alist.ad_link }' />">자세히 보기</a>
					</button>
				</div>
			</div>
			</c:forEach>

			<div class="inner">
				<!-- 새로운상품 -->
				<div class="mt-5 mb-5">
					<div>
						<h3 class="text-center" style="margin-bottom:70px">New!</h3>
					</div>	
					<div class="mt-5">
						<ul class="d-flex flex-wrap" style="padding: 0;">
							<c:forEach var="pvo" items="${plist}" begin="0" end="9">
								<li class="ms-1 me-1 mb-4" style="width: 200px;">
									<a href="<c:url value='/prod/detail.do?prod_idx=${pvo.prod_idx}'/>">
										<div style="text-align: center;">
											<img src="<c:url value='/images/${pvo.prod_imgt}'/>" alt="...">
											<div>
												<p class="text-center fs-6 mb-0">${pvo.prod_name}</p>
												<fmt:formatNumber var="prodPrice" value="${pvo.prod_price}" pattern="#,###"/>
												<p class="text-center fs-5 fw-bold mb-0" style="color: #cc0033;">${prodPrice}원</p>
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
					<div class="text-end">
						<button type="button" class="btn btn-outline-dark btn-sm">
							<a href="<c:url value='/prod/list.do?cate_new=1'/>">더보기</a>
						</button>
					</div>
				</div>
				<!-- 예약상품 -->
				<div class="mt-5 mb-5">
					<div>
						<h3 class="text-center" style="margin-bottom:70px">예약상품</h3>
					</div>	
					<div class="mt-5">
						<ul class="d-flex flex-wrap" style="padding: 0;">
							<c:forEach var="rli" items="${rlist}" begin="0" end="9">
								<li class="ms-1 me-1 mb-4" style="width: 200px;">
									<a href="<c:url value='/prod/detail.do?prod_idx=${rli.prod_idx}'/>">
										<div style="text-align: center;">
											<img src="<c:url value='/images/${rli.prod_imgt}'/>" alt="...">
											<div>
												<p class="text-center fs-6 mb-0">${rli.prod_name}</p>
												<fmt:formatNumber var="prodPrice2" value="${rli.prod_price}" pattern="#,###"/>
												<p class="text-center fs-5 fw-bold mb-0" style="color: #cc0033;">${prodPrice2}원</p>
												<c:if test="${rli.prod_stock eq 0}">
													<p class="text-center"><img src="<c:url value='/images/ico_product_soldout.gif' />"></p>
												</c:if>
											</div>
										</div>
									</a> 
								</li>
							</c:forEach>
				        </ul>
				    </div>
					<div class="text-end">
						<button type="button" class="btn btn-outline-dark btn-sm">
							<a href="<c:url value='/prod/list.do?cate_rsv=1'/>">더보기</a>
						</button>
					</div>
				</div>
				
			</div>
			
			<div id="Award" style="overflow: hidden">
				<img src="<c:url value='/images/aw_bg.png' />">
				<div id="index_4_Content" ><img src="<c:url value='/images/aw_fg.png' />"></div>
			</div>



		</section><!-- END:AD -->
	</main>

<%@ include file="./include/foot.jsp" %>