package game.dori.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import game.dori.service.AdminService;
import game.dori.service.MemberService;
import game.dori.vo.MEMBER_VO;
import game.dori.vo.NOTICE_VO;

@RequestMapping( value = "/customersc" )

@Controller
public class CustomerscController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

		
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MemberService MemberService;
	

	// 공지사항 리스트
		@RequestMapping(value = "/main.do", method = RequestMethod.GET)
		public String main(Model model)						
		{
		    return "customersc/main";
		}
		

		
	// 공지사항 작성
	@RequestMapping(value = "/notice_write.do", method = RequestMethod.GET)
	public String write() {
		
		return "customersc/notice_write";
		
	}	
	
	//공지사항 글 등록
	@RequestMapping(value = "/notice_write.do", method = RequestMethod.POST)
	public void write(NOTICE_VO noticeVO, HttpServletResponse rsp, String member_email, HttpServletRequest req, HttpSession session) throws IOException {
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
			+ "/customersc/main.do';</script>");
		}
	}
	
	// 공지사항 글 삭제
	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	public void delete(int notice_idx, HttpServletResponse rsp, HttpServletRequest req) throws IOException {
		System.out.println(notice_idx);
		int result = adminService.delete(notice_idx);
		rsp.setContentType("text/html; charset=utf-8");
		PrintWriter pw = rsp.getWriter();

		if(result > 0) {
		    pw.append("<script>alert('글 삭제 성공'); location.href='" + req.getContextPath()
		        + "/customersc/main.do';</script>");
		} else {
		    pw.append("<script>alert('글 삭제 실패'); location.href='" + req.getContextPath()
		        + "/customersc/view.do?notice_idx=" + notice_idx + "';</script>");
		}
	}
	
	
	// 공지사항 글 수정
	@RequestMapping(value = "/modify.do", method = RequestMethod.GET)
	public String modify(Model model, @RequestParam("notice_idx") int noticeIdx) {
	    NOTICE_VO noticeVO = adminService.select(noticeIdx);
	    model.addAttribute("noticeVO", noticeVO);
	    return "customersc/notice_modify";
	}
	
	@RequestMapping(value = "/modify.do", method = RequestMethod.POST)
	public void modfiy(NOTICE_VO noticeVO, String member_email,HttpServletResponse rsp, HttpServletRequest req) throws IOException {	
		
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
		        + "/customersc/main.do';</script>");
		} else {
		    pw.append("<script>alert('글 수정 실패'); location.href='" + req.getContextPath()
		        + "/customersc/view.do?notice_idx=" + noticeVO.getNotice_idx() + "';</script>");
		}
	}	

	
	// 공지사항 상세보기
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
	
	
	// 공지사항 자주묻는 질문 수정
	@RequestMapping( value = "/faq.do", method = RequestMethod.GET )
	public String faq()
	{
		return "customersc/faq";
	}
}
