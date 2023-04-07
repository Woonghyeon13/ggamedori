package game.dori.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import game.dori.service.MemberService;
import game.dori.service.ProductService;
import game.dori.vo.CATEGORY_VO;
import game.dori.vo.MEMBER_VO;
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
	public String prod( Model model ){
		List<CATEGORY_VO> category = null;
		category = productService.category();
		model.addAttribute("category", JSONArray.fromObject(category));
		return "admin/prod";
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
}
