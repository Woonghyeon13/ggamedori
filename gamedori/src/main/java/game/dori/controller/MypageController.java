package game.dori.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
//github.com/Gunyoung2/ggamedori.git
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import game.dori.service.MemberService;
import game.dori.service.MypageService;
import game.dori.vo.CARTP_VO;
import game.dori.vo.COUPON_VO;
//github.com/Gunyoung2/ggamedori.git
import game.dori.vo.MEMBER_VO;
import game.dori.vo.ORDER_VO;
import game.dori.vo.PRODUCTQQ_VO;
import game.dori.vo.QA_VO;
import game.dori.vo.REVIEW_VO;
import game.dori.vo.SAVEPOINT_VO;
import game.dori.vo.WISHLIST_VO;

@RequestMapping( value = "/mypage" )
@Controller
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private MemberService memberService;
	
	
	
	// 마이페이지 첫화면
	@RequestMapping( value = "/main.do", method = RequestMethod.GET )
	public String main(Model model, HttpServletRequest req)
	{
		HttpSession session = req.getSession();
		MEMBER_VO memberVO = (MEMBER_VO)session.getAttribute("Login");
		
		// 로그인이 되어있지 않은 경우
	    if (memberVO == null) {
	        return "redirect:/user/join";
	    }

		/*
		 * //상단 등급출력 int selectMemberLevel =
		 * mypageService.selectMemberLevelService(memberVO.getMember_idx());
		 * model.addAttribute("level", selectMemberLevel);
		 * 
		 * //상단 적립금 int selectPointBalance =
		 * mypageService.selectPointBalanceService(memberVO.getMember_idx());
		 * model.addAttribute("PointBalance", selectPointBalance);
		 * 
		 * //상단 쿠폰개수출력 int CouponCount =
		 * mypageService.CouponCount(memberVO.getMember_idx());
		 * model.addAttribute("CouponCount", CouponCount);
		 * 
		 * //상단 후기 개수 int ReviewCount =
		 * mypageService.ReviewCount(memberVO.getMember_idx());
		 * model.addAttribute("ReviewCount", ReviewCount);
		 */
		

		//상단 적립금
		int selectPointBalance = mypageService.selectPointBalanceService(memberVO.getMember_idx());
		model.addAttribute("PointBalance", selectPointBalance);
			
		//상단 쿠폰개수출력
		int CouponCount = mypageService.CouponCount(memberVO.getMember_idx());
		model.addAttribute("CouponCount", CouponCount);
			    
		//상단 후기 개수
		/*
		 * int ReviewCount =
		 * mypageService.ReviewCount(memberVO.getMember_idx());
		 * model.addAttribute("ReviewCount", ReviewCount);
		 */
			  		

			    
		//최근주문내역
		List<ORDER_VO> selectOrderList = 
		mypageService.selectOrderListService(memberVO.getMember_idx());
		model.addAttribute("Orderlist", selectOrderList);
		
		//상품문의내역
		List<PRODUCTQQ_VO> selectQAList = mypageService.selectQAList(memberVO.getMember_idx() );
		model.addAttribute("selectQAList", selectQAList);
		
		//1:1문의내역
		List<QA_VO> selectOtoList = mypageService.selectOtoList(memberVO.getMember_idx() );
		model.addAttribute("selectOtoList", selectOtoList);
		
		//나의후기
		
		
	    
		return "mypage/main";
		
	}

	// 마이페이지 1 : 1 문의사항 리스트 출력
	@RequestMapping( value = "/main.do", method = RequestMethod.GET )
	public String main_oto(Model model, HttpServletRequest req)
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
		int CouponCount = mypageService.CouponCount(memberVO.getMember_idx());
		model.addAttribute("CouponCount", CouponCount);
			    
		//상단 후기 개수
		int ReviewCount = mypageService.ReviewCount(memberVO.getMember_idx());
		model.addAttribute("ReviewCount", ReviewCount);
		
		//마이페이지-상세페이지-1:1문의리스트 출력
		List<QA_VO> selectOtoList = mypageService.selectOtoList(memberVO.getMember_idx() );
		model.addAttribute("selectOtoList", selectOtoList);
		
		return "mypage/main";
	}
	
