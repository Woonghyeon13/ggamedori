package game.dori.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import game.dori.service.ProductService;
import game.dori.util.PROD_Q_LIST_VO;
import game.dori.vo.CATEGORY_VO;
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
