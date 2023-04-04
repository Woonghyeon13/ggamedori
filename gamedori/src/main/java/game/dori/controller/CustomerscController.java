package game.dori.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping( value = "/customersc" )
@Controller
public class CustomerscController {

	
	// 고객센터
	@RequestMapping( value = "/main.do", method = RequestMethod.GET )
	public String main()
	{
		return "customersc/main";
	}
	
	// 글 보기
	@RequestMapping( value = "/view.do", method = RequestMethod.GET )
	public String view()
	{
		return "customersc/view";
	}
	
	// 자주 묻는 질문
	@RequestMapping( value = "/faq.do", method = RequestMethod.GET )
	public String faq()
	{
		return "customersc/faq";
	}
}
