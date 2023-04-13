package game.dori.controller;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import game.dori.service.MemberService;
import game.dori.service.ProductService;
import game.dori.vo.CATEGORY_VO;
import game.dori.vo.MEMBER_VO;
import game.dori.vo.OPT_VO;
import game.dori.vo.PRODUCT_VO;
import net.sf.json.JSONArray;

@RequestMapping( value = "/admin" )
@Controller
public class AdminController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private MemberService memberService;
	
	// 회원관리
	@RequestMapping( value = "/member.do", method = RequestMethod.GET )
	public String member(HttpSession session, HttpServletResponse rsp, Model model) throws IOException{
		
		//회원 리스트 가져오기(일반 회원만 가져오게 sql문 작성했음)
		List<MEMBER_VO> list = memberService.list();
		model.addAttribute("list", list);
		
		//관리자 계정 세션 제어
		MEMBER_VO Login = (MEMBER_VO) session.getAttribute("Login");
		if(Login != null) {
			int role = Login.getMember_role();
			if(role == 2) {
				return "admin/member";
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
			
		}else
		if(!prod_file2.getOriginalFilename().isEmpty()) { 
			String FileName = System.currentTimeMillis()+prod_file2.getOriginalFilename();
			newFileName = new String(FileName.getBytes("UTF-8"),"8859_1");
			prod_file2.transferTo(new File(path,newFileName));
			
		}else
		if(!prod_file3.getOriginalFilename().isEmpty()) { 
			String FileName = System.currentTimeMillis()+prod_file3.getOriginalFilename();
			newFileName = new String(FileName.getBytes("UTF-8"),"8859_1");
			prod_file3.transferTo(new File(path,newFileName));
			
		}
		pvo.setProd_imgt(prod_file1.getOriginalFilename());
		pvo.setProd_imgm(prod_file2.getOriginalFilename());
		pvo.setProd_imgd(prod_file3.getOriginalFilename());
		
		int result = productService.prodInsert(pvo);
		
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		//상품등록 성공
		if( result > 0 )
		{
			opt.setOpt_idx(pvo.getProd_idx());
			productService.optInsert(opt);
			pw.append("<script>alert('등록 완료');location.href='prod.do'</script>");
		}else
		{
			pw.append("<script>alert('등록 실패');location.href='prod.do'</script>");
		}
		pw.flush();
	}
	
	// 상품수정
	@RequestMapping( value = "/prodmodify.do", method = RequestMethod.GET )
	public String prodmodify() {
		return "admin/prodmodify";
	}
	// 상품수정
	@RequestMapping( value = "/prodmodify.do", method = RequestMethod.POST )
	public void prodmodify( PRODUCT_VO pvo, HttpServletRequest req, HttpServletResponse rsp ,MultipartFile prod_file1, MultipartFile prod_file2, MultipartFile prod_file3) throws IllegalStateException, IOException{
		
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
		
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		//상품등록 성공
		if( result > 0 )
		{
			pw.append("<script>alert('수정 완료');location.href='prod.do'</script>");
		}else
		{
			pw.append("<script>alert('수정 실패');location.href='prod.do'</script>");
		}
		pw.flush();
	}
	// 상품삭제
	@RequestMapping( value = "/prodDelete.do", method = RequestMethod.POST )
	public String prodDelete( int prod_idx ){
		
		int result = productService.prodDelete(prod_idx);
		return "redirect:/admin/prod.do";
	}
	
	// 반품관리
	@RequestMapping( value = "/asreturn.do", method = RequestMethod.GET )
	public String asreturn(HttpSession session, HttpServletResponse rsp, Model model) throws IOException{
		//관리자 계정 세션 제어
		MEMBER_VO Login = (MEMBER_VO) session.getAttribute("Login");
		if(Login != null) {
			int role = Login.getMember_role();
			if(role == 2) {
				return "admin/asreturn";
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

	// 환불관리
	@RequestMapping( value = "/asrefund.do", method = RequestMethod.GET )
	public String asrefund(HttpSession session, HttpServletResponse rsp, Model model) throws IOException{
		//관리자 계정 세션 제어
		MEMBER_VO Login = (MEMBER_VO) session.getAttribute("Login");
		if(Login != null) {
			int role = Login.getMember_role();
			if(role == 2) {
				return "admin/asrefund";
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
	
	// 공지사항 관리
	@RequestMapping( value = "/notice.do", method = RequestMethod.GET )
	public String notice(HttpSession session, HttpServletResponse rsp, Model model) throws IOException{
		//관리자 계정 세션 제어
		MEMBER_VO Login = (MEMBER_VO) session.getAttribute("Login");
		if(Login != null) {
			int role = Login.getMember_role();
			if(role == 2) {
				return "admin/notice";
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
	
	// 1:1문의 관리
	@RequestMapping( value = "/oto.do", method = RequestMethod.GET )
	public String oto(HttpSession session, HttpServletResponse rsp, Model model) throws IOException{
		//관리자 계정 세션 제어
		MEMBER_VO Login = (MEMBER_VO) session.getAttribute("Login");
		if(Login != null) {
			int role = Login.getMember_role();
			if(role == 2) {
				return "admin/oto";
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
	
	// 상품문의 관리
	@RequestMapping( value = "/qaprod.do", method = RequestMethod.GET )
	public String qaprod(HttpSession session, HttpServletResponse rsp, Model model) throws IOException{
		//관리자 계정 세션 제어
		MEMBER_VO Login = (MEMBER_VO) session.getAttribute("Login");
		if(Login != null) {
			int role = Login.getMember_role();
			if(role == 2) {
				return "admin/qaprod";
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
	
	// 상품문의 관리
	@RequestMapping( value = "/mainPageModify.do", method = RequestMethod.GET )
	public String mainPageModify(HttpSession session, HttpServletResponse rsp, Model model) throws IOException{
		//관리자 계정 세션 제어
		MEMBER_VO Login = (MEMBER_VO) session.getAttribute("Login");
		if(Login != null) {
			int role = Login.getMember_role();
			if(role == 2) {
				return "admin/mainPageModify";
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
