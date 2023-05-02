package game.dori.controller;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;

import game.dori.service.MemberService;
import game.dori.service.MypageService;
import game.dori.service.ProductService;
import game.dori.util.ORDER_LIST_VO;

import game.dori.util.PRODOPT_VO;
import game.dori.vo.ADDRESS_VO;
import game.dori.vo.CARTP_VO;
import game.dori.vo.CART_VO;
import game.dori.vo.COUPON_VO;
import game.dori.vo.MEMBER_VO;
import game.dori.vo.OPT_VO;
import game.dori.vo.ORDER_DETAIL_VO;
import game.dori.vo.NOTICE_VO;
import game.dori.vo.ORDER_VO;
import game.dori.vo.PAY_VO;
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
		
		


		//최근주문내역
		List<ORDER_VO> selectOrderList = mypageService.selectOrderListService(memberVO.getMember_idx());
		List<ORDER_LIST_VO> orderList5 = new ArrayList<ORDER_LIST_VO>();
		for( int i = 0; i < selectOrderList.size(); i++) {
			ORDER_LIST_VO olvo = new ORDER_LIST_VO();
			olvo.setOrder_date(selectOrderList.get(i).getOrder_date());
			olvo.setOrder_state(selectOrderList.get(i).getOrder_state());
			ORDER_DETAIL_VO odvo = mypageService.orderDetailOne(selectOrderList.get(i).getOrder_idx());
			OPT_VO optvo =productService.optSelectOne(odvo.getOpt_tb_idx());
			PAY_VO payvo = mypageService.selectPayPrice(selectOrderList.get(i).getOrder_idx());
			PRODUCT_VO pvo = productService.prodSelectOne(optvo.getProd_tb_idx());
			olvo.setProd_name(pvo.getProd_name());
			olvo.setProd_imgt(pvo.getProd_imgt());
			olvo.setPay_price_real(payvo.getPay_price_real());
			orderList5.add(olvo);
		}
		model.addAttribute("Orderlist", orderList5);

		// 상품문의내역
		List<PRODUCT_Q_VO> selectQAList = mypageService.selectQAListD(memberVO.getMember_idx() );
		model.addAttribute("selectQAList", selectQAList);
		
