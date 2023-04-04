package game.dori.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping( value = "/prod")
@Controller
public class ProductController {

	// 상품 목록
	@RequestMapping( value = "/list.do", method = RequestMethod.GET )
	public String list()
	{
		return "prod/list";
	}

	// 상품 상세
	@RequestMapping( value = "/detail.do", method = RequestMethod.GET )
	public String detail()
	{
		return "prod/detail";
	}
}
