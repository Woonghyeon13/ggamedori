package game.dori.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.util.Base64;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import game.dori.service.AddressService;
import game.dori.service.MailSendService;
import game.dori.service.MemberService;
import game.dori.vo.ADDRESS_VO;
import game.dori.vo.MEMBER_VO;

@RequestMapping(value="/user")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService MemberService;
	
	@Autowired
	private AddressService AddressService;
	
	@Autowired
	private MailSendService mailService;
	
	

	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String join( Model model )
	{
		return "user/join";
	}
	
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public void Login( MEMBER_VO MemberVO ,  HttpServletResponse rsp ,HttpServletRequest req , HttpSession session, Model model) throws IOException
	{
		MEMBER_VO result = MemberService.Login(MemberVO);
	    if (result != null) {
	        // 로그인 성공
	    	
	    	MEMBER_VO MemberVO2 = new MEMBER_VO();
	    	MemberVO2.setMember_email(result.getMember_email());
	    	MemberVO2.setMember_role(result.getMember_role());
	    	MemberVO2.setMember_name(result.getMember_name());
	    	
	    	rsp.setContentType("text/html; charset=utf-8");
	        PrintWriter pw = rsp.getWriter();
	        pw.append("<script>alert('로그인 성공!'); location.href='"+req.getContextPath()+"'</script>");
	    	session.setAttribute("Login", MemberVO2);
	        
	    	
	    } else {
	        // 로그인 실패
	        rsp.setContentType("text/html; charset=utf-8");
	        PrintWriter pw = rsp.getWriter();
	        model.addAttribute("message", "로그인 실패");
	        pw.append("<script>alert('로그인 실패!'); history.back();</script>");
	        pw.flush();
	        pw.close();
	    }
	    
	    
	}
	
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public void logout(HttpSession session ,HttpServletResponse rsp ,HttpServletRequest req) throws IOException {
	    session.invalidate(); // 세션 삭제
	    rsp.setContentType("text/html; charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		
		pw.append("<script>alert('로그아웃 되었습니다'); location.href='"+req.getContextPath()+"'</script>");

	 
	}

		
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public String mypage() {

		return "user/mypage";
	}
	
	@ResponseBody
	@RequestMapping(value="/checkID.do" ,method=RequestMethod.GET)
	public String checkID(MEMBER_VO MemberVO)
	{
	    String email = MemberVO.getMember_email();
	    
	    System.out.println(email);
	    
	    if (email == null || email.isEmpty() || !email.matches("\\S+@\\S+\\.\\S+")) {
	        return "2"; // 이메일 양식 오류
	    }
	    
	    MEMBER_VO result = MemberService.selectByEmail(email);
	    
	    if (result != null) {
	        return "0"; // 중복 이메일
	    } else {
	        return "1"; // 사용 가능한 이메일
	    }
	}
	

	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String join(Model model, MEMBER_VO MemberVO, ADDRESS_VO addr, HttpServletRequest req, HttpServletResponse rsp,
	                   HttpSession session) throws IOException {

	    // 이메일 인증 링크 생성
	    String token = generateToken();
	    MemberVO.setMember_email_key(token);

	    // 이메일 전송
	    mailService.sendVerificationEmail(MemberVO.getMember_email(), token);

	    // 세션에 회원 정보 저장
	    session.setAttribute("memberVO", MemberVO);
	    session.setAttribute("addr", addr);
	    session.setAttribute("name", MemberVO.getMember_name());

	    return "user/emailcheck";
	}

	@RequestMapping(value = "/emailCheck.do", method = RequestMethod.GET)
	public void emailCheck(@RequestParam("email") String email, @RequestParam("token") String token,
	                        HttpServletResponse rsp, HttpServletRequest req, HttpSession session) throws IOException {

	    // 세션에서 회원 정보와 주소 정보 가져오기
	    MEMBER_VO memberVO = (MEMBER_VO) session.getAttribute("memberVO");
	    ADDRESS_VO addr = (ADDRESS_VO) session.getAttribute("addr");

	    if (memberVO == null || addr == null) {
	        // 에러 처리
	        System.out.println("회원 정보나 주소 정보가 비어 있습니다.");
	    }

	    String memberMailKey = memberVO.getMember_email_key();

	    rsp.setContentType("text/html; charset=utf-8");
	    PrintWriter pw = rsp.getWriter();

	    if (memberMailKey == null || !memberMailKey.equalsIgnoreCase(token)) {
	        // 토큰 값이 null이거나 일치하지 않는 경우
	        // 에러 처리
	        pw.append("<script>alert('이메일 인증 코드가 다릅니다!'); location.href='" + req.getContextPath()
	                + "/user/emailcheck.do'</script>");
	    } else {
	        // 이메일 인증에 성공한 경우
	        memberVO.setMember_email_yn(1);
	        int memberId = MemberService.insertMember(memberVO);
	        if (memberId > 0) {
	            addr.setMember_tb_idx(memberVO.getMember_idx());
	            AddressService.insert(addr);
	            System.out.println("idx 값 ::" + memberVO.getMember_idx());
	        }
	        pw.append("<script>alert('회원가입 성공!'); location.href='" + req.getContextPath() + "/'</script>");
	    }

	    // 세션에 저장된 정보 제거
	    session.removeAttribute("memberVO");
	    session.removeAttribute("addr");
	}
	
	//메일 다시보내기 처리
	@RequestMapping(value = "/resendVerificationEmail.do", method = RequestMethod.POST)
	@ResponseBody
	public String resendVerificationEmail(@RequestParam("email") String email) {
	    // 이메일 인증 링크 생성
	    String token = generateToken();
	    
	    // 이메일 전송
	    mailService.sendVerificationEmail(email, token);
	    
	    return "sueess.";
	}
		
	private String generateToken() {
	    SecureRandom random = new SecureRandom();
	    byte[] bytes = new byte[20];
	    random.nextBytes(bytes);
	    String token = Base64.getUrlEncoder().withoutPadding().encodeToString(bytes);
	    
	
	    
	    return token;
	}

	
}
