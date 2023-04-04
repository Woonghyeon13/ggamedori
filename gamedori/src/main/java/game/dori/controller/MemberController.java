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

	    int memberId = MemberService.insert(MemberVO);
	    MemberVO.setMember_idx(memberId); // 이 부분을 추가하여 MEMBER_IDX를 설정합니다.
	    addr.setMember_tb_idx(memberId); // 이 부분을 추가하여 address_tb의 외래 키를 설정합니다.
	    AddressService.insert(addr);

	    // 이메일 인증 링크 생성
	    String token = generateToken();
	    MemberVO.setMember_mail_key(token);
	    MemberService.update(MemberVO);

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
	
	@RequestMapping("/register.do")
	public String register(MEMBER_VO memberVO) {
	    // 서비스 레이어의 insertMember 메서드를 호출하여 회원 정보를 삽입합니다.
	    int memberIdx = MemberService.insertMember(memberVO);

	    // 삽입 작업의 성공 여부를 확인하고 적절한 응답을 반환합니다.
	    if (memberIdx > 0) {
	        // 회원 가입이 성공한 경우, 예를 들어 로그인 페이지로 리다이렉트합니다.
	        return "redirect:/home";
	    } else {
	        // 회원 가입이 실패한 경우, 예를 들어 에러 페이지를 표시합니다.
	        return "error";
	    }
	}
	@RequestMapping(value = "/emailCheck.do", method = RequestMethod.GET)
	public String emailCheck(@RequestParam("email") String email, @RequestParam("token") String token) {

	    // 이메일 주소를 사용하여 사용자 정보 가져오기
	    MEMBER_VO memberVO = MemberService.selectByEmail(email);

	    // 멤버의 이메일 키 가져오기
	    String memberMailKey = memberVO.getMember_mail_key();

	    // 멤버의 이메일 키와 인증 토큰 비교
	    if (memberMailKey.equals(token)) {
	        // 값이 같을 경우 인증 상태 업데이트
	        memberVO.setMember_mail_yn(1);
	        MemberService.update(memberVO);

	        // 인증 성공 페이지로 리다이렉션
	        return "redirect:/register.do";
	    } else {
	        // 값이 다를 경우 인증 실패 페이지로 리다이렉션
	        return "redirect:/util/join.do";
	    }
	}


	
	private String generateToken() {
	    SecureRandom random = new SecureRandom();
	    byte[] bytes = new byte[20];
	    random.nextBytes(bytes);
	    String token = Base64.getUrlEncoder().withoutPadding().encodeToString(bytes);
	    
	
	    
	    return token;
	}

	
}