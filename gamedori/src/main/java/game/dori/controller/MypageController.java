package game.dori.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping( value = "/mypage" )
@Controller
public class MypageController {
	
	// 마이페이지 첫화면
	@RequestMapping( value = "/main", method = RequestMethod.GET )
	public String main()
	{
		return "mypage/main";
	}
	
	// 1:1 문의
	@RequestMapping( value = "/oto", method = RequestMethod.GET )
	public String oto()
	{
		return "mypage/oto";
	}

	// 상품 문의
	@RequestMapping( value = "/prodqa", method = RequestMethod.GET )
	public String prodqa()
	{
		return "mypage/prodqa";
	}
	
	// 주문목록
	@RequestMapping( value = "/prodlist", method = RequestMethod.GET )
	public String prodlist()
	{
		return "mypage/prodlist";
	}

	// 주문상세
	@RequestMapping( value = "/orderdetail", method = RequestMethod.GET )
	public String orderdetail()
	{
		return "mypage/orderdetail";
	}

	// 적립금
	@RequestMapping( value = "/point", method = RequestMethod.GET )
	public String point()
	{
		return "mypage/point";
	}

	// 쿠폰
	@RequestMapping( value = "/reviewlist", method = RequestMethod.GET )
	public String reviewlist()
	{
		return "mypage/reviewlist";
	}

	// 쿠폰
	@RequestMapping( value = "/coupon", method = RequestMethod.GET )
	public String coupon()
	{
		return "mypage/coupon";
	}

	//찜목록
	@RequestMapping( value = "/wishlist", method = RequestMethod.GET )
	public String wishlist()
	{
		return "mypage/wishlist";
	}
	
	//장바구니
	@RequestMapping( value = "/cart", method = RequestMethod.GET )
	public String cart()
	{
		return "mypage/cart";
	}
	
}
