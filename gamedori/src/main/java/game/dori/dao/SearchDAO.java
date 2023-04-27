package game.dori.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.dori.util.OTO_VO;
import game.dori.vo.MEMBER_VO;

@Repository
public class SearchDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// 총 회원 수 카운트
	public int mCountAll()
	{
		return sqlSession.selectOne("game.dori.mapper.searchMapper.mCountAll");
	}
	
	// 관리자페이지 멤버리스트 검색 기능
	public List<MEMBER_VO> mSearch(String searchText, String searchOption, int start, int limit) {
	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("searchText", searchText);
	    params.put("searchOption", searchOption);
	    params.put("start", start);
	    params.put("limit", limit);

	    return sqlSession.selectList("game.dori.mapper.searchMapper.mSearch", params);
	}
	
	// 멤버 검색 후 페이징에 쓸 갯수
	public int mCountSearchResults(String searchText, String searchOption) {
	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("searchText", searchText);
	    params.put("searchOption", searchOption);
	    
	    return sqlSession.selectOne("game.dori.mapper.searchMapper.mCountSearchResults", params);
	}
	
	// 총 1:1문의 카운트
	public int oto_countAll()
	{
		return sqlSession.selectOne("game.dori.mapper.searchMapper.oto_countAll");
	}
	
	// 관리자페이지 멤버리스트 검색 기능
	public List<OTO_VO> oto_search(String searchText, String searchOption, int start, int limit) {
	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("searchText", searchText);
	    params.put("searchOption", searchOption);
	    params.put("start", start);
	    params.put("limit", limit);

	    return sqlSession.selectList("game.dori.mapper.searchMapper.oto_search", params);
	}
	
	// 멤버 검색 후 페이징에 쓸 갯수
	public int oto_countSearchResults(String searchText, String searchOption) {
	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("searchText", searchText);
	    params.put("searchOption", searchOption);
	    
	    return sqlSession.selectOne("game.dori.mapper.searchMapper.oto_countSearchResults", params);
	}
	
}
