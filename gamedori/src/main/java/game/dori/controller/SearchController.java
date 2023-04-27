package game.dori.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import game.dori.service.AdminService;
import game.dori.service.MemberService;
import game.dori.service.ProductService;
import game.dori.util.OTO_VO;
import game.dori.vo.MEMBER_VO;

@Controller
public class SearchController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MemberService MemberService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AdminService AdminService;
	
	
	//관리자페이지 멤버 검색 기능
	@RequestMapping(value = "/admin/memberSearch.do", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> searchMember(@RequestParam("searchText") String searchText,
	                                                        @RequestParam("searchOption") String searchOption,
	                                                        @RequestParam(value = "page", defaultValue = "1") int page) {
	    int limit = 15; // 페이지당 게시물 수
	    int start = (page - 1) * limit;

	    List<MEMBER_VO> searchResults = adminService.memberSearch(searchText, searchOption, start, limit);
	    
	    int totalResults = 0;
	    if (searchText.trim().equals("") && searchOption.trim().equals("")) {
	        totalResults = adminService.mCountAll(); // 전체 게시물 수
	    } else {
	        totalResults = adminService.mCountSearchResults(searchText, searchOption); // 검색 결과에 따른 전체 게시물 수
	    }
	    int totalPages = (int) Math.ceil((double) totalResults / limit); // 전체 페이지 수 계산

	    Map<String, Object> response = new HashMap<String, Object>();
	    response.put("searchResults", searchResults);
	    response.put("totalPages", totalPages);

	    return new ResponseEntity<Map<String, Object>>(response, HttpStatus.OK);
	}
	
	//관리자페이지 멤버 검색 기능
	@RequestMapping(value = "/admin/otoSearch.do", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> searchOTO(@RequestParam("searchText") String searchText,
	                                                        @RequestParam("searchOption") String searchOption,
	                                                        @RequestParam(value = "page", defaultValue = "1") int page) {
	    int limit = 15; // 페이지당 게시물 수
	    int start = (page - 1) * limit;

	    List<OTO_VO> searchResults = adminService.oto_search(searchText, searchOption, start, limit);
	    
	    int totalResults = 0;
	    if (searchText.trim().equals("") && searchOption.trim().equals("")) {
	        totalResults = adminService.oto_countAll(); // 전체 게시물 수
	    } else {
	        totalResults = adminService.oto_countSearchResults(searchText, searchOption); // 검색 결과에 따른 전체 게시물 수
	    }
	    int totalPages = (int) Math.ceil((double) totalResults / limit); // 전체 페이지 수 계산

	    Map<String, Object> response = new HashMap<String, Object>();
	    response.put("searchResults", searchResults);
	    response.put("totalPages", totalPages);

	    return new ResponseEntity<Map<String, Object>>(response, HttpStatus.OK);
	}
		
}
