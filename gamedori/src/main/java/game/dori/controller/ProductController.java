package game.dori.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import game.dori.service.ProductService;
import game.dori.vo.CATEGORY_VO;
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
		return "prod/detail";
	}

}
