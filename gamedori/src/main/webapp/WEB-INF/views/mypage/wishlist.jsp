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
								<th width="10%" class="text-center">가격</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${selectWishlist}" var="vo" >
							<tr>
								<td id="Check"><input type="checkbox" class="item"></td>
								<!-- img url c태그 -->
								<c:url value='/images/${vo.prod_imgt}' var="img"/>
								<td class="text-center align-middle"><a href="<c:url value='/prod/detail.do' />"><img src="${img}"></a></td>
								<td class="align-middle">
									<ul class="list-unstyled mb-0 ps-2 pe-2">
										<li><a href="#">${vo.prod_name}</a></li><!-- 제품명 -->
										<li style="color: #b9b9b9;">${vo.opt_name}</li><!-- 옵션 -->
						
									</ul>
								</td>
								<td class="text-center align-middle">${vo.prod_price + vo.opt_price}</td><!-- 가격 -->
								<td class="text-center align-middle">
									<ul class="list-unstyled mb-0">
										<li><button type="button" class="addCart_btn btn btn-secondary w-35" data-toggle="popover">
											장바구니 담기
										</button></li>
										<li><button class="btn btn-outline-danger mt-2 w-35">삭제</button></li>
									</ul>
								</td>
								
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<button type="button" class="btn btn-outline-secondary btn-sm mb-5">선택삭제</button>

				</form>
			</div>
		</section>
	</div>
	
	<script> <!-- 카트 담기 ajax -->
		
		$("addCart_btn").click(function()
		{
			var product_tb_idx = $("#product_tb_idx").val();
			var data = 
			{
				product_tb_idx : product_tb_idx
			};
			
			
			$.ajax
			({
				url: "<%=request.getContextPath()%>/mypage/addCart.do",
				type: "post",
				data: data,
				success: function(result)
				{
					if(result != 1){alert("회원만 사용할 수 있는 서비스입니다.");}
				},
				error: function(){alert("카트 담기 실패!");}
				
			})
			
		})
		
	
		
		
	</script>
	
</main>


<%@ include file="../include/foot.jsp" %>