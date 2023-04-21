package game.dori.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.dori.vo.REVIEW_VO;

@Repository
public class ReviewDAO {

	@Autowired
	private SqlSession sqlSession;
	
	//마이페이지 리뷰 리스트 출력
	public List<REVIEW_VO> selectReviewList(int member_idx) {
	    return sqlSession.selectList("game.dori.mapper.reviewMapper.selectReviewList", member_idx );
	}
	
	//마이페이지 리뷰 개수
	public int ReviewCount(int member_td_idx){
		return sqlSession.selectOne("game.dori.mapper.reviewMapper.ReviewCount", member_td_idx);
	}

	
	//마이페이지 리뷰 서치 복붙1
	public List<REVIEW_VO> search(String R_searchValue, String R_searchType, int start, int limit) {
	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("R_searchValue", R_searchValue);
	    params.put("R_searchType", R_searchType);
	    params.put("start", start);
	    params.put("limit", limit);

	    return sqlSession.selectList("game.dori.mapper.reviewMapper.search", params);
	}
	
	//마이페이지 리뷰 서치 복붙2
	public int countSearchResults(String R_searchValue, String R_searchType) {
	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("R_searchValue", R_searchValue);
	    params.put("R_searchType", R_searchType);
	    
	    return sqlSession.selectOne("game.dori.mapper.reviewMapper.countSearchResults", params);
	}
	
	
}
