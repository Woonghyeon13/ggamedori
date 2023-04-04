package game.dori.controller;

import java.io.IOException;
import java.security.SecureRandom;
import java.util.Base64;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	

	
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String join( Model model , MEMBER_VO MemberVO , ADDRESS_VO addr, HttpServletRequest req , HttpServletResponse rsp) throws IOException {

		 // 이메일 인증 링크 생성
	    String token = generateToken();
	    MemberVO.setMember_mail_key(token);
			
		int memberId = MemberService.insert(MemberVO);
	    MemberVO.setMember_idx(memberId); // 이 부분을 추가하여 MEMBER_IDX를 설정합니다.
	    addr.setMember_tb_idx(memberId); // 이 부분을 추가하여 address_tb의 외래 키를 설정합니다.
	    AddressService.insert(addr);


	    // 이메일 전송
	    mailService.sendVerificationEmail(MemberVO.getMember_email(), token);

	    return "user/emailcheck";
	}
	
	
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public String mypage() {

		return "user/mypage";
	}
	
	@ResponseBody
	@RequestMapping(value="/checkID.do" ,method=RequestMethod.GET)
	public String checkID(MEMBER_VO MemberVO)
	{
		MEMBER_VO result = MemberService.selectByEmail(MemberVO.getMember_email());
		
		if(result != null)
		{
			return "0"; 
		}
		else 
		{
			return "1"; 
		}
	}
	

	@RequestMapping(value = "/emailCheck.do", method = RequestMethod.GET)
	public String emailCheck(@RequestParam("email") String email, @RequestParam("token") String token) {

		MEMBER_VO memberVO = MemberService.selectByEmail(email);

		if (memberVO == null) {
		    // 에러 처리
			System.out.println("membervo가 비어있습니다.");
		}

		String memberMailKey = memberVO.getMember_mail_key();

		if (memberMailKey == null || !memberMailKey.equalsIgnoreCase(token)) {
		    // 토큰 값이 null이거나 일치하지 않는 경우
		    // 에러 처리
			System.out.println("끄아아아아.");
			return "user/emailcheck";
		}
		
		System.out.println(memberVO.getMember_email());
		System.out.println(memberVO.getMember_mail_key());
		
		
		
		// 토큰 값이 일치하는 경우
		memberVO.setMember_mail_yn(1);
		MemberService.update(memberVO);
		System.out.println("회원가입이 성공하였습니다.");
		
		return "home";
	    
	    
	}


	
	private String generateToken() {
	    SecureRandom random = new SecureRandom();
	    byte[] bytes = new byte[20];
	    random.nextBytes(bytes);
	    String token = Base64.getUrlEncoder().withoutPadding().encodeToString(bytes);
	    
	
	    
	    return token;
	}

	
}
