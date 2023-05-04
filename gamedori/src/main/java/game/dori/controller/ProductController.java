package game.dori.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import game.dori.service.AdminService;
import game.dori.service.MemberService;
import game.dori.service.MypageService;
import game.dori.service.ProductService;
import game.dori.util.ORDER_LIST_VO;
import game.dori.util.PRODOPT_VO;
import game.dori.vo.ADDRESS_VO;
import game.dori.vo.CATEGORY_IMG_VO;
import game.dori.vo.CATEGORY_VO;
import game.dori.vo.MEMBER_VO;
import game.dori.vo.OPT_VO;
import game.dori.vo.ORDER_DETAIL_VO;
import game.dori.vo.PRODUCT_Q_VO;
import game.dori.vo.PRODUCT_VO;
import game.dori.vo.REVIEW_VO;

@RequestMapping( value = "/prod")
@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private MemberService MemberService;
	
	@Autowired
	private MypageService mypageService;

	@Autowired
	private AdminService adminService;
	
	
	// 상품 목록
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String list(
	        Model model, PRODUCT_VO pvo, CATEGORY_VO cvo, CATEGORY_IMG_VO civo,
	        HttpServletRequest request,
	        @RequestParam(required = false) String sort,
	        @RequestParam(required = false) String cate_code,
	        @RequestParam(required = false) String cate_refcode,
	        @RequestParam(required = false) String cate_rsv,
	        @RequestParam(required = false) String cate_new,
	        @RequestParam(required = false, defaultValue = "1") int page
	    ) {
		
		
		 int limit = 12;
		 int start = (page - 1) * limit;
		

	    cvo.setCate_code(cate_code);
	    cvo.setCate_refcode(cate_refcode);
	    cvo.setCate_rsv(cate_rsv);
	    cvo.setCate_new(cate_new);

	    cvo.setStart(start);
	    cvo.setLimit(limit);
	    
	    System.out.println("cate_new :"+cate_new);

	    
	    // 추가된 부분: sort 값을 CATEGORY_VO 객체에 설정
	    cvo.setSort(sort);
	    
	    List<PRODUCT_VO> plist = productService.list(cvo);
	    
	    model.addAttribute("plist", plist);

	    Map<String, String> cateImgs = adminService.selectCategoryImages();
	    model.addAttribute("cateImgs", cateImgs);


	    int listCnt;
	 
	    if ("1".equals(cate_new)) {
	        listCnt = productService.newListCnt();
	    } else {
	        listCnt = productService.listCnt(cvo);
	    }
	    model.addAttribute("listCnt", listCnt);
	    System.out.println(listCnt);

	    // 토탈 페이지 계산
	    int totalPages = (int) Math.ceil((double) listCnt / limit);
	    model.addAttribute("totalPages", totalPages);


	    return "prod/list";
	}
	
	//검색 결과페이지
	@RequestMapping(value = "/search.do", method = RequestMethod.GET)
	public String search(@RequestParam("searchhOption") String searchhOption,
	                     @RequestParam("searchhText") String searchhText,
	                     Model model) {
		
		 model.addAttribute("searchOption", searchhOption);
		 model.addAttribute("searchText", searchhText);
	    
	    return "prod/search-result"; // 결과 페이지 뷰 이름
	}

	// 상품 상세
	@RequestMapping( value = "/detail.do", method = RequestMethod.GET )
	public String detail(@RequestParam("prod_idx") Integer prod_idx, Model model)
	{
		PRODUCT_VO pvo = productService.prodSelectOne(prod_idx);
		model.addAttribute("pvo",pvo);
		List<PRODUCT_Q_VO> pqllist = productService.prodQlist(prod_idx);
		model.addAttribute("pqllist",pqllist);
		int pqlCnt = productService.prodQlistCnt(prod_idx);
		model.addAttribute("pqlCnt",pqlCnt);
		List<OPT_VO> optlist = productService.optSelect(prod_idx);
		model.addAttribute("optlist",optlist);
		List<REVIEW_VO> reviewlist = productService.prodReviewList(prod_idx);
		model.addAttribute("reviewlist",reviewlist);
		int reviewCnt = productService.prodReviewCnt(prod_idx);
		model.addAttribute("reviewCnt",reviewCnt);
		
		return "prod/detail";
	}
	
	
	// 주문폼
	@RequestMapping( value = "/orderForm.do", method = RequestMethod.GET )
	public String orderForm( String opt_qty1,String opt_qty2,String opt_qty3,String opt_qty4,String opt_qty5,int opt_idx1,int opt_idx2,int opt_idx3,int opt_idx4,int opt_idx5, MEMBER_VO memberVO ,HttpSession session,  Model model ){
		MEMBER_VO Login = (MEMBER_VO) session.getAttribute("Login");
		MEMBER_VO memvo = productService.orderMem(Login);
		model.addAttribute("memvo",memvo);
		ADDRESS_VO adr = productService.selectMemAddr(memvo);
		model.addAttribute("adr",adr);
		int savePoint = mypageService.selectPointBal(Login.getMember_idx());
		model.addAttribute("savePoint",savePoint);
		
		List<PRODOPT_VO> optlist = new ArrayList<PRODOPT_VO>();
		if( opt_idx1 != 0 ) {
			PRODOPT_VO opt1 = productService.prodOptSelect(opt_idx1);
			opt1.setOpt_qty(opt_qty1);
			optlist.add(opt1);
		}
		if( opt_idx2 != 0 ) {
			PRODOPT_VO opt2 = productService.prodOptSelect(opt_idx2);
			opt2.setOpt_qty(opt_qty2);
			optlist.add(opt2);
		}
		if( opt_idx3 != 0 ) {
			PRODOPT_VO opt3 = productService.prodOptSelect(opt_idx3);
			opt3.setOpt_qty(opt_qty3);
			optlist.add(opt3);
		}
		if( opt_idx4 != 0 ) {
			PRODOPT_VO opt4 = productService.prodOptSelect(opt_idx4);
			opt4.setOpt_qty(opt_qty4);
			optlist.add(opt4);
		}
		if( opt_idx5 != 0 ) {
			PRODOPT_VO opt5 = productService.prodOptSelect(opt_idx5);
			opt5.setOpt_qty(opt_qty5);
			optlist.add(opt5);
		}
		model.addAttribute("optlist",optlist);
		
		return "prod/orderForm";
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
				productService.insertOrderDetail(ordervo);
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
		System.out.println(num1);
		System.out.println(num2);
		model.addAttribute("priceCalRRR",num2-num1);
		return num2-num1;
	}
	
	// 상품 문의 등록
	@RequestMapping( value = "/detail.do", method = RequestMethod.POST )
	public void detail( PRODUCT_Q_VO pqvo, HttpServletResponse rsp ) throws IOException {
		
		int result = productService.prodq_insert(pqvo);
		System.out.println("멤버인덱스"+pqvo.getMember_tb_idx());
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		
		if( result > 0 ) {
			pw.append("<script>alert('문의가 등록되었습니다.');location.href='detail.do?prod_idx="+pqvo.getProduct_tb_idx()+"'</script>");
		}else {
			pw.append("<script>alert('문의등록이 실패되었습니다.');location.href='detail.do?prod_idx="+pqvo.getProduct_tb_idx()+"'</script>");
		}
		pw.flush();
	}
	
	
	
	
	/*-----------------------------------------------------------------------*/
	
	// 리뷰 등록
	@RequestMapping(value = "/review_reg.do", method = RequestMethod.GET)
	public String review_reg() {
		
		return "prod/review_reg";
	}
	
	// 리뷰 등록
	@RequestMapping(value = "/review_reg.do", method = RequestMethod.POST)
	public void review_reg(@ModelAttribute REVIEW_VO reviewVO,String member_email,HttpServletResponse rsp, HttpServletRequest req, HttpSession session) throws IOException {
		
		MEMBER_VO results = MemberService.selectByEmail(member_email);
		int result =0 ;
		
		if(results != null)
		{
			reviewVO.setMember_tb_idx(results.getMember_idx());
			result = productService.review_insert(reviewVO);
	    
			rsp.setContentType("text/html; charset=utf-8");
			
		}
		PrintWriter pw = rsp.getWriter();		
		
		
		if (result > 0) {
			session.setAttribute("REVIEW_VO", reviewVO);
			pw.append("<script>alert('리뷰가 등록되었습니다.'); location.href='" + req.getContextPath()
			+ "/prod/detail.do';</script>");
			System.out.println(result);
		} else if(result <= 0){
			pw.append("<script>alert('리뷰가 등록이 실패되었습니다.'); location.href='" + req.getContextPath()
			+ "/prod/detail.do';</script>");
		}
		
	
	}
	
	

}
