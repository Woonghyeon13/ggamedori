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
import game.dori.vo.COUPON_VO;
import game.dori.vo.MEMBER_VO;
import game.dori.vo.PRODUCT_Q_VO;
import game.dori.vo.QA_VO;
import game.dori.vo.REVIEW_VO;
import game.dori.vo.SAVEPOINT_VO;

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

	// 적립금 리스트 출력
	@RequestMapping( value = "/point.do", method = RequestMethod.GET )
	public String point(Model model,HttpServletRequest req)
	{
		HttpSession session = req.getSession();
		MEMBER_VO MEMBERVO = (MEMBER_VO)session.getAttribute("Login");
		
		List<SAVEPOINT_VO> selectList4 = mypageService.selectList4(MEMBERVO.getMember_idx() );
		model.addAttribute("selectList4", selectList4);
		
		return "mypage/point";
	}
	
	

	// 상품후기 리스트 출력 **검색 추가해야함
	@RequestMapping( value = "/reviewlist.do", method = RequestMethod.GET )
	public String reviewlist(Model model,HttpServletRequest req)
	{
		HttpSession session = req.getSession();
		MEMBER_VO MEMBERVO = (MEMBER_VO)session.getAttribute("Login");
		
		List<REVIEW_VO> selectList3 = mypageService.selectList3(MEMBERVO.getMember_idx() );
		model.addAttribute("selectList3", selectList3);
		
		//후기 개수
		int selectListCount2 = mypageService.selectListCount2(MEMBERVO.getMember_idx());
	    model.addAttribute("selectListCount2", selectListCount2);
		
		return "mypage/reviewlist";
	}
	

	// 쿠폰 리스트 출력
	@RequestMapping( value = "/coupon.do", method = RequestMethod.GET )
	public String coupon(Model model,HttpServletRequest req)
	{
		HttpSession session = req.getSession();
		MEMBER_VO MEMBERVO = (MEMBER_VO)session.getAttribute("Login");
		
		//리스트 조회
		List<COUPON_VO> selectList5 = mypageService.selectList5(MEMBERVO.getMember_idx() );
		model.addAttribute("selectList5", selectList5);
		
		
		//쿠폰 개수
		int selectListCount = mypageService.selectListCount(MEMBERVO.getMember_idx());
	    model.addAttribute("selectListCount", selectListCount);
		
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
