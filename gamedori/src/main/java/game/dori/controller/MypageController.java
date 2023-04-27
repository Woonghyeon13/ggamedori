package game.dori.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
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

import game.dori.service.MemberService;
import game.dori.service.MypageService;
import game.dori.service.ProductService;
import game.dori.util.ORDER_LIST_VO;
import game.dori.vo.CARTP_VO;
import game.dori.vo.CART_VO;
import game.dori.vo.COUPON_VO;
import game.dori.vo.MEMBER_VO;
import game.dori.vo.OPT_VO;
import game.dori.vo.ORDER_VO;
import game.dori.vo.PRODUCTQQ_VO;
import game.dori.vo.PRODUCT_Q_VO;
import game.dori.vo.PRODUCT_VO;
import game.dori.vo.QA_VO;
import game.dori.vo.REVIEW_VO;
import game.dori.vo.SAVEPOINT_VO;

@RequestMapping( value = "/mypage" )
@Controller
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ProductService productService;
	
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

		
		 //상단 등급출력 
	     int selectMemberLevel =
		 mypageService.selectMemberLevelService(memberVO.getMember_idx());
		 model.addAttribute("level", selectMemberLevel);
		 
		 //상단 적립금 
		 int selectPointBalance =
		 mypageService.selectPointBalanceService(memberVO.getMember_idx()); 
		 model.addAttribute("PointBalance", selectPointBalance);
		 
		 //상단 쿠폰개수출력 
		 int CouponCount =
		 mypageService.CouponCount(memberVO.getMember_idx());
		 model.addAttribute("CouponCount", CouponCount);
		 
		 //상단 후기 개수 
		 int ReviewCount =
		 mypageService.ReviewCount(memberVO.getMember_idx());
		 model.addAttribute("ReviewCount", ReviewCount);
		
		

		// 최근주문내역
		List<ORDER_VO> selectOrderList = 
		mypageService.selectOrderListService(memberVO.getMember_idx());
		model.addAttribute("Orderlist", selectOrderList);
		
		// 상품문의내역
		List<PRODUCTQQ_VO> selectQAList = mypageService.selectQAList(memberVO.getMember_idx() );
		model.addAttribute("selectQAList", selectQAList);
		
		// 1 : 1 문의 내역
		List<QA_VO> selectOtoList = mypageService.selectOtoList(memberVO.getMember_idx());
		model.addAttribute("selectOtoList", selectOtoList);
		
		// 1 : 1 문의 내역 역순
		List<QA_VO> selectOtoListD = mypageService.selectOtoListD(memberVO.getMember_idx());
		model.addAttribute("selectOtoListD",selectOtoListD);
		
		// 나의후기
		List<REVIEW_VO> selectReviewList = mypageService.selectReviewList(memberVO.getMember_idx());
		model.addAttribute("selectReviewList", selectReviewList);
		
		
	    
		return "mypage/main";
		
	}


			
	
	/*-------------------------------------------------------------------------------*/

	
	// 상품 문의사항 리스트 + 페이징
	@RequestMapping(value = "/prodqa.do", method = RequestMethod.GET)
	public String prodqa(Model model,  HttpServletRequest req,
						@RequestParam(value = "page", defaultValue = "1") int page,
						@RequestParam(value = "searchText", required = false) String searchText,
						@RequestParam(value = "searchOption", required = false) String searchOption) throws Exception 
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
		
	    int limit = 15; // 페이지당 게시물 수
	    int start = (page - 1) * limit;

	    List<PRODUCT_Q_VO> prod_List;
	    int totalRecords;

	    if (searchText != null && searchOption != null) {
	    	prod_List = mypageService.prod_search(searchText, searchOption, start, limit);
	    	totalRecords = mypageService.prod_countSearchResults(searchText, searchOption);
	    } else {
	    	prod_List = mypageService.prod_list(limit, start);
	    	totalRecords = mypageService.prod_countAll();
	    }

	    model.addAttribute("product", prod_List);

	    int totalPages = (int) Math.ceil((double)	totalRecords / limit);
	    model.addAttribute("totalPages", totalPages);

	    return "mypage/prodqa";
	}
	
 	// 상품 문의사항 검색 기능
	@RequestMapping(value = "/prod_search.do", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> prod_search(@RequestParam("searchText") String searchText,
	                                                        @RequestParam("searchOption") String searchOption,
	                                                        @RequestParam(value = "page", defaultValue = "1") int page) {
	  int limit = 15; // 페이지당 게시물 수
	  int start = (page - 1) * limit;

	  List<PRODUCT_Q_VO> prod_searchResults = mypageService.prod_search(searchText, searchOption, start, limit);
	  int totalResults = mypageService.prod_countSearchResults(searchText, searchOption); // 전체 검색 결과 수
	  int totalPages = (int) Math.ceil((double) totalResults / limit); // 전체 페이지 수 계산	  
	  
	  System.out.println(totalResults);

	  Map<String, Object> response = new HashMap<String, Object>();
	  response.put("prod_searchResults", prod_searchResults);
	  response.put("totalPages", totalPages);

	  return new ResponseEntity<Map<String, Object>>(response, HttpStatus.OK);
	}
	
	
	// 상품 문의사항 상세보기
	@RequestMapping( value = "/prdo_q_view.do", method = RequestMethod.GET )
	public String view(Model model, @RequestParam("prod_q_idx") int prod_q_idx)
	{
		PRODUCT_Q_VO product_Q_VO = mypageService.prod_select(prod_q_idx);
		model.addAttribute("product_Q_VO", product_Q_VO);

		return "mypage/prod_q_view";
	}
	
	/*-------------------------------------------------------------------------------*/
	
	// 1 : 1 문의사항 리스트 + 페이징
	@RequestMapping(value = "/oto.do", method = RequestMethod.GET)
	public String oto(Model model, HttpServletRequest req,
					@RequestParam(value = "page", defaultValue = "1") int page,
					@RequestParam(value = "searchText", required = false) String searchText,
					@RequestParam(value = "searchOption", required = false) String searchOption) throws Exception 
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
		
	    int limit = 15; // 페이지당 게시물 수
	    int start = (page - 1) * limit;

	    List<QA_VO> oto_List;
	    int totalRecords;

	    if (searchText != null && searchOption != null) {
	    	oto_List = mypageService.oto_search(searchText, searchOption, start, limit);
	    	totalRecords = mypageService.countSearchResults(searchText, searchOption);
	    } else {
	    	oto_List = mypageService.oto_list(limit, start);
	    	totalRecords = mypageService.oto_countAll();
	    }
	    
	    model.addAttribute("oto", oto_List);

	    int totalPages = (int) Math.ceil((double) totalRecords / limit);
	    model.addAttribute("totalPages", totalPages);

	    return "mypage/oto";

	}
			
	// 1 : 1 문의사항 검색 기능
	@RequestMapping(value = "/oto_search.do", method = RequestMethod.GET)
	@ResponseBody
		public ResponseEntity<Map<String, Object>> oto_search(@RequestParam("searchText") String searchText,
                @RequestParam("searchOption") String searchOption,
                @RequestParam(value = "page", defaultValue = "1") int page) {
	    int limit = 15; // 페이지당 게시물 수
	    int start = (page - 1) * limit;

	    List<QA_VO> searchResults = mypageService.oto_search(searchText, searchOption, start, limit);
	    
	    int totalResults = 0;
	    
	    if (searchText.trim().equals("") && searchOption.trim().equals("")) {
	        totalResults = mypageService.oto_countAll(); // 전체 게시물 수
	    } else {
	        totalResults = mypageService.oto_countSearchResults(searchText, searchOption); // 검색 결과에 따른 전체 게시물 수
	    }
	    int totalPages = (int) Math.ceil((double) totalResults / limit); // 전체 페이지 수 계산

	    Map<String, Object> response = new HashMap<String, Object>();
	    response.put("searchResults", searchResults);
	    response.put("totalPages", totalPages);

	    return new ResponseEntity<Map<String, Object>>(response, HttpStatus.OK);
	} 
	
	
		
	
	// 1 : 1 문의 사항 글 등록
	@RequestMapping(value = "/oto_write.do", method = RequestMethod.GET)
	public String oto_write() {
		
		return "mypage/oto_write";
	}
	
	@RequestMapping(value = "/oto_write.do", method = RequestMethod.POST)
	public void oto_write(@ModelAttribute QA_VO qaVO, HttpServletResponse rsp, String member_email, HttpServletRequest req, HttpSession session) throws Exception {
		
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
			pw.append("<script>alert('문의사항이 등록되었습니다.'); location.href='" + req.getContextPath()
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
	        pw.append("<script>alert('1 : 1 문의사항이 삭제되었습니다.'); location.href='" + req.getContextPath()
	            + "/mypage/oto.do';</script>");
	    } else {
	        pw.append("<script>alert('1 : 1 문의사항이 삭제되지 않았습니다.'); location.href='" + req.getContextPath()
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
	
	// 주문 환불
	@RequestMapping( value = "/UpdateOrderStatus.do", method = RequestMethod.GET)
	public String UpdateOrderStatus(HttpServletRequest req, Model model)
	{
		
		
		return "mypage/prodlist";
	}
	
	

	// 주문상세
	@RequestMapping( value = "/orderdetail.do", method = RequestMethod.GET )
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
		
		//누적 적립금
		int selectPointAmount = mypageService.selectPointBal(memberVO.getMember_idx());
		model.addAttribute("selectPointAmount", selectPointAmount);
		
		//리스트
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
		

		//리스트 출력
		List<REVIEW_VO> selectReviewList = mypageService.selectReviewList(memberVO.getMember_idx());
		model.addAttribute("selectReviewList", selectReviewList);

		
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


	
	//장바구니
	@RequestMapping( value = "/cart.do", method = RequestMethod.GET )
	public String cart( Model model, HttpServletRequest req)
	{	
		HttpSession session = req.getSession();
		MEMBER_VO memberVO = (MEMBER_VO)session.getAttribute("Login");
		List<CART_VO> selectCartList = mypageService.selectCartListService(memberVO.getMember_idx());
		List<CARTP_VO> cartList = new ArrayList<CARTP_VO>();
		for( int i = 0; i<selectCartList.size(); i++) {
			CARTP_VO cartpvo = new CARTP_VO();
			cartpvo.setCart_amount(selectCartList.get(i).getCart_amount());
			cartpvo.setCart_idx(selectCartList.get(i).getCart_idx());
			cartpvo.setCart_yn(selectCartList.get(i).getCart_yn());
			int opt_tb_idx = Integer.parseInt(selectCartList.get(i).getOpt_tb_idx());
			OPT_VO optvo = productService.optSelectOne(opt_tb_idx);
			cartpvo.setOpt_idx(optvo.getOpt_idx());
			cartpvo.setOpt_name(optvo.getOpt_name());
			cartpvo.setOpt_price(optvo.getOpt_price());
			PRODUCT_VO pvo = productService.prodSelectOne(optvo.getProd_tb_idx());
			cartpvo.setProd_imgt(pvo.getProd_imgt());
			cartpvo.setProd_idx(pvo.getProd_idx());
			cartpvo.setProd_name(pvo.getProd_name());
			List<OPT_VO> opts = productService.optSelect(optvo.getProd_tb_idx());
			cartpvo.setOptlist(opts);
			
			cartList.add(cartpvo);
		}
		model.addAttribute("cartList",cartList);
		return "mypage/cart";
	}
	//장바구니 넣기
	@ResponseBody
	@RequestMapping( value = "/cartInsert.do", method = RequestMethod.POST )
	public void cartInsert( CART_VO cvo )
	{	
		String optIdx = cvo.getOpt_tb_idx();
		String[] optIdxSplit = optIdx.split(",");
		String cartQty = cvo.getCart_amount();
		String[] cartQtySplit = cartQty.split(",");
		
		for( int i = 0; i < optIdxSplit.length; i++ ) {
			cvo.setCart_amount(cartQtySplit[i]);
			cvo.setOpt_tb_idx(optIdxSplit[i]);
			cvo.setMember_tb_idx(cvo.getMember_tb_idx());
			mypageService.insertCart(cvo);
		}
	}
	
	// 장바구니 삭제
	@ResponseBody
	@RequestMapping( value = "cartDel.do", method = RequestMethod.POST )
	public void cartDel( CART_VO cvo ){
		String cartIdx = cvo.getCart_idx();
		String[] cartIdxSplit = cartIdx.split(",");
		
		
		for( int i = 0; i < cartIdx.length(); i++) {
			mypageService.cartDel(Integer.parseInt(cartIdxSplit[i]));
		}
	}
	
	// 장바구니 옵션 수정
	@ResponseBody
	@RequestMapping( value = "cartModify.do", method = RequestMethod.POST)
	public void cartModify( CART_VO cvo ) {
		mypageService.cartModify(cvo);
	}
	
	// 장바구니 주문담기
	@RequestMapping( value = "orderForm.do", method = RequestMethod.GET)
	public String cartOrder( ORDER_LIST_VO olvo, Model model ) {
		
		
		return "";
	}
}
