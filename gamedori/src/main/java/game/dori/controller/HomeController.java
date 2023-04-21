package game.dori.controller;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import game.dori.service.AdminService;
import game.dori.vo.AD_VO;
import game.dori.vo.CAROUSEL_VO;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private AdminService AdminService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		//캐러셀 리스트(최신순 5개만 나오게 sql 작성)
		List<CAROUSEL_VO> clist = AdminService.clist();
	
		model.addAttribute("clist", clist);
		
		//광고 리스트(최신순 2개만 나오게 sql문 작성)
		List<AD_VO> adlist = AdminService.adlist();
		
		model.addAttribute("adlist", adlist);
		
		return "home";
	}
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public String rehome( Model model) {
		
		return "home";
	}
	
}
