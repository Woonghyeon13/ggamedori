package game.dori.controller;

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

import game.dori.service.AdminService;
import game.dori.service.MemberService;
import game.dori.vo.MEMBER_VO;
import game.dori.vo.NOTICE_VO;

@RequestMapping( value = "/customersc" )

@Controller
public class CustomerscController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MemberService MemberService;
	
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main(Model model) throws Exception {
	    List<NOTICE_VO> noticeList = adminService.list();
	    model.addAttribute("notice", noticeList);
	  
	    
	    
	    return "customersc/main";
	}
	
	// 공지사항 작성
	@RequestMapping(value = "/notice_write.do", method = RequestMethod.GET)
	public String write() {
		
		return "customersc/notice_write";
		
	}	
	
	@RequestMapping(value = "/notice_write.do", method = RequestMethod.POST)
	public void write(NOTICE_VO noticeVO,HttpServletResponse rsp,String member_email, HttpServletRequest req, HttpSession session) throws IOException{

		MEMBER_VO member = MemberService.selectByEmail(member_email);
		
		
		int result = 0;
		if(member.getMember_role() == 2)
		{
			noticeVO.setMember_tb_idx(member.getMember_idx());	
			result = adminService.insert(noticeVO);
		}
		
		 rsp.setContentType("text/html; charset=utf-8");
		 PrintWriter pw = rsp.getWriter();
		
		 if(result > 0)
		 {
			session.setAttribute("noticeVO", noticeVO);
			  pw.append("<script>alert('글작성 성공'); location.href='" + req.getContextPath()
              + "/'</script>");
		 }
		 
		
		
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
