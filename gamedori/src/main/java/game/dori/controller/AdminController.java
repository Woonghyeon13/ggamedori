package game.dori.controller;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import game.dori.dao.ProdOptDAO;
import game.dori.service.AdminService;
import game.dori.service.MemberService;
import game.dori.service.ProductService;
import game.dori.util.ORDER_LIST_VO;
import game.dori.util.OTO_VO;
import game.dori.util.PROD_Q_LIST_VO;
import game.dori.vo.CATEGORY_VO;
import game.dori.vo.MEMBER_VO;
import game.dori.vo.NOTICE_VO;
import game.dori.vo.OPT_VO;
import game.dori.vo.PRODUCT_VO;
import net.sf.json.JSONArray;

@RequestMapping( value = "/admin" )
@Controller
public class AdminController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MemberService MemberService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AdminService AdminService;
	
	// 회원관리
	@RequestMapping( value = "/member.do", method = RequestMethod.GET )
	public String member(HttpSession session,HttpServletRequest req, HttpServletResponse rsp, Model model) throws IOException{
		
		//회원 리스트 가져오기(일반 회원만 가져오게 sql문 작성했음)
		List<MEMBER_VO> list = memberService.list();
		model.addAttribute("list", list);
		
		//관리자 계정 세션 제어
		MEMBER_VO Login = (MEMBER_VO) session.getAttribute("Login");
		if(Login != null) {
			int role = Login.getMember_role();
			if(role == 2) {
				return "admin/member";
			}
		}
		
		rsp.setContentType("text/html; charset=utf-8");
	    PrintWriter pw = rsp.getWriter();
	    pw.append("<script>alert('관리자 계정으로 로그인해주세요.'); location.href='"
	            + req.getContextPath() + "/';</script>");
	    pw.flush();
	    pw.close();
		return null;
		
	}
	
	//회원관리 회원상태 변경
	@RequestMapping(value="/member.do",method=RequestMethod.POST)
	public void updateMemberState( MEMBER_VO MemberVO) {
		
		memberService.updateMemberState(MemberVO);
		
	}

	// 상품관리
	@RequestMapping( value = "/prod.do", method = RequestMethod.GET )
	public String prod( Model model, CATEGORY_VO cvo ){
		List<CATEGORY_VO> category = null;
		category = productService.category();
		model.addAttribute("category", JSONArray.fromObject(category));
		
		List<PRODUCT_VO> list = productService.list(cvo);
		model.addAttribute("plist",list);
		
		return "admin/prod";
	}
	// 상품등록
	@RequestMapping( value = "/prodinsert.do", method = RequestMethod.GET )
	public String prodinsert( Model model, CATEGORY_VO cvo, OPT_VO opt, PRODUCT_VO pvo) {
		List<CATEGORY_VO> category = null;
		category = productService.category();
		model.addAttribute("category", JSONArray.fromObject(category));
		
		return "admin/prodinsert";
	}
	// 상품등록
	@RequestMapping( value = "/prodinsert.do", method = RequestMethod.POST )
	public void prodinsert( OPT_VO opt, PRODUCT_VO pvo, HttpServletRequest req, HttpServletResponse rsp ,MultipartFile prod_file1, MultipartFile prod_file2, MultipartFile prod_file3 ) throws IllegalStateException, IOException{
		
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
			pvo.setProd_imgt(newFileName);
			
		}else
		if(!prod_file2.getOriginalFilename().isEmpty()) { 
			String FileName = System.currentTimeMillis()+prod_file2.getOriginalFilename();
			newFileName = new String(FileName.getBytes("UTF-8"),"8859_1");
			prod_file2.transferTo(new File(path,newFileName));
			pvo.setProd_imgm(newFileName);
			
		}else
		if(!prod_file3.getOriginalFilename().isEmpty()) { 
			String FileName = System.currentTimeMillis()+prod_file3.getOriginalFilename();
			newFileName = new String(FileName.getBytes("UTF-8"),"8859_1");
			prod_file3.transferTo(new File(path,newFileName));
			pvo.setProd_imgd(newFileName);
			
		}
