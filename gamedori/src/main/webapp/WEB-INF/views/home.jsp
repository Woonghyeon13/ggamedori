<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="./include/head.jsp" %>
	<main>		
		<!--메인뷰-->	
		<div id="carouselExampleDark" class="inner carousel slide shadow-drop-center" data-bs-ride="carousel">
			<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>

			<div class="carousel-inner">
				<div class="carousel-item active" data-bs-interval="10000">
					<img src="<c:url value='/images/mainview_1.jpg' />" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item" data-bs-interval="2000">
					<img src="<c:url value='/images/mainview_2.jpg' />" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="<c:url value='/images/mainview_3.jpg' />" class="d-block w-100" alt="...">
				</div>
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
			
			<div id="index_1" class="inner container">
				<img id="index_1_img" src="<c:url value='/images/index_img.png' />" class="mt-4"/>
				<img id="index_1_img2" src="<c:url value='/images/index_img2.webp' />" />
				<div id="index_1_text" class="fade-in">
					<h3>갓 오브 워 라그나로크</h3>
					<p>Santa Monica Studios가 호평을 받은 God of War(2018)의 후속작을 소개합니다. 핌불의 겨울이 다가옵니다. 크레토스와 아트레우스는 아홉영역을 탐험하며 답을 구하고, 아스가르드의 군세는 세상을 종말로 이끌 것이라 예언된 전쟁에 대비합니다.</p>
					<button type="button" class="btn btn-outline-dark btn-sm MC">자세히 보기</button>
				</div>
			</div>
			
			<div id="index_1" class="inner container">
				<img id="index_1_img" src="<c:url value='/images/index_img3.png' />" class="mt-4"/>
				<img id="index_1_img2" src="<c:url value='/images/index_img4.jpg' />" />
				<div id="index_1_text" class="fade-in">
					<h3>젤다의 전설 티어스 오브 더 킹덤</h3>
					<p>끝없는 모험의 무대가 하늘로 넓어진다.<br>하늘에 떠 있는 섬들, 처음 보는 무기, 신기한 탈것... 도대체 하이랄에 무슨 일이 일어난 것인가?<br>당신만의 끝없는 모험이 다시 시작됩니다.</p>
					<button type="button" class="btn btn-outline-dark btn-sm MC">자세히 보기</button>
				</div>
			</div>

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
		
		
		  <script>
		    $(document).ready(function() {
		        $('#summernote').summernote();
		    });
		  </script>

	</main>

<%@ include file="./include/foot.jsp" %>