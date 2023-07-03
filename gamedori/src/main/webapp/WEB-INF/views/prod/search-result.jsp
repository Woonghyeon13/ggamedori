<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
					<span id="result-title">${searchText} 로 검색해서 나온 상품 목록입니다.</span> 총 <span id="result-count"></span>개의 상품이 있습니다.
				</p>
		<%-- 		<ul class="col-6 d-flex justify-content-end product_sort">
					<li id="li1"><a href="<c:url value='/prod/list.do'/>?sort=high" id="tag">높은가격순</a></li>
					<li id="li1"><a href="<c:url value='/prod/list.do'/>?sort=row" id="tag">낮은가격순</a></li>
					<li id="li1"><a href="<c:url value='/prod/list.do'/>?sort=hot" id="tag">인기상품</a></li>
					<li><a href="<c:url value='/prod/list.do'/>?sort=new" id="tag">최근순</a></li>
				</ul> --%>
			</div>
		</div>
        
		<div class="mt-5">
			 <ul id="search-results" class="d-flex flex-wrap" style="padding: 0;">
				<c:forEach var="pvo" items="${plist}">
					<li class="ms-1 me-1 mb-4" style="width: 200px;">
						<a href="<c:url value='/prod/detail.do?prod_idx=${pvo.prod_idx}'/>">
							<div style="text-align: center;">
								<img src="<c:url value='/images/prod/thumb/${pvo.prod_imgt}'/>" alt="...">
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

      

	</div>
<script>
var originalTableData = [];

$(document).ready(function () {
    // 기본 테이블 데이터를 저장합니다.
    $('#table-body > tr').each(function () {
        originalTableData.push($(this).clone());
    });
    // 페이징 색상 처리를 추가합니다.
    updatePaginationForAll();

    var initialSearchOption = "${searchOption}";
    var initialSearchText = "${searchText}";

    $('.btn_search').click(function (event) {
        event.preventDefault();
        // 검색어와 검색 옵션 가져오기
        var searchOption = $('#searchOption').val();
        var searchText = $('#searchText').val();
        // 검색 옵션 확인
        if (searchOption === '검색 옵션') {
            alert('검색 옵션을 선택해주세요.');
            return;
        }

        if (searchText === '') {
            location.reload(); // 공백 입력 시 페이지를 새로고침합니다.
            
            return;
        }

        // AJAX 요청 전송
        searchAndDisplayResults(searchText, searchOption, 1);
    });

    // 페이지가 로드되었을 때, 전체 목록을 표시하고 페이지네이션을 처리합니다.
    var searchText = initialSearchText;
    var searchOption = initialSearchOption;
    var page = 1;
    searchAndDisplayResults(searchText, searchOption, page);
});
    
function searchAndDisplayResults(searchText, searchOption, page) {
    if (searchText.trim() === '') {
        searchText = ''; // 공백 입력 시 검색 텍스트를 빈 문자열로 설정합니다.
        $('#result-title').text("전체로 로 검색해서 나온 상품 목록입니다.");
    }
    sendAjaxRequest('prodlistsearch', searchText, searchOption, page, function(response) {
        displaySearchResults(response.searchResults);
        updatePagination(response.totalPages, searchText, searchOption, page);
    });
}

function sendAjaxRequest(searchType, searchText, searchOption, page, onSuccess) {
    $.ajax({
        url: '<%=request.getContextPath()%>/search', // 변경된 URL
        method: 'GET',
        dataType: 'json',
        data: {
            searchType: searchType, // 새로 추가된 searchType 매개변수
            searchText: searchText,
            searchOption: searchOption,
            page: page
        },
        success: onSuccess,
        error: function (xhr, status, error) {
            console.log('Error:', error);
        }
    });
}
	
	  //테이블 검색한거에 따른 갯수처리
	function displaySearchResults(searchResults) {
    var searchResultsContainer = $('#search-results');
    
    searchResultsContainer.empty(); // 이전 검색 결과를 지우고
   
    var resultCount = searchResults.length;
    if (searchResults.length === 0) {
        // 검색 결과가 없는 경우 검색 결과가 없음을 표시합니다.
        var noResultsItem = $('<li>').addClass('text-center').text('검색 결과가 없습니다.');
        searchResultsContainer.append(noResultsItem);
     // 결과 개수를 가져와서 출력합니다.
        $('#result-count').text(resultCount);
    } else {
    	// 결과 개수를 가져와서 출력합니다.
        $('#result-count').text(resultCount);
        // 검색 결과가 있는 경우
        $.each(searchResults, function (index, result) {
            var newItem = $('<li>').addClass('ms-1 me-1 mb-4').css('width', '200px');
            var link = $('<a>').attr('href', '/controller/prod/detail.do?prod_idx=' + result.prod_idx);
            var image = $('<img>').attr('src', '/controller/images/prod/thumb/' + result.prod_imgt).attr('alt', '...');
            var prodName = $('<p>').addClass('text-center fs-6 mb-0').text(result.prod_name);
            var prodPrice = $('<p>').addClass('text-center fs-5 fw-bold mb-0').css('color', '#cc0033').text(result.prod_price+"원");
            link.append(image);
            link.append(prodName);
            link.append(prodPrice);

            if (result.prod_stock === 0) {
                var soldOutImage = $('<img>').attr('src', '/controller/images/ico_product_soldout.gif');
                link.append($('<p>').addClass('text-center').append(soldOutImage));
            }

            newItem.append(link);
            searchResultsContainer.append(newItem);
        });
    }
}

