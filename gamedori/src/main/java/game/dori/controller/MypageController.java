package game.dori.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import game.dori.service.MemberService;
import game.dori.service.MypageService;
import game.dori.vo.MEMBER_VO;
import game.dori.vo.PRODUCT_Q_VO;
import game.dori.vo.QA_VO;

@RequestMapping( value = "/mypage" )
@Controller
public class MypageController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MypageService mypageService;
	
	
	// 마이페이지 첫화면
	@RequestMapping( value = "/main", method = RequestMethod.GET )
	public String main()
	{
		return "mypage/main";
	}
	
	// 1:1 문의 리스트 출력
	@RequestMapping( value = "/oto.do", method = RequestMethod.GET )
	public String oto(Model model, HttpServletRequest req)
	{
		HttpSession session = req.getSession();
		MEMBER_VO MEMBERVO = (MEMBER_VO)session.getAttribute("Login");
		
		List<QA_VO> selectList2 = mypageService.selectList2(MEMBERVO.getMember_idx() );
		model.addAttribute("selectList2", selectList2);
		
		return "mypage/oto";
	}

	// 상품 문의 리스트 출력
	@RequestMapping( value = "/prodqa.do", method = RequestMethod.GET )
	public String prodqa(Model model,HttpServletRequest req)
	{	
		HttpSession session = req.getSession();
		MEMBER_VO MEMBERVO = (MEMBER_VO)session.getAttribute("Login");
		
		List<PRODUCT_Q_VO> selectList = mypageService.selectList(MEMBERVO.getMember_idx() );
		model.addAttribute("selectList", selectList);
		
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

	// 리뷰
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
