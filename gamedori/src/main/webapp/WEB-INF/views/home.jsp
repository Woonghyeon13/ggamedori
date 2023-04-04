<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="./include/head.jsp" %>
	<main>		
		<!--메인뷰-->	
		<div id="carouselExampleDark" class="carousel slide shadow-drop-center" data-bs-ride="carousel">
			<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>

			<div class="carousel-inner">
				<div class="carousel-item active" data-bs-interval="10000">
					<img src="<c:url value='/images/mainview_H.png' />" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<div id="MainView_Title" class="position-absolute bottom-0 start-50 translate-middle mb-4"></div>
						<h5 class="mt-4">새로운 이야기를 써 내려가세요</h5>
						<p>지금 PS5로 출시된 신규 오픈 월드 액션 RPG에서 마법사 세계의 운명을 결정하세요</p>
					</div>
				</div>
				<div class="carousel-item" data-bs-interval="2000">
					<img src="<c:url value='/images/mainview_2.webp' />" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<div id="MainView_Title2" class="position-absolute bottom-0 start-50 translate-middle mb-4"></div>
						<h5>정예 유닛으로 운영하세요</h5>
						<p>Battlefield 2042 시즌 4가 출시되었습니다. 신규 전장에서 싸우고, 새로운 스페셜리스트를 배치하고, 새로운 무기 등을 사용하며, 새로운 콘텐츠를 잠금 해제하세요.</p>
						
					</div>
				</div>
				<div class="carousel-item">
					<img src="<c:url value='/images/mainview_4.jpg' />" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block ms-5">
						<div id="MainView_Title3" class="position-absolute bottom-0 start-50 translate-middle mb-4 pb-4 ms-5 container"></div>
						<h5>죽음을 피하고, 쓰러트리는 쾌감.</h5>
						<p>현대의 플레이 감각, 재구성된 스토리, 최신 그래픽을 통해 다시 태어난 서바이벌 호러의 명작을 체험하세요.</p>
					</div>
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
			
			<div id="index_1" class="container">
				<div id="back"></div>
				<img id="index_1_img" src="<c:url value='/images/index_img.png' />" class="mt-4"/>
				<img id="index_1_img2" src="<c:url value='/images/index_img2.webp' />" />
				<div id="index_1_text" class="fade-in">
					<h3>갓 오브 워 라그나로크</h3>
					<p>Santa Monica Studios가 호평을 받은 God of War(2018)의 후속작을 소개합니다. 핌불의 겨울이 다가옵니다. 크레토스와 아트레우스는 아홉영역을 탐험하며 답을 구하고, 아스가르드의 군세는 세상을 종말로 이끌 것이라 예언된 전쟁에 대비합니다.</p>
					<button type="button" class="btn btn-outline-dark btn-sm MC">자세히 보기</button>
				</div>
			</div>

			<div id="index_2">
				<div id="back"></div>
				<p id="index_2_title"><img src="./images/New_title.png"></p>
				<p id="index_2_img1" class="fade-in4"><img src="<c:url value='/images/New_1.png' />"></p>
				<p id="index_2_img1" class="fade-in4"><img src="<c:url value='/images/New_2.png' />"></p>
				<p id="index_2_img1" class="fade-in4"><img src="<c:url value='/images/New_3.png' />"></p>
				<p id="index_2_img1" class="fade-in4"><img src="<c:url value='/images/New_4.png' />"></p>
			</div>

			<div id="index_3"class="container">
				<h3 class="text-left">HOT</h3>
				<div class="row row-cols-5" >
				<div class="col"><a href="#"><img src="<c:url value='/images/HOT1.jpg' />"></a></div>
				<div class="col"><a href="#"><img src="<c:url value='/images/HOT2.jpg' />"></a></div>
				<div class="col"><a href="#"><img src="<c:url value='/images/HOT3.webp' />"></a></div>
				<div class="col"><a href="#"><img src="<c:url value='/images/HOT4.webp' />"></a></div>
				<div class="col"><a href="#"><img src="<c:url value='/images/HOT5.webp' />"></a></div>
				</div>

				<h3>예약</h3>
				<div class="row row-cols-5">
					<div class="col"><a href="#"><img src="<c:url value='/images/Res1.webp' />"></a></div>
					<div class="col"><a href="#"><img src="<c:url value='/images/Res2.webp' />"></a></div>
					<div class="col"><a href="#"><img src="<c:url value='/images/Res3.jpg' />"></a></div>
					<div class="col"><a href="#"><img src="<c:url value='/images/Res4.webp' />"></a></div>
					<div class="col"><a href="#"><img src="<c:url value='/images/Res5.webp' />"></a></div>
				</div>
				<a href="#"><p class="text-white">더보기</p></a>
				
				<section>
					<h3 id="h3_1" class="text-center">하드웨어</h3>
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