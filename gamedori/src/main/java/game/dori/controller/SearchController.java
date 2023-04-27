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
import game.dori.service.SearchService;
import game.dori.util.OTO_VO;
import game.dori.vo.MEMBER_VO;
import game.dori.vo.NOTICE_VO;

@Controller
public class SearchController {

	@Autowired
	private SearchService searchService;
	
	
	
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
	            searchResults = searchService.mSearch(searchText, searchOption, start, limit);
	            totalResults = searchService.mCountSearchResults(searchText, searchOption);
	            break;
	        case "notice":
	            searchResults = searchService.notice_search(searchText, searchOption, start, limit);
	            totalResults = searchService.notice_countSearchResults(searchText, searchOption);
	            break;
	        case "oto":
	            searchResults = searchService.oto_search(searchText, searchOption, start, limit);
	            totalResults = searchService.oto_countSearchResults(searchText, searchOption);
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