function updatePaginationForAll() {
    var pagination = $('.pagination');
    pagination.find('li').each(function () {
        var pageItem = $(this);
        var pageLink = pageItem.find('a.page-link');
        if (pageItem.hasClass('active')) {
            pageLink.css({
                'background-color': '#dadbdd',
                'border-color': '#dee2e6'
            });
        } else {
            pageLink.css({
                'background-color': '',
                'border-color': ''
            });
        }
        // 페이지 링크 클릭 이벤트를 추가합니다.
        pageLink.on('click', function (event) {
            event.preventDefault();
            var page = $(this).text();
            // 전체 목록을 페이지별로 불러옵니다.
            searchAndDisplayResults('', '', page);
        });
    });
}
	function updatePagination(totalPages, searchText, searchOption, currentPage) {
	    var pagesToShow = 5; // 한 번에 표시할 페이지 번호의 개수를 설정합니다.
	    var pagination = $('.pagination');
	    pagination.empty();

	    if (totalPages === 0) {
	        totalPages = 1;
	    }

	    var startPage = Math.floor((currentPage - 1) / pagesToShow) * pagesToShow + 1;
	    var endPage = Math.min(startPage + pagesToShow - 1, totalPages);

	    // 처음 페이지로 이동
	    var firstPageItem = $('<li>').addClass('page-item');
	    var firstPageLink = $('<a>').addClass('page-link').attr('href', '#').text('<<');
	    if (currentPage > 1) {
	        firstPageLink.on('click', function (event) {
	            event.preventDefault();
	            searchAndDisplayResults(searchText, searchOption, 1);
	        });
	    } else {
	        firstPageItem.addClass('disabled');
	    }
	    firstPageItem.append(firstPageLink);
	    pagination.append(firstPageItem);

	    // 이전 페이지로 이동
	    var prevPageItem = $('<li>').addClass('page-item');
	    var prevPageLink = $('<a>').addClass('page-link').attr('href', '#').text('<');
	    if (currentPage > 1) {
	        prevPageLink.on('click', function (event) {
	            event.preventDefault();
	            searchAndDisplayResults(searchText, searchOption, currentPage - 1);
	        });
	    } else {
	        prevPageItem.addClass('disabled');
	    }
	    prevPageItem.append(prevPageLink);
	    pagination.append(prevPageItem);
	    
	    // 페이지 번호
	    for (var i = startPage; i <= endPage; i++) {
	        var isActive = i == currentPage;
	        var pageItem = $('<li>').addClass('page-item').toggleClass('active', isActive);
	        var pageLink = $('<a>').addClass('page-link').attr('href', '#').text(i);

	        pageLink.on('click', function (event) {
	            event.preventDefault();
	            var page = $(this).text();
	            searchAndDisplayResults(searchText, searchOption, page);
	        });
	        pageItem.append(pageLink);
	        pagination.append(pageItem);
	    }

	    // 다음 페이지로 이동
	    var nextPageItem = $('<li>').addClass('page-item');
	    var nextPageLink = $('<a>').addClass('page-link').attr('href', '#').text('>');
	    if (currentPage < totalPages) {
	        nextPageLink.on('click', function (event) {
	            event.preventDefault();
	            searchAndDisplayResults(searchText, searchOption, currentPage + 1);
	        });
	    } else {
	        nextPageItem.addClass('disabled');
	    }
	    nextPageItem.append(nextPageLink);
	    pagination.append(nextPageItem);

	    // 마지막 페이지로 이동
	    var lastPageItem = $('<li>').addClass('page-item');
	    var lastPageLink = $('<a>').addClass('page-link').attr('href', '#').text('>>');
	    if (currentPage < totalPages) {
	        lastPageLink.on('click', function (event) {
	            event.preventDefault();
	            searchAndDisplayResults(searchText, searchOption, totalPages);
	        });
	    } else {
	        lastPageItem.addClass('disabled');
	    }
	    lastPageItem.append(lastPageLink);
	        pagination.append(lastPageItem);
	    }
	  </script>	
			
		<!-- 페이징 -->
		 <nav aria-label="Page navigation example" style="margin-top:20px;">
		    <ul class="pagination justify-content-center">
		      <c:forEach var="i" begin="1" end="${totalPages}">
		        <li class="page-item ${param.page == i || (fn:trim(param.page) == '' && i == 1) ? 'active' : ''}">
		          <a class="page-link">
		            ${i}
		          </a>
		        </li>
		      </c:forEach>
		    </ul>
		  </nav>
		 </div>

<script>
	$('.product_sort a').on('click', function(event){
		
		var sort = $(this).attr('href');
	});

	$.ajax
	({
		url: '/prod/list.do?sort='+sort,
		method: 'GET',
		data:{sort: sort},	//파라미터
		success: function(data){
			$('.product-list').html(data)
		},
		error: function(xhr, status, error)
		{
			console.log('Error:', error);	
		}
		
	});

</script>

</main>

<%@ include file="../include/foot.jsp" %>