//		pvo.setProd_imgt(prod_file1.getOriginalFilename());
		
		int result = productService.prodInsert(pvo);
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		
		String optName = opt.getOpt_name();
		String[] optNsplit = optName.split(",");
		String optStock = opt.getOpt_stock();
		String[] optSsplit = optStock.split(",");
		String optPrice = opt.getOpt_price();
		String[] optPsplit = optPrice.split(",");
		//상품등록 성공
		if( result > 0 )
		{
			int prodIdx = productService.optIdx();
			if( optNsplit.length > 0) {
			for( int i=1; i<optNsplit.length; i++  ) {
			opt.setProd_tb_idx(prodIdx);
			opt.setOpt_name(optNsplit[i]);
			opt.setOpt_stock(optSsplit[i]);
			opt.setOpt_price(optPsplit[i]);
			productService.optInsert(opt);
			}}
			pw.append("<script>alert('등록 완료');location.href='prod.do'</script>");
		}else
		{
			pw.append("<script>alert('등록 실패');location.href='prod.do'</script>");
		}
		pw.flush();
	    pw.close();

	}
	
	// 상품수정
	@RequestMapping( value = "/prodmodify.do", method = RequestMethod.GET )
	public String prodmodify( CATEGORY_VO cvo, int prod_idx, Model model ) {
		List<CATEGORY_VO> category = null;
		category = productService.category();
		model.addAttribute("category", JSONArray.fromObject(category));
		PRODUCT_VO pvo = productService.prodSelectOne(prod_idx);
		model.addAttribute("pvo",pvo);
		List<OPT_VO> optlist = productService.optSelect(prod_idx);
		model.addAttribute("optlist",optlist);
		return "admin/prodmodify";
	}

	// 상품수정
	@RequestMapping( value = "/prodmodify.do", method = RequestMethod.POST )
	public void prodmodify( OPT_VO opt, PRODUCT_VO pvo, HttpServletRequest req, HttpServletResponse rsp ,MultipartFile prod_file1, MultipartFile prod_file2, MultipartFile prod_file3) throws IllegalStateException, IOException{
		
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
			pvo.setProd_imgt(prod_file1.getOriginalFilename());
		}else
		if(!prod_file2.getOriginalFilename().isEmpty()) { 
			String FileName = System.currentTimeMillis()+prod_file2.getOriginalFilename();
			newFileName = new String(FileName.getBytes("UTF-8"),"8859_1");
			prod_file2.transferTo(new File(path,newFileName));
			pvo.setProd_imgm(prod_file2.getOriginalFilename());
		}else
		if(!prod_file3.getOriginalFilename().isEmpty()) { 
			String FileName = System.currentTimeMillis()+prod_file3.getOriginalFilename();
			newFileName = new String(FileName.getBytes("UTF-8"),"8859_1");
			prod_file3.transferTo(new File(path,newFileName));
			pvo.setProd_imgd(prod_file3.getOriginalFilename());
		}
		
		int result = productService.prodUpdate(pvo);
		String optName = opt.getOpt_name();
		String[] optNsplit = optName.split(",");
		String optStock = opt.getOpt_stock();
		String[] optSsplit = optStock.split(",");
		String optPrice = opt.getOpt_price();
		String[] optPsplit = optPrice.split(",");
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		System.out.println("optNsplit 길이 : " + optNsplit.length);
		//상품수정 성공
		if( result > 0 )
		{
			productService.optDel(pvo.getProd_idx());
			for( int i=1; i<optNsplit.length; i++ ) {
			opt.setProd_tb_idx(pvo.getProd_idx());
			opt.setOpt_name(optNsplit[i]);
			opt.setOpt_stock(optSsplit[i]);
			opt.setOpt_price(optPsplit[i]);
			System.out.println("옵션이름 ; " +optNsplit[i]);
			productService.optInsert(opt);
			}
			pw.append("<script>alert('수정 완료');location.href='prod.do'</script>");
		}else
		{
			pw.append("<script>alert('수정 실패');location.href='prod.do'</script>");
		}
		pw.flush();
	}
	// 상품 옵션 목록
	@RequestMapping( value = "/prodOptlist.do", method = RequestMethod.GET )
	public String prodOptlist( int prod_idx, Model model ) {
		PRODUCT_VO pvo = productService.prodSelectOne(prod_idx);
		model.addAttribute("pvo",pvo);
		List<OPT_VO> optlist = productService.optSelect(prod_idx);
		model.addAttribute("optlist",optlist);
		return "admin/prodOptlist";
	}
	// 상품 옵션 등록
	@RequestMapping( value = "/prodOptlist.do", method = RequestMethod.POST )
	public void prodOptlist( int prod_idx, OPT_VO opt, HttpServletResponse rsp ) throws IOException {
		int result = productService.optInsert(opt);
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		if( result > 0 ){
			pw.append("<script>alert('등록 완료');location.href='prodOptlist.do?prod_idx="+prod_idx+"'</script>");
		}else{
			pw.append("<script>alert('등록 실패');location.href='prodOptlist.do?prod_idx="+prod_idx+"'</script>");
		}
		pw.flush();
		
	}
	// 상품 옵션 수정
	@RequestMapping( value = "/prodOptmodify.do", method = RequestMethod.GET )
	public String prodOptmodify( int opt_idx, Model model ){
		OPT_VO opt = productService.optSelectOne(opt_idx);
		model.addAttribute("opt",opt);
		return "admin/prodOptmodify";
	}
	// 상품 옵션 수정
	@RequestMapping( value = "/prodOptmodify.do", method = RequestMethod.POST )
	public void prodOptmodify( OPT_VO opt, int prod_idx, HttpServletResponse rsp ) throws IOException {
		int result = productService.optModify(opt);
		
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		if( result > 0 ){
			pw.append("<script>alert('수정 완료');location.href='prodOptlist.do?prod_idx="+prod_idx+"'</script>");
		}else{
			pw.append("<script>alert('수정 실패');location.href='prodOptlist.do?prod_idx="+prod_idx+"'</script>");
		}
		pw.flush();
	}
	// 상품 옵션상태 수정
	@RequestMapping( value = "/updateOptState.do", method = RequestMethod.POST )
	public void updateOptState( OPT_VO opt ) {
		productService.optStateModify(opt);
	}
	// 상품삭제
	@RequestMapping( value = "/prodDelete.do", method = RequestMethod.POST )
	public String prodDelete( int prod_idx ){
		int optd = productService.optDel(prod_idx);
		int result = productService.prodDelete(prod_idx);
		return "redirect:/admin/prod.do";
	}
	// 상품 옵션 삭제
	@RequestMapping( value = "/prodOptDelete.do", method = RequestMethod.POST )
	public void prodOptDelete( int prod_idx, int opt_idx, HttpServletResponse rsp ) throws IOException{
		int result = productService.optDelOne(opt_idx);
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		
		if( result > 0 ) {
			pw.append("<script>alert('삭제 완료');location.href='prodOptlist.do?prod_idx="+prod_idx+"'</script>");
		}else {
			pw.append("<script>alert('삭제 실패');location.href='prod.do'</script>");
		}
		pw.flush();
	}
	
	// 반품관리
	@RequestMapping( value = "/asreturn.do", method = RequestMethod.GET )
	public String asreturn(HttpSession session, HttpServletResponse rsp,HttpServletRequest req, Model model) throws IOException{
		//관리자 계정 세션 제어
		MEMBER_VO Login = (MEMBER_VO) session.getAttribute("Login");
		if(Login != null) {
			int role = Login.getMember_role();
			if(role == 2) {
				return "admin/asreturn";
			}
		}
		
		rsp.setContentType("text/html; charset=utf-8");
	    PrintWriter pw = rsp.getWriter();
	    pw.append("<script>alert('관리자 계정으로 로그인해주세요.'); location.href='"
	            + req.getContextPath() + "/';</script>");
	    pw.flush();
	    pw.close();
		return null;
	}

	// 환불관리
	@RequestMapping( value = "/asrefund.do", method = RequestMethod.GET )
	public String asrefund(HttpSession session,  HttpServletRequest req,HttpServletResponse rsp, Model model) throws IOException{
		//관리자 계정 세션 제어
		MEMBER_VO Login = (MEMBER_VO) session.getAttribute("Login");
		if(Login != null) {
			int role = Login.getMember_role();
			if(role == 2) {
				return "admin/asrefund";
			}else {
				 rsp.setContentType("text/html; charset=utf-8");
				    PrintWriter pw = rsp.getWriter();
				    pw.append("<script>alert('관리자 계정으로 로그인해주세요.'); location.href='"
				            + req.getContextPath() + "/';</script>");
				    pw.flush();
				    pw.close();
			}
		}
		return null;
	}
	
	
	//공지사항 관리
	@RequestMapping(value = "/notice.do", method = RequestMethod.GET)
	public String notice(HttpSession session, HttpServletResponse rsp, HttpServletRequest req, Model model,
	                     @RequestParam(value = "page", defaultValue = "1") int page) throws Exception {
	    MEMBER_VO Login = (MEMBER_VO) session.getAttribute("Login");
	    if (Login != null) {
	        int role = Login.getMember_role();
	        if (role == 2) {

	            int limit = 15; // 페이지당 게시물 수
	            int start = (page - 1) * limit;

	            List<NOTICE_VO> noticeList = adminService.list(limit, start);
	            model.addAttribute("notice", noticeList);

	            int totalRecords = adminService.countAll();
	            int totalPages = (int) Math.ceil((double) totalRecords / limit);
	            model.addAttribute("totalPages", totalPages);

	            return "admin/notice";
	        }
	    }
	    
	    rsp.setContentType("text/html; charset=utf-8");
	    PrintWriter pw = rsp.getWriter();
	    pw.append("<script>alert('관리자 계정으로 로그인해주세요.'); location.href='"
	            + req.getContextPath() + "/';</script>");
	    pw.flush();
	    pw.close();
	    
	    return null;
	}
	

	//검색 기능
		@RequestMapping(value = "/search.do", method = RequestMethod.GET)
		@ResponseBody
		public ResponseEntity<Map<String, Object>> searchNotice(@RequestParam("searchText") String searchText,
		                                                        @RequestParam("searchOption") String searchOption,
		                                                        @RequestParam(value = "page", defaultValue = "1") int page) {
		  int limit = 15; // 페이지당 게시물 수
		  int start = (page - 1) * limit;

		  List<NOTICE_VO> searchResults = adminService.searchNotices(searchText, searchOption, start, limit);
		  int totalResults = adminService.countSearchResults(searchText, searchOption); // 전체 검색 결과 수
		  int totalPages = (int) Math.ceil((double) totalResults / limit); // 전체 페이지 수 계산
		  
		  
		  System.out.println(totalResults);

		  Map<String, Object> response = new HashMap<>();
		  response.put("searchResults", searchResults);
		  response.put("totalPages", totalPages);

		  return new ResponseEntity<Map<String, Object>>(response, HttpStatus.OK);
		}
	
	
	// 1:1문의 관리
	@RequestMapping( value = "/oto.do", method = RequestMethod.GET )
	public String oto(HttpSession session,HttpServletRequest req, HttpServletResponse rsp, Model model) throws IOException{
		
		List<OTO_VO> otoList = AdminService.otoList();
		model.addAttribute("otoList", otoList);
		
		//관리자 계정 세션 제어
		MEMBER_VO Login = (MEMBER_VO) session.getAttribute("Login");
		if(Login != null) {
			int role = Login.getMember_role();
			if(role == 2) {
				return "admin/oto";
			}
		}
		
		rsp.setContentType("text/html; charset=utf-8");
	    PrintWriter pw = rsp.getWriter();
	    pw.append("<script>alert('관리자 계정으로 로그인해주세요.'); location.href='"
	            + req.getContextPath() + "/';</script>");
	    pw.flush();
	    pw.close();
	    return null;
	}
	
	// 1:1문의 답변
	@RequestMapping( value = "/oto_answer.do", method = RequestMethod.POST )
	public void otoAnswer(OTO_VO otoVO, HttpSession session,HttpServletRequest req, HttpServletResponse rsp, Model model) throws IOException{
		
		int result = adminService.otoAnswer(otoVO);
		
		rsp.setContentType("text/html; charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		
		if (result > 0) {
			session.setAttribute("otoVO", otoVO);
			pw.append("<script>alert('글작성 성공'); location.href='" + req.getContextPath()
			+ "/admin/oto.do';</script>");
		}
	}
	
	
	
	
	// 상품문의 관리
	@RequestMapping( value = "/qaprod.do", method = RequestMethod.GET )
	public String qaprod(HttpSession session,HttpServletRequest req, HttpServletResponse rsp, Model model) throws IOException{
		
		List<PROD_Q_LIST_VO> pqlist = AdminService.pqlist();
		model.addAttribute("pqlist", pqlist);
		
		//관리자 계정 세션 제어
		MEMBER_VO Login = (MEMBER_VO) session.getAttribute("Login");
		if(Login != null) {
			int role = Login.getMember_role();
			if(role == 2) {
				return "admin/qaprod";
			}
			
		}
		rsp.setContentType("text/html; charset=utf-8");
	    PrintWriter pw = rsp.getWriter();
	    pw.append("<script>alert('관리자 계정으로 로그인해주세요.'); location.href='"
	            + req.getContextPath() + "/';</script>");
	    pw.flush();
	    pw.close();
	    return null;
	}
	
	// 상품문의 답변
	@RequestMapping( value = "/pq_answer.do", method = RequestMethod.POST )
	public void pqAnswer(PROD_Q_LIST_VO pqVO, HttpSession session,HttpServletRequest req, HttpServletResponse rsp, Model model) throws IOException{
		
		int result = adminService.pqAnswer(pqVO);
		
		rsp.setContentType("text/html; charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		
		if (result > 0) {
			session.setAttribute("pqVO", pqVO);
			pw.append("<script>alert('글작성 성공'); location.href='" + req.getContextPath()
			+ "/admin/qaprod.do';</script>");
		}
	}
	
	// 메인 화면 관리
	@RequestMapping( value = "/mainPageModify.do", method = RequestMethod.GET )
	public String mainPageModify(HttpSession session,HttpServletRequest req, HttpServletResponse rsp, Model model) throws IOException{
		//관리자 계정 세션 제어
		MEMBER_VO Login = (MEMBER_VO) session.getAttribute("Login");
		if(Login != null) {
			int role = Login.getMember_role();
			if(role == 2) {
				return "admin/mainPageModify";
			}
		   
	}
		rsp.setContentType("text/html; charset=utf-8");
	    PrintWriter pw = rsp.getWriter();
	    pw.append("<script>alert('관리자 계정으로 로그인해주세요.'); location.href='"
	            + req.getContextPath() + "/';</script>");
	    pw.flush();
	    pw.close();
		return null;
	}
	

	//관리자페이지에서 공지사항 작성
	@RequestMapping( value = "/notice_write.do", method = RequestMethod.POST )
	public void notice_write(NOTICE_VO noticeVO, HttpServletResponse rsp, String member_email, HttpServletRequest req, HttpSession session) throws IOException {
		MEMBER_VO member = MemberService.selectByEmail(member_email);
		
		int result = 0;
		if (member.getMember_role() == 2) {
			noticeVO.setMember_tb_idx(member.getMember_idx());
			result = adminService.insert(noticeVO);
			
			System.out.println(noticeVO.getMember_tb_idx());
		}
		
		rsp.setContentType("text/html; charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		
		if (result > 0) {
			session.setAttribute("noticeVO", noticeVO);
			pw.append("<script>alert('글작성 성공'); location.href='" + req.getContextPath()
			+ "/admin/notice.do';</script>");

		}
	}
	
	//관리자 공지사항 글삭제
	@RequestMapping(value = "/notice_delete.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Integer> delete(int notice_idx) {
	    int result = adminService.delete(notice_idx);
	    Map<String, Integer> resultMap = new HashMap<String, Integer>();
	    resultMap.put("result", result);
	    return resultMap;
	}
	
	//공지사항 관리 글 보기
	@RequestMapping( value = "/view.do", method = RequestMethod.GET )
	public String view(Model model, @RequestParam("notice_idx") int noticeIdx)
	{
		NOTICE_VO noticeVO = adminService.select(noticeIdx);
		int result = adminService.notice_Hit(noticeVO);
	
		if(result >= 0 )
		{
		model.addAttribute("noticeVO", noticeVO);
		
		}
		return "customersc/view";
	}
	
	// 공지사항 글 수정

	@RequestMapping(value = "/notice_modify.do", method = RequestMethod.POST)
	public void modify(NOTICE_VO noticeVO, String member_email,HttpServletResponse rsp, HttpServletRequest req) throws IOException {	
		
		MEMBER_VO member = MemberService.selectByEmail(member_email);
		
		noticeVO.setMember_tb_idx(member.getMember_idx());
		noticeVO.setNotice_writer(member.getMember_name());
		System.out.println(noticeVO.getMember_tb_idx());
		System.out.println(noticeVO.getNotice_title());
		System.out.println(noticeVO.getNotice_contents());
		System.out.println(noticeVO.getNotice_idx());
		
		int result = adminService.modify(noticeVO);
		rsp.setContentType("text/html; charset=utf-8");
		PrintWriter pw = rsp.getWriter();		
		
		if(result > 0) {
		    pw.append("<script>alert('글 수정 성공'); location.href='" + req.getContextPath()
		        + "/admin/notice.do';</script>");
		} else {
		    pw.append("<script>alert('글 수정 실패'); location.href='" + req.getContextPath()
		        + "/admin/notice.do?notice_idx=" + noticeVO.getNotice_idx() + "';</script>");
		}
	}	

	
	
	// 메인 화면 관리
	@RequestMapping( value = "/productPageModify.do", method = RequestMethod.GET )
	public String productPageModify(HttpSession session, HttpServletResponse rsp, Model model) throws IOException{
		//관리자 계정 세션 제어
		MEMBER_VO Login = (MEMBER_VO) session.getAttribute("Login");
		if(Login != null) {
			int role = Login.getMember_role();
			if(role == 2) {
				return "admin/productPageModify";
			}else {
			    rsp.setContentType("text/html; charset=utf-8");
		        PrintWriter pw = rsp.getWriter();
		        model.addAttribute("message", "관리자 계정으로 로그인해주세요.");
		        pw.append("<script>alert('관리자 계정으로 로그인해주세요.');</script>");
		        pw.flush();
		        pw.close();
				return "home";
			}
		}else {
		    rsp.setContentType("text/html; charset=utf-8");
	        PrintWriter pw = rsp.getWriter();
	        model.addAttribute("message", "관리자 계정으로 로그인해주세요.");
	        pw.append("<script>alert('관리자 계정으로 로그인해주세요.');</script>");
	        pw.flush();
	        pw.close();
			return "home";
		}
	}
	
	// 주문내역
	@RequestMapping( value = "/orderList.do", method = RequestMethod.GET )
	public String orderList(HttpSession session, HttpServletResponse rsp, Model model) throws IOException{
		
		List<ORDER_LIST_VO> orderList = AdminService.orderList();
		model.addAttribute("orderList", orderList);
		
		//관리자 계정 세션 제어
		MEMBER_VO Login = (MEMBER_VO) session.getAttribute("Login");
		if(Login != null) {
			int role = Login.getMember_role();
			if(role == 2) {
				return "admin/orderList";
			}else {
			    rsp.setContentType("text/html; charset=utf-8");
		        PrintWriter pw = rsp.getWriter();
		        model.addAttribute("message", "관리자 계정으로 로그인해주세요.");
		        pw.append("<script>alert('관리자 계정으로 로그인해주세요.');</script>");
		        pw.flush();
		        pw.close();
				return "home";
			}
		}else {
		    rsp.setContentType("text/html; charset=utf-8");
	        PrintWriter pw = rsp.getWriter();
	        model.addAttribute("message", "관리자 계정으로 로그인해주세요.");
	        pw.append("<script>alert('관리자 계정으로 로그인해주세요.');</script>");
	        pw.flush();
	        pw.close();
			return "home";
		}
	}
}
