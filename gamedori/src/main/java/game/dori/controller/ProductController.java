package game.dori.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.javassist.bytecode.annotation.MemberValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import game.dori.service.ProductService;
import game.dori.util.ORDER_LIST_VO;
import game.dori.util.PROD_Q_LIST_VO;
import game.dori.vo.ADDRESS_VO;
import game.dori.vo.CATEGORY_VO;
import game.dori.vo.MEMBER_VO;
import game.dori.vo.OPT_VO;
import game.dori.vo.PRODUCT_Q_VO;
import game.dori.vo.PRODUCT_VO;

@RequestMapping( value = "/prod")
@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	
	// 상품 목록
	@RequestMapping( value = "/list.do", method = RequestMethod.GET )
	public String list( Model model, PRODUCT_VO pvo, CATEGORY_VO cvo ) {
		
		List<PRODUCT_VO> plist = productService.list(cvo);
		model.addAttribute("plist",plist);
		
		int listCnt = productService.listCnt(cvo);
		model.addAttribute("listCnt",listCnt);
		System.out.println(listCnt);
		
		return "prod/list";
	}

	// 상품 상세
	@RequestMapping( value = "/detail.do", method = RequestMethod.GET )
	public String detail( int prod_idx, Model model)
	{
		PRODUCT_VO pvo = productService.prodSelectOne(prod_idx);
		model.addAttribute("pvo",pvo);
		List<PROD_Q_LIST_VO> pqllist = productService.prodQlist(prod_idx);
		model.addAttribute("pqllist",pqllist);
		int pqlCnt = productService.prodQlistCnt(prod_idx);
		model.addAttribute("pqlCnt",pqlCnt);
		List<OPT_VO> optlist = productService.optSelect(prod_idx);
		model.addAttribute("optlist",optlist);
		
		return "prod/detail";
	}
	
	
	// 주문폼
	@RequestMapping( value = "/orderForm.do", method = RequestMethod.GET )
	public String orderForm( int prod_idx, MEMBER_VO memberVO ,HttpSession session,  Model model ){
		MEMBER_VO Login = (MEMBER_VO) session.getAttribute("Login");
		MEMBER_VO memvo = productService.orderMem(Login);
		model.addAttribute("memvo",memvo);
		ADDRESS_VO adr = productService.selectMemAddr(memvo);
		model.addAttribute("adr",adr);
		PRODUCT_VO pvo = productService.prodSelectOne(prod_idx);
		model.addAttribute("pvo",pvo);
		List<OPT_VO> optlist = productService.optSelect(prod_idx);
		model.addAttribute("optlist",optlist);
		
		return "prod/orderForm";
	}
	// 주문포스트
	@RequestMapping( value = "/orderForm.do", method = RequestMethod.POST)
	public void orderForm( ORDER_LIST_VO olvo ) {
		
	}
	

	// 상품 문의 등록
	@RequestMapping( value = "/detail.do", method = RequestMethod.POST )
	public void detail( PRODUCT_Q_VO pqvo, HttpServletResponse rsp ) throws IOException {
		
		int result = productService.prodQinsert(pqvo);
		System.out.println("멤버인덱스"+pqvo.getMember_tb_idx());
		rsp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = rsp.getWriter();
		
		if( result > 0 ) {
			pw.append("<script>alert('등록완료');location.href='detail.do?prod_idx="+pqvo.getProduct_tb_idx()+"'</script>");
		}else {
			pw.append("<script>alert('등록실패');location.href='detail.do?prod_idx="+pqvo.getProduct_tb_idx()+"'</script>");
		}
		pw.flush();
	}

}