//	// 1 : 1 문의 사항 페이징
//	@RequestMapping(value = "/main.do" , method = RequestMethod.GET)
//	public String oto_list(Model model, @RequestParam(value = "oto_page", defaultValue = "1") int oto_page,
//			@RequestParam(value = "oto_searchText", required = false) String oto_searchText,
//			@RequestParam(value = "oto_searchOption", required = false) String oto_searchOption) throws Exception 
//	{
//		int oto_limit = 15;		// 페이지 당 게시물 수
//		int oto_start = (oto_page - 1) * oto_limit;
//		
//		List<QA_VO> oto_LIst;
//		int oto_totalRecords;
//		
//		if (oto_searchText != null && oto_searchOption != null) {
//			oto_LIst = adminService.searchNotices(oto_searchText, oto_searchOption, oto_start, oto_limit);
//	        oto_totalRecords = adminService.countSearchResults(oto_searchText, oto_searchOption);
//	    } else {
//	    	oto_LIst = adminService.list(oto_limit, oto_start);
//	        oto_totalRecords = adminService.countAll();
//	    }
//
//		
//		return "mypage/oto";
//	}
			
	
	/*-------------------------------------------------------------------------------*/

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
		int CouponCount = mypageService.CouponCount(memberVO.getMember_idx());
		model.addAttribute("CouponCount", CouponCount);
			    
		//상단 후기 개수
		int ReviewCount = mypageService.ReviewCount(memberVO.getMember_idx());
		model.addAttribute("ReviewCount", ReviewCount);
		
		//마이페이지-상세페이지-상품문의 리스트 
		List<PRODUCTQQ_VO> selectQAList = mypageService.selectQAList(memberVO.getMember_idx() );
		model.addAttribute("selectQAList", selectQAList);
		
		return "mypage/prodqa";
	}
	
	// 상품  문의 사항 글 등록
	@RequestMapping(value = "/prod_q_write.do", method = RequestMethod.GET)
	public String prod_q_write() {
		
		return "mypage/prod_q_write";
	}
	
	@RequestMapping(value = "/prod_q_write.do", method = RequestMethod.POST)
	public void prod_q_write(@ModelAttribute PRODUCT_Q_VO product_Q_VO,HttpServletResponse rsp, String member_email, HttpServletRequest req, HttpSession session) throws Exception {
		
		MEMBER_VO member = memberService.selectByEmail(member_email);
		
		int result = 0;
		if (member.getMember_role() == 1) {
			product_Q_VO.setMember_tb_idx(member.getMember_idx());
			result = mypageService.prod_insert(product_Q_VO);
			
			System.out.println(product_Q_VO.getMember_tb_idx());
		}
		
		rsp.setContentType("text/html; charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		
		if (result > 0) {
			session.setAttribute("product_Q_VO", product_Q_VO);
			pw.append("<script>alert('글작성 성공'); location.href='" + req.getContextPath()
			+ "/mypage/prodqa.do';</script>");
		}
		
	}	
	
	
	// 상품문의 상세보기
	@RequestMapping( value = "/prdo_q_view.do", method = RequestMethod.GET )
	public String view(Model model, @RequestParam("prod_q_idx") int prod_q_idx)
	{
		PRODUCT_Q_VO product_Q_VO = mypageService.prod_select(prod_q_idx);

		return "mypage/prod_q_view";
	}
	
	/*-------------------------------------------------------------------------------*/
	
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
	
	// 1 : 1 문의 사항 글 등록
	@RequestMapping(value = "/oto_write.do", method = RequestMethod.GET)
	public String oto_write() {
		
		return "mypage/oto_write";
	}
	
	@RequestMapping(value = "/oto_write.do", method = RequestMethod.POST)
	public void oto_write(@ModelAttribute QA_VO qaVO,HttpServletResponse rsp, String member_email, HttpServletRequest req, HttpSession session) throws Exception {
		
		MEMBER_VO member = memberService.selectByEmail(member_email);
		
		int result = 0;
		if (member.getMember_role() == 1) {
			qaVO.setMember_tb_idx(member.getMember_idx());
			result = mypageService.oto_insert(qaVO);
			
			System.out.println(qaVO.getMember_tb_idx());
		}
		
		rsp.setContentType("text/html; charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		
		if (result > 0) {
			session.setAttribute("qaVO", qaVO);
			pw.append("<script>alert('글작성 성공'); location.href='" + req.getContextPath()
			+ "/mypage/oto.do';</script>");
		}
		
	}
	
	// 1 : 1 문의사항 글 삭제
	@RequestMapping(value = "/oto_delete.do", method = RequestMethod.GET)
	public void oto_delete(@RequestParam("qa_idx") int qa_idx, HttpServletResponse rsp, HttpServletRequest req) throws IOException {
	    
	    System.out.println(qa_idx);
	    
	    HttpSession session = req.getSession();
	    session.setAttribute("qa_idx", qa_idx); // qa_idx 값을 세션에 저장

	    int result = mypageService.oto_delete(qa_idx);
	    
	    rsp.setContentType("text/html; charset=utf-8");
	    PrintWriter pw = rsp.getWriter();

	    if(result > 0) {
	    	session.setAttribute("qa_idx", qa_idx);
	        pw.append("<script>alert('글 삭제 성공'); location.href='" + req.getContextPath()
	            + "/mypage/oto.do';</script>");
	    } else {
	        pw.append("<script>alert('글 삭제 실패'); location.href='" + req.getContextPath()
	            + "/mypage/oto_view.do?qa_idx=" + qa_idx + "';</script>");
	    }
	}



	// 1 : 1 문의 사항 상세보기
	@RequestMapping( value = "/oto_view.do", method = RequestMethod.GET )
	public String oto_view(Model model,@RequestParam("qa_idx") int qa_Idx)
	{
		QA_VO qaVO = mypageService.oto_select(qa_Idx);
		
		System.out.println(qaVO.getQa_idx());
		System.out.println(qaVO.getQa_title());
		System.out.println(qaVO.getQa_contents());
		
		model.addAttribute("qaVO", qaVO);
		

		return "mypage/oto_view";
	}
	
	/*-------------------------------------------------------------------------------*/
	
	
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
		int CouponCount = mypageService.CouponCount(memberVO.getMember_idx());
		model.addAttribute("CouponCount", CouponCount);
			    
		//상단 후기 개수
		int ReviewCount = mypageService.ReviewCount(memberVO.getMember_idx());
		model.addAttribute("ReviewCount", ReviewCount);
		
		
		//마이페이지-상세페이지-주문목록리스트출력
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
		int CouponCount = mypageService.CouponCount(memberVO.getMember_idx());
		model.addAttribute("CouponCount", CouponCount);
			    
		//상단 후기 개수
		int ReviewCount = mypageService.ReviewCount(memberVO.getMember_idx());
		model.addAttribute("ReviewCount", ReviewCount);
		
		List<SAVEPOINT_VO> selectSavePointList = mypageService.selectSavePointList(memberVO.getMember_idx() );
		model.addAttribute("selectSavePointList", selectSavePointList);
		
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
		int CouponCount = mypageService.CouponCount(memberVO.getMember_idx());
		model.addAttribute("CouponCount", CouponCount);
			    
		//상단 후기 개수
		int ReviewCount = mypageService.ReviewCount(memberVO.getMember_idx());
		model.addAttribute("ReviewCount", ReviewCount);
		

		//검색 포함

		List<REVIEW_VO> selectReviewList = mypageService.selectReviewList(memberVO.getMember_idx());


		model.addAttribute("selectReviewList", selectReviewList);

		//후기 개수
		int ReviewCount2 = mypageService.ReviewCount(memberVO.getMember_idx());
	    model.addAttribute("ReviewCount", ReviewCount2);
		
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
	


//	// 쿠폰 리스트 출력
//	@RequestMapping( value = "/coupon.do", method = RequestMethod.GET )
//	public String coupon(Model model,HttpServletRequest req)
//	{
//		HttpSession session = req.getSession();
//		MEMBER_VO MEMBERVO = (MEMBER_VO)session.getAttribute("Login");
//		
//		//리스트 조회
//		List<COUPON_VO> selectList5 = mypageService.selectList5(MEMBERVO.getMember_idx() );
//		model.addAttribute("selectList5", selectList5);
//		
//		
//		//쿠폰 개수
//		int selectListCount = mypageService.selectListCount(MEMBERVO.getMember_idx());
//	    model.addAttribute("selectListCount", selectListCount);
//		
//		return "mypage/coupon";
//	}

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
		int CouponCount = mypageService.CouponCount(memberVO.getMember_idx());
		model.addAttribute("CouponCount", CouponCount);
			    
		//상단 후기 개수
		int ReviewCount = mypageService.ReviewCount(memberVO.getMember_idx());
		model.addAttribute("ReviewCount", ReviewCount);
		
		//리스트 조회

		List<COUPON_VO> selectCouponList = mypageService.selectCouponList(memberVO.getMember_idx() );
		model.addAttribute("selectCouponList", selectCouponList);
		
		
		//쿠폰 개수
		int  CouponCount2 = mypageService.CouponCount(memberVO.getMember_idx());
	    model.addAttribute("CouponCount2", CouponCount2);
		return "mypage/coupon";
	}


	//찜목록 
	@RequestMapping( value = "/wishlist.do", method = RequestMethod.GET )
	public ModelAndView wishlist(ModelAndView model, HttpServletRequest req)
	{
		HttpSession session = req.getSession();
		MEMBER_VO MEMBERVO = (MEMBER_VO)session.getAttribute("Login");
		
		//VO객체에 담긴값이 널이면 경고창 출력 
		if(MEMBERVO == null ) {
			model.addObject("message", "회원가입 후 이용해주세요");
			model.setViewName("mypage/wishlist");
		}else {
			//리스트 조회
			List<WISHLIST_VO> selectWishlist = mypageService.selectWishlist(MEMBERVO.getMember_idx() );
			model.addObject("selectWishlist", selectWishlist);
			model.setViewName("mypage/wishlist");
		}
		
		return model;
	}
	
	//찜목록 > 장바구니
	@ResponseBody
	@RequestMapping( value = "/addCart.do", method = RequestMethod.POST)
	public int addCart(CART_VO cart, HttpSession session) throws Exception{
	
		int result = 0;
		
		MEMBER_VO memberVO = (MEMBER_VO)session.getAttribute("Login");
		
		if(memberVO != null) {
			cart.setMember_tb_idx(memberVO.getMember_idx() );
			mypageService.addCart(cart);
			result = 1;
		}
		
		return result;
	}
	
	
	
	//장바구니
	@RequestMapping( value = "/cart.do", method = RequestMethod.GET )
	public ModelAndView cart(ModelAndView model, HttpServletRequest req)
	{	
		HttpSession session = req.getSession();
		MEMBER_VO memberVO = (MEMBER_VO)session.getAttribute("Login");
		
		//VO객체에 담긴값이 널j이면 경고창 출력 
		if(memberVO == null ) {
			model.addObject("message", "로그인 후 이용해주세요");
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
