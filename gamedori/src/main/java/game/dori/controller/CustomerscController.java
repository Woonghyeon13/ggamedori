package game.dori.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import game.dori.service.AdminService;
import game.dori.vo.MEMBER_VO;
import game.dori.vo.NOTICE_VO;

@RequestMapping( value = "/customersc" )

@Controller
public class CustomerscController {
	
	@Autowired
	private AdminService adminService;
	
	
	@RequestMapping( value = "/main.do", method = RequestMethod.GET )
	public String main(Model model, NOTICE_VO nvo) throws Exception 
	{
		List<NOTICE_VO> list = adminService.list(nvo);
		
		model.addAttribute("main", adminService.list(nvo));
		
		return "customersc/main";
	}
	
	// 공지사항 작성
	@RequestMapping(value = "/notice_write.do", method = RequestMethod.GET)
	public String write() {
		
		return "customersc/notice_write";
		
	}	
	
	@RequestMapping(value = "/notice_write.do", method = RequestMethod.POST)
	public String write(NOTICE_VO vo, HttpServletRequest req){

		
		return "redirect:/customersc/main.do?notice_idx="+vo.getNotice_idx();
		
	}
	
	// 공지사항 상세보기
	@RequestMapping( value = "/view.do", method = RequestMethod.GET )
	public String view()
	{
		return "customersc/view";
	}
	
	// 공지사항 자주묻는 질문
	@RequestMapping( value = "/faq.do", method = RequestMethod.GET )
	public String faq()
	{
		return "customersc/faq";
	}
}
