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
import game.dori.vo.NOTICE_VO;

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
	
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> search(@RequestParam("searchType") String searchType,
	                                                  @RequestParam("searchText") String searchText,
	                                                  @RequestParam("searchOption") String searchOption,
	                                                  @RequestParam(value = "page", defaultValue = "1") int page) {
	    int limit = 15;
	    int start = (page - 1) * limit;
	    int totalResults = 0;
	    List<?> searchResults = null;

	    switch (searchType) {
	        case "member":
	            searchResults = adminService.memberSearch(searchText, searchOption, start, limit);
	            totalResults = adminService.mCountSearchResults(searchText, searchOption);
	            break;
	        case "notice":
	            searchResults = adminService.searchNotices(searchText, searchOption, start, limit);
	            totalResults = adminService.countSearchResults(searchText, searchOption);
	            break;
	        case "oto":
	            searchResults = adminService.oto_search(searchText, searchOption, start, limit);
	            totalResults = adminService.oto_countSearchResults(searchText, searchOption);
	            break;
	            
	        default:
	            return new ResponseEntity<>(HttpStatus.BAD_REQUEST); // 잘못된 searchType이 입력되면 BadRequest를 반환합니다.
	    }

	    int totalPages = (int) Math.ceil((double) totalResults / limit);

	    Map<String, Object> response = new HashMap<>();
	    response.put("searchResults", searchResults);
	    response.put("totalPages", totalPages);

	    return new ResponseEntity<>(response, HttpStatus.OK);
	}
		
}