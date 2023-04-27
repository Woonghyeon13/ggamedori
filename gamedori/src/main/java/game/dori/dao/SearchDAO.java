package game.dori.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.dori.util.OTO_VO;
import game.dori.vo.MEMBER_VO;
import game.dori.vo.NOTICE_VO;
import game.dori.vo.QA_VO;

@Repository
public class SearchDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String namespace = "game.dori.mapper.searchMapper.";

	// 관리자페이지 멤버리스트 검색 기능
	public List<MEMBER_VO> mSearch(String searchText, String searchOption, int start, int limit) {
	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("searchText", searchText);
	    params.put("searchOption", searchOption);
	    params.put("start", start);
	    params.put("limit", limit);

	    return sqlSession.selectList(namespace + "mSearch", params);
	}
	
	// 멤버 검색 후 페이징에 쓸 갯수
	public int mCountSearchResults(String searchText, String searchOption) {
	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("searchText", searchText);
	    params.put("searchOption", searchOption);
	    
	    return sqlSession.selectOne(namespace + "mCountSearchResults", params);
	}
	
	
	// 관리자페이지 멤버리스트 검색 기능
	public List<OTO_VO> oto_search(String searchText, String searchOption, int start, int limit) {
	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("searchText", searchText);
	    params.put("searchOption", searchOption);
	    params.put("start", start);
	    params.put("limit", limit);

	    return sqlSession.selectList(namespace + "oto_search", params);
	}

	
	// 1 : 1 문의사항 검색 기능
	public int oto_countSearchResults(String searchText, String searchOption) {
	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("searchText", searchText);
	    params.put("searchOption", searchOption);
	    
	    return sqlSession.selectOne(namespace + "oto_countSearchResults", params);
	}	
	
	// 1 : 1 문의사항 글 검색 후 페이징

	
	// 공지사항 검색 기능
	public List<NOTICE_VO> notice_search(String searchText, String searchOption, int start, int limit) {
	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("searchText", searchText);
	    params.put("searchOption", searchOption);
	    params.put("start", start);
	    params.put("limit", limit);

	    return sqlSession.selectList(namespace + "notice_search", params);
	}
	
	// 공지사항 글 검색 후 페이징에 쓸 갯수
	public int notice_countSearchResults(String searchText, String searchOption) {
	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("searchText", searchText);
	    params.put("searchOption", searchOption);
	    
	    return sqlSession.selectOne(namespace + "notice_countSearchResults", params);
	}
}