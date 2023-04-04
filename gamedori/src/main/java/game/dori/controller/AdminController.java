package game.dori.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping( value = "/admin" )
@Controller
public class AdminController {

	// 회원관리
	@RequestMapping( value = "/member.do", method = RequestMethod.GET )
	public String member(){
		return "admin/member";
	}

	// 상품관리
	@RequestMapping( value = "/prod.do", method = RequestMethod.GET )
	public String prod(){
		return "admin/prod";
	}

	// 반품관리
	@RequestMapping( value = "/asreturn.do", method = RequestMethod.GET )
	public String asreturn(){
		return "admin/asreturn";
	}

	// 환불관리
	@RequestMapping( value = "/asrefund.do", method = RequestMethod.GET )
	public String asrefund(){
		return "admin/asrefund";
	}
	
	// 공지사항 관리
	@RequestMapping( value = "/notice.do", method = RequestMethod.GET )
	public String notice(){
		return "admin/notice";
	}
	
	// 1:1문의 관리
	@RequestMapping( value = "/oto.do", method = RequestMethod.GET )
	public String oto(){
		return "admin/oto";
	}
	
	// 상품문의 관리
	@RequestMapping( value = "/qaprod.do", method = RequestMethod.GET )
	public String qaprod(){
		return "admin/qaprod";
	}
}
