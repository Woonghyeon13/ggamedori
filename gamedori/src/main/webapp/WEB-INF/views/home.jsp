<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="./include/head.jsp" %>
	<main>		
		<!--메인뷰-->	
		<div id="carouselExampleDark" class="inner carousel slide shadow-drop-center" data-bs-ride="carousel">
			<div class="carousel-indicators">
			<c:forEach var="clist" items="${clist }" varStatus="cnt">
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
				<c:forEach var="clist" items="${clist }" varStatus="cnt">
					<c:choose>
						<c:when test="${cnt.count == 1 }">
							<div class="carousel-item active" data-bs-interval="8000">
								<a href="<c:url value='${clist.carousel_prod_link }'/>">
									<img src="<c:url value='/images/carousel/${clist.carousel_img_name }' />" class="d-block w-100" alt="...">
								</a>
							</div>
						</c:when>
						<c:otherwise>	
							<div class="carousel-item" data-bs-interval="8000">
								<a href="<c:url value='${clist.carousel_prod_link }'/>">
									<img src="<c:url value='/images/carousel/${clist.carousel_img_name }' />" class="d-block w-100" alt="...">
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
			<c:forEach var="adlist" items="${adlist }">
			<div id="index_1" class="inner container">
				<img id="index_1_img" src="<c:url value='/images/ad/${adlist.ad_img_b }' />" class="mt-4"/>
				<img id="index_1_img2" src="<c:url value='/images/ad/${adlist.ad_img_s }' />" />
				<div id="index_1_text" class="fade-in">
					<h3>${adlist.ad_title }</h3>
					<div>${adlist.ad_contents }</div>
					<button type="button" class="btn btn-outline-dark btn-sm MC">
						<a href="<c:url value='${adlist.ad_link }' />">자세히 보기</a>
					</button>
				</div>
			</div>
			</c:forEach>

			<!-- 조회수 기준 hot -->
			<div id="index_3"class="container">
				<h3 class="text-center" style="margin-bottom:70px">HOT</h3>
				<div class="row row-cols-5" style="margin-bottom:100px">
				
				<div class="col"><a href="#"><img src="<c:url value='/images/PS5 묶이지 않은 자들을 위한 우주.jpg' />"></a></div>
				<div class="col"><a href="#"><img src="<c:url value='/images/PS5 와룡 폴른 다이너스티.jpg' />"></a></div>
				<div class="col"><a href="#"><img src="<c:url value='/images/닌텐도 스위치 마인크래프트 레전드_180x180.jpg' />"></a></div>
				<div class="col"><a href="#"><img src="<c:url value='/images/닌텐도 스위치 스운 어스이스케이프.jpg' />"></a></div>
				<div class="col"><a href="#"><img src="<c:url value='/images/피파23 ps5_600x600.jpg' />"></a></div>
		
				</div>
				<div class="row row-cols-5" style="margin-bottom:30px">
	
				<div class="col"><a href="#"><img src="<c:url value='/images/피파23 ps5_600x600.jpg' />"></a></div>
				<div class="col"><a href="#"><img src="<c:url value='/images/닌텐도 스위치 스운 어스이스케이프.jpg' />"></a></div>
				<div class="col"><a href="#"><img src="<c:url value='/images/닌텐도 스위치 마인크래프트 레전드_180x180.jpg' />"></a></div>
				<div class="col"><a href="#"><img src="<c:url value='/images/PS5 와룡 폴른 다이너스티.jpg' />"></a></div>
				<div class="col"><a href="#"><img src="<c:url value='/images/PS5 묶이지 않은 자들을 위한 우주.jpg' />"></a></div>
				
				</div>
				<a href="#"><p>더보기</p></a>

				
				<section style="margin-bottom:300px">
					<h3 id="h3_1" class="text-center" style="margin-top:380px">하드웨어</h3>
					<div id="index_3_C" class="row row-cols-4 mx-auto text-center">
						<div class="col"><a href="#"><img src="./images/C_1.png"></a><br/>Nintendo Switch</div>
						<div class="col"><a href="#"><img src="./images/C_2.png"></a><br/>PlayStation5</div>
						<div class="col"><a href="<c:url value='/prod/list.do'/>"><img src="./images/c_3.png"></a><br/>PlayStation4</div>
						<div class="col"><a href="#"><img src="./images/C_4.png"></a><br/>XBOX</div>
					</div>
				</section>
			</div>

			<div id="Award" >
				<img src="<c:url value='/images/aw_bg.png' />">
				<div id="index_4_Content" ><img src="<c:url value='/images/aw_fg.png' />"></div>
			</div>

		</section><!-- END:AD -->
	</main>

<%@ include file="./include/foot.jsp" %>