//		// 1 : 1 문의 내역
//		List<QA_VO> selectOtoList = mypageService.selectOtoList(memberVO.getMember_idx());
//		model.addAttribute("selectOtoList", selectOtoList);
		
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
		List<PRODUCT_Q_VO> selectQAListD = mypageService.selectQAListD(memberVO.getMember_idx() );
		model.addAttribute("selectQAList", selectQAListD);
		
	    int limit = 15; // 페이지당 게시물 수
	    int start = (page - 1) * limit;

	    List<PRODUCT_Q_VO> prod_List;
	    int totalRecords;

	    if (searchText != null && searchOption != null) {
	    	prod_List = mypageService.prod_search(searchText, searchOption, start, limit);
	    	totalRecords = mypageService.prod_countSearchResults(searchText, searchOption);
	    } else {
	    	prod_List = mypageService.prod_listD(limit, start);
	    	totalRecords = mypageService.prod_countAll();
	    }

	    model.addAttribute("prodqa", prod_List);

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
		List<QA_VO> selectOtoListD = mypageService.selectOtoListD(memberVO.getMember_idx() );
		model.addAttribute("selectOtoListD", selectOtoListD);
		
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
		List<ORDER_VO> selectOrderList = mypageService.selectOrderAllListService(memberVO.getMember_idx());
		List<ORDER_LIST_VO> orderList5 = new ArrayList<ORDER_LIST_VO>();
		for( int i = 0; i < selectOrderList.size(); i++) {
			ORDER_LIST_VO olvo = new ORDER_LIST_VO();
			olvo.setOrder_date(selectOrderList.get(i).getOrder_date());
			olvo.setOrder_state(selectOrderList.get(i).getOrder_state());
			ORDER_DETAIL_VO odvo = mypageService.orderDetailOne(selectOrderList.get(i).getOrder_idx());
			OPT_VO optvo =productService.optSelectOne(odvo.getOpt_tb_idx());
			PAY_VO payvo = mypageService.selectPayPrice(selectOrderList.get(i).getOrder_idx());
			PRODUCT_VO pvo = productService.prodSelectOne(optvo.getProd_tb_idx());
			olvo.setProd_name(pvo.getProd_name());
			olvo.setProd_imgt(pvo.getProd_imgt());
			olvo.setProd_idx(pvo.getProd_idx());
			olvo.setPay_price_real(payvo.getPay_price_real());
			olvo.setOrder_idx(selectOrderList.get(i).getOrder_idx());
			orderList5.add(olvo);
		}
		model.addAttribute("list", orderList5);
				
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
		
		for( int i = 0; i < selectCartList.size(); i++) {
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
	public void cartDel( String cart_idx ){
		String cartIdx = cart_idx;
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
	// 장바구니 옵션
	@ResponseBody
	@RequestMapping( value = "cartView.do", method = RequestMethod.POST )
	public CARTP_VO cartView( CARTP_VO cpvo) {
		CARTP_VO cpvovo = mypageService.cartView(cpvo);
		return cpvovo;
	}
	// 장바구니 옵션
	@ResponseBody
	@RequestMapping( value = "cartView2.do", method = RequestMethod.POST )
	public List<OPT_VO> cartView2( CARTP_VO cpvo) {
		List<OPT_VO> opts = productService.optSelect(cpvo.getProd_idx());
		return opts;
	}
	
	// 주문폼
	@RequestMapping( value = "/orderForm.do", method = RequestMethod.GET )
	public String orderForm( String cart_idx , String opt_idx, String opt_qty, PRODOPT_VO povo, MEMBER_VO memberVO ,HttpSession session,  Model model ){
		MEMBER_VO Login = (MEMBER_VO) session.getAttribute("Login");
		MEMBER_VO memvo = productService.orderMem(Login);
		model.addAttribute("memvo",memvo);
		ADDRESS_VO adr = productService.selectMemAddr(memvo);
		model.addAttribute("adr",adr);
		int savePoint = mypageService.selectPointBal(Login.getMember_idx());
		model.addAttribute("savePoint",savePoint);
		
		String optIdx = povo.getOpt_idx();
		String[] optIdxSplit = optIdx.split(",");
		String optQty = povo.getOpt_qty();
		String[] optQtySplit = optQty.split(",");
		String cartIdx = cart_idx;
		String[] cartIdxSplit = cartIdx.split(",");
		List<PRODOPT_VO> optlist = new ArrayList<PRODOPT_VO>();
		for( int i = 0; i<optIdxSplit.length; i++) {
			PRODOPT_VO vovo = productService.prodOptSelect(Integer.parseInt(optIdxSplit[i]));
			vovo.setOpt_qty(optQtySplit[i]);
			vovo.setCart_idx(cartIdxSplit[i]);
			optlist.add(vovo);
		}
		model.addAttribute("optlist",optlist);
		
		return "mypage/orderForm";
	}

	// 주문포스트
	@RequestMapping( value = "/orderForm.do", method = RequestMethod.POST)
	public @ResponseBody String orderForm( ORDER_LIST_VO olvo, HttpServletResponse rsp ){
		
		String optIdx = olvo.getOpt_tb_idx();
		String[] optIdxSplit = optIdx.split(",");
		String ordQty = olvo.getOrderd_qty();
		String[] ordQtySplit = ordQty.split(",");
		String ordPrice = olvo.getOrderd_price();
		String[] ordPriceSplit = ordPrice.split(",");
		int result = productService.insertOrder(olvo);
		
		if(result > 0 ) { 
			int order_tb_idxs = productService.orderNum();
			for( int i = 0; i<optIdxSplit.length; i++) {
				ORDER_DETAIL_VO ordervo = new ORDER_DETAIL_VO();
				ordervo.setOpt_tb_idx(Integer.parseInt(optIdxSplit[i]));
				ordervo.setOrder_tb_idx(order_tb_idxs);
				ordervo.setOrderd_qty(Integer.parseInt(ordQtySplit[i]));
				ordervo.setOrderd_price(Integer.parseInt(ordPriceSplit[i]));
				int insertOrderD = productService.insertOrderDetail(ordervo);
			}
			
			olvo.setOrder_tb_idx(order_tb_idxs);
			int payResult = productService.insertPay(olvo);
			return "success";
		}else {
			return "";
		}
		
	}
	
	// 주문금액 계산
	@ResponseBody
	@RequestMapping( value = "/priceCal.do", method = RequestMethod.GET)
	public int priceCal( int num1, int num2, Model model ) {
		model.addAttribute("priceCalRRR",num2-num1);
		return num2-num1;
	}
	
	// 옵션 재고 감소
	@ResponseBody
	@RequestMapping( value = "/optStockMinus.do", method = RequestMethod.POST)
	public void optStockMinus( PRODOPT_VO povo  ) {
		String ordIdx = povo.getOpt_idx();
		String[] ordIdxSplit = ordIdx.split(",");
		String ordQty = povo.getOpt_qty();
		String[] ordQtySplit = ordQty.split(",");
		
		for( int i=0; i<ordIdxSplit.length; i++) {
			OPT_VO delvo = new OPT_VO();
			delvo.setOpt_idx(Integer.parseInt(ordIdxSplit[i]));
			delvo.setOpt_qty(Integer.parseInt(ordQtySplit[i]));
			productService.optStockMinus(delvo);
		}
	}
	
	// 옵션 재고 감소
	@ResponseBody
	@RequestMapping( value = "/prodStockMinus.do", method = RequestMethod.POST)
	public void prodStockMinus( PRODOPT_VO povo  ) {
		String ordIdx = povo.getOpt_idx();
		String[] ordIdxSplit = ordIdx.split(",");
		String ordQty = povo.getOpt_qty();
		String[] ordQtySplit = ordQty.split(",");
		
		for( int i=0; i<ordIdxSplit.length; i++) {
			OPT_VO optvo = productService.optSelectOne(Integer.parseInt(ordIdxSplit[i]));
			PRODOPT_VO delvo = new PRODOPT_VO();
			delvo.setProd_idx(optvo.getProd_tb_idx());
			delvo.setProd_stock(Integer.parseInt(ordQtySplit[i]));
			productService.prodStockMinus(delvo);
		}
	}
	
	// 구매 포인트 사용
	@ResponseBody
	@RequestMapping( value = "/usePoint.do", method = RequestMethod.POST )
	public void usePoint( int order_idx, SAVEPOINT_VO savevo ) {
		SAVEPOINT_VO amount = mypageService.selectPointInfo(savevo.getMember_tb_idx());
		SAVEPOINT_VO resultpoint = new SAVEPOINT_VO();
		resultpoint.setMember_tb_idx(savevo.getMember_tb_idx());
		resultpoint.setSavept_amount(savevo.getSavept_amount());
		resultpoint.setSavept_balance(amount.getSavept_balance()-savevo.getSavept_amount());
		int result = mypageService.insertPointUse(resultpoint);
	}
	// 구매확정 포인트 적립
	@ResponseBody
	@RequestMapping( value = "/savePoint.do", method = RequestMethod.POST )
	public void pointSave( int order_idx, SAVEPOINT_VO savevo ) {
		SAVEPOINT_VO amount = mypageService.selectPointInfo(savevo.getMember_tb_idx());
		SAVEPOINT_VO resultpoint = new SAVEPOINT_VO();
		resultpoint.setMember_tb_idx(savevo.getMember_tb_idx());
		resultpoint.setSavept_amount(savevo.getSavept_amount());
		resultpoint.setSavept_balance(amount.getSavept_balance()+savevo.getSavept_amount());
		int result = mypageService.insertPoint(resultpoint);
		System.out.println("오더번호임"+order_idx);
		if( result > 0 ) {
			mypageService.updateOrderCheck(savevo.getOrder_idx());
		}
	}
	// 리뷰작성
	@ResponseBody
	@RequestMapping( value = "reviewInsert.do", method = RequestMethod.POST )
	public void reviewInsert( MultipartFile prod_file1, REVIEW_VO review, HttpServletResponse rsp ) throws IllegalStateException, IOException {
		
		String path = "C:\\Users\\720\\git\\ggamedori\\gamedori\\src\\main\\webapp\\resources\\images";
		File dir = new File(path);
		if(!dir.exists()) { 
			dir.mkdirs();
		}
		String newFileName = "";
		if(!prod_file1.getOriginalFilename().isEmpty()) { 
			String FileName = System.currentTimeMillis()+prod_file1.getOriginalFilename();
			newFileName = new String(FileName.getBytes("UTF-8"),"8859_1");
			prod_file1.transferTo(new File(path,newFileName));
			review.setReview_img(newFileName);
		}

		rsp.setContentType("text/html; charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		
		int result = productService.review_insert(review);
		if( result > 0 ) {
			pw.append("<script>alert('리뷰가 등록되었습니다.'); location.href='reviewlist.do';</script>");
		}else {
			pw.append("<script>alert('리뷰 등록실패하였습니다.'); location.href='reviewlist.do';</script>");
		}
	}
}
