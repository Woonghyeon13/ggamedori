package game.dori.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import game.dori.service.MemberService;
import game.dori.service.MypageService;
import game.dori.vo.CARTP_VO;
import game.dori.vo.CART_VO;
import game.dori.vo.COUPON_VO;
import game.dori.vo.MEMBER_VO;
import game.dori.vo.ORDER_VO;
import game.dori.vo.PRODUCTQQ_VO;
import game.dori.vo.PRODUCT_Q_VO;
import game.dori.vo.QA_VO;
import game.dori.vo.REVIEW_Search_VO;
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
	public String main(Model model, HttpServletRequest req)
	{
		HttpSession session = req.getSession();
		MEMBER_VO memberVO = (MEMBER_VO)session.getAttribute("Login");
		
		// 로그인이 되어있지 않은 경우
	    if (memberVO == null) {
	        return "redirect:/user/join";
	    }
	    
	    
		//상단 등급출력
	    int selectMemberLevel = mypageService.selectMemberLevelService(memberVO.getMember_idx());
		model.addAttribute("level", selectMemberLevel);

		
		//상단 적립금
		int selectPointBalance = mypageService.selectPointBalanceService(memberVO.getMember_idx());
		model.addAttribute("PointBalance", selectPointBalance);
			
		//상단 쿠폰개수출력
		int selectListCount = mypageService.selectListCount(memberVO.getMember_idx());
		model.addAttribute("selectListCount", selectListCount);
			    
		//상단 후기 개수
		/*
		 * int selectListCount2 =
		 * mypageService.selectListCount2(memberVO.getMember_idx());
		 * model.addAttribute("selectListCount2", selectListCount2);
		 */
			  		
			    
		//최근주문내역
		List<ORDER_VO> selectOrderList = 
		mypageService.selectOrderListService(memberVO.getMember_idx());
		model.addAttribute("list", selectOrderList);
		
		//상품문의내역
		List<PRODUCTQQ_VO> selectList = mypageService.selectList(memberVO.getMember_idx() );
		model.addAttribute("selectList", selectList);
		
		//1:1문의내역
		List<QA_VO> selectList2 = mypageService.selectList2(memberVO.getMember_idx() );
		model.addAttribute("selectList2", selectList2);
		
		//나의후기
		
		
	    
		return "mypage/main";
		
		
		
	}
	
	// 1:1 문의 리스트 출력
	@RequestMapping( value = "/oto.do", method = RequestMethod.GET )
	public String oto(Model model, HttpServletRequest req)
	{
		HttpSession session = req.getSession();
		MEMBER_VO memberVO = (MEMBER_VO)session.getAttribute("Login");
		
		//상단 등급출력
	    int selectMemberLevel = mypageService.selectMemberLevelService(memberVO.getMember_idx());
		model.addAttribute("level", selectMemberLevel);

		
		//상단 적립금
		int selectPointBalance = mypageService.selectPointBalanceService(memberVO.getMember_idx());
		model.addAttribute("PointBalance", selectPointBalance);
			
		//상단 쿠폰개수출력
		int selectListCount = mypageService.selectListCount(memberVO.getMember_idx());
		model.addAttribute("selectListCount", selectListCount);
			    
		//상단 후기 개수
		int selectListCount2 = mypageService.selectListCount2(memberVO.getMember_idx());
		model.addAttribute("selectListCount2", selectListCount2);
		
		//마이페이지-상세페이지-1:1문의리스트 출력
		List<QA_VO> selectList2 = mypageService.selectList2(memberVO.getMember_idx() );
		model.addAttribute("selectList2", selectList2);
		
		return "mypage/oto";
	}

	// 상품 문의 리스트 출력
	@RequestMapping( value = "/prodqa.do", method = RequestMethod.GET )
	public String prodqa(Model model,HttpServletRequest req)
	{	
		HttpSession session = req.getSession();
		MEMBER_VO memberVO = (MEMBER_VO)session.getAttribute("Login");
		
		//상단 등급출력
	    int selectMemberLevel = mypageService.selectMemberLevelService(memberVO.getMember_idx());
		model.addAttribute("level", selectMemberLevel);

		//상단 적립금
		int selectPointBalance = mypageService.selectPointBalanceService(memberVO.getMember_idx());
		model.addAttribute("PointBalance", selectPointBalance);
			
		//상단 쿠폰개수출력
		int selectListCount = mypageService.selectListCount(memberVO.getMember_idx());
		model.addAttribute("selectListCount", selectListCount);
			    
		//상단 후기 개수
		int selectListCount2 = mypageService.selectListCount2(memberVO.getMember_idx());
		model.addAttribute("selectListCount2", selectListCount2);
		
		//마이페이지-상세페이지-상품문의 리스트 
		List<PRODUCTQQ_VO> selectList = mypageService.selectList(memberVO.getMember_idx() );
		model.addAttribute("selectList", selectList);
		
		return "mypage/prodqa";
	}
	
	// 주문목록 
	@RequestMapping( value = "/prodlist", method = RequestMethod.GET )
	public String prodlist(HttpServletRequest req, Model model)
	{

		HttpSession session = req.getSession();
		MEMBER_VO memberVO = (MEMBER_VO)session.getAttribute("Login");
		
		//상단 등급출력
	    int selectMemberLevel = mypageService.selectMemberLevelService(memberVO.getMember_idx());
		model.addAttribute("level", selectMemberLevel);

		
		//상단 적립금
		int selectPointBalance = mypageService.selectPointBalanceService(memberVO.getMember_idx());
		model.addAttribute("PointBalance", selectPointBalance);
			
		//상단 쿠폰개수출력
		int selectListCount = mypageService.selectListCount(memberVO.getMember_idx());
		model.addAttribute("selectListCount", selectListCount);
			    
		//상단 후기 개수
		int selectListCount2 = mypageService.selectListCount2(memberVO.getMember_idx());
		model.addAttribute("selectListCount2", selectListCount2);
		
		
		//마에피이지-상세페이지-주문목록리스트출력
		List<ORDER_VO> selectOrderList = 
				mypageService.selectOrderListService(memberVO.getMember_idx());
				model.addAttribute("list", selectOrderList);
				
		return "mypage/prodlist";
	}

	// 주문상세
	@RequestMapping( value = "/orderdetail", method = RequestMethod.GET )
	public String orderdetail(Model model, HttpServletRequest req)
	{
		HttpSession session = req.getSession();
		MEMBER_VO memberVO = (MEMBER_VO)session.getAttribute("Login");
		
		
		
		return "mypage/orderdetail";
	}

	// 적립금 리스트 출력
	@RequestMapping( value = "/point.do", method = RequestMethod.GET )
	public String point(Model model,HttpServletRequest req)
	{
		HttpSession session = req.getSession();
		MEMBER_VO memberVO = (MEMBER_VO)session.getAttribute("Login");
		
		//상단 등급출력
	    int selectMemberLevel = mypageService.selectMemberLevelService(memberVO.getMember_idx());
		model.addAttribute("level", selectMemberLevel);

		//상단 적립금
		int selectPointBalance = mypageService.selectPointBalanceService(memberVO.getMember_idx());
		model.addAttribute("PointBalance", selectPointBalance);
			
		//상단 쿠폰개수출력
		int selectListCount = mypageService.selectListCount(memberVO.getMember_idx());
		model.addAttribute("selectListCount", selectListCount);
			    
		//상단 후기 개수
		int selectListCount2 = mypageService.selectListCount2(memberVO.getMember_idx());
		model.addAttribute("selectListCount2", selectListCount2);
		
		List<SAVEPOINT_VO> selectList4 = mypageService.selectList4(memberVO.getMember_idx() );
		model.addAttribute("selectList4", selectList4);
		
		return "mypage/point";
	}
	
	

	// 상품후기 리스트 출력
	@RequestMapping( value = "/reviewlist.do", method = RequestMethod.GET )
	public String reviewlist(Model model,HttpServletRequest req)
	{
		HttpSession session = req.getSession();
		MEMBER_VO memberVO = (MEMBER_VO)session.getAttribute("Login");
		
		//상단 등급출력
	    int selectMemberLevel = mypageService.selectMemberLevelService(memberVO.getMember_idx());
		model.addAttribute("level", selectMemberLevel);

		//상단 적립금
		int selectPointBalance = mypageService.selectPointBalanceService(memberVO.getMember_idx());
		model.addAttribute("PointBalance", selectPointBalance);
			
		//상단 쿠폰개수출력
		int selectListCount = mypageService.selectListCount(memberVO.getMember_idx());
		model.addAttribute("selectListCount", selectListCount);
			    
		//상단 후기 개수
		int selectListCount2 = mypageService.selectListCount2(memberVO.getMember_idx());
		model.addAttribute("selectListCount2", selectListCount2);
		

		//검색 포함
		List<REVIEW_VO> selectList3 = mypageService.selectList3(memberVO.getMember_idx());

		model.addAttribute("selectList3", selectList3);

		//후기 개수
		int selectListCount10 = mypageService.selectListCount2(memberVO.getMember_idx());
	    model.addAttribute("selectListCount2", selectListCount10);
		
		return "mypage/reviewlist";
	}
	
	@RequestMapping(value="/test.do")
	@ResponseBody
	public String test() {
		return "test";
	}
	
	//검색 기능(복붙)
	@RequestMapping(value = "/search.do", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> searchReview(@RequestParam("R_searchValue") String R_searchValue,
	                                                        @RequestParam("R_searchType") String R_searchType,
	                                                        @RequestParam(value = "page", defaultValue = "1") int page) {
	    int limit = 15; // 페이지당 게시물 수
	    int start = (page - 1) * limit;

	    List<REVIEW_VO> searchResults = mypageService.searchReview(R_searchValue, R_searchType, start, limit);
	    int totalRecords =  mypageService.countSearchResults(R_searchValue, R_searchType);
	    int totalPages = (int) Math.ceil((double) totalRecords / limit);

	    Map<String, Object> responseMap = new HashMap<String, Object>();
	    responseMap.put("searchResults", searchResults);
	    responseMap.put("totalPages", totalPages);

	    return new ResponseEntity<Map<String, Object>>(responseMap, HttpStatus.OK);
	}
	

	// 쿠폰 리스트 출력
	@RequestMapping( value = "/coupon.do", method = RequestMethod.GET )
	public String coupon(Model model,HttpServletRequest req)
	{
		HttpSession session = req.getSession();
		MEMBER_VO memberVO = (MEMBER_VO)session.getAttribute("Login");
		
		//상단 등급출력
	    int selectMemberLevel = mypageService.selectMemberLevelService(memberVO.getMember_idx());
		model.addAttribute("level", selectMemberLevel);

		//상단 적립금
		int selectPointBalance = mypageService.selectPointBalanceService(memberVO.getMember_idx());
		model.addAttribute("PointBalance", selectPointBalance);
			
		//상단 쿠폰개수출력
		int selectListCount = mypageService.selectListCount(memberVO.getMember_idx());
		model.addAttribute("selectListCount", selectListCount);
			    
		//상단 후기 개수
		int selectListCount2 = mypageService.selectListCount2(memberVO.getMember_idx());
		model.addAttribute("selectListCount2", selectListCount2);
		
		//리스트 조회

		List<COUPON_VO> selectList5 = mypageService.selectList5(memberVO.getMember_idx() );
		model.addAttribute("selectList5", selectList5);
		
		
		//쿠폰 개수
		int selectListCount11 = mypageService.selectListCount(memberVO.getMember_idx());
	    model.addAttribute("selectListCount", selectListCount11);
		return "mypage/coupon";
	}

	//찜목록
	@RequestMapping( value = "/wishlist", method = RequestMethod.GET )
	public String wishlist()
	{
		return "mypage/wishlist";
	}
	
	//장바구니
	@RequestMapping( value = "/cart.do", method = RequestMethod.GET )
	public ModelAndView cart(ModelAndView model, HttpServletRequest req)
	{	
		HttpSession session = req.getSession();
		MEMBER_VO memberVO = (MEMBER_VO)session.getAttribute("Login");
		
		//VO객체에 담긴값이 널j이면 경고창 출력 
		if(memberVO == null ) {
			model.addObject("message", "회원가입 후 이용해주세요");
			model.setViewName("mypage/cart");
		}else {
		//vo객체에 담긴값이 널이아니면 model에 서비스메서드를통한 정보 입력

			System.out.println(memberVO.getMember_idx());
			List<CARTP_VO> selectCartList = mypageService.selectCartListService(memberVO.getMember_idx());
			model.addObject("CartList", selectCartList);
			model.setViewName("mypage/cart");
			
		}
			
			
		return model;
	}
	
}
