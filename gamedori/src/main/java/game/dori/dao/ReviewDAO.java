package game.dori.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.dori.vo.REVIEW_Search_VO;
import game.dori.vo.REVIEW_VO;

@Repository
public class ReviewDAO {

	@Autowired
	private SqlSession sqlSession;
	
	//마이페이지 리뷰 리스트 출력
	public List<REVIEW_VO> selectList3(int member_idx, REVIEW_Search_VO search) {
	    if (search == null || search.getR_searchType() == null || search.getR_searchType().isEmpty()) {
	    	return sqlSession.selectList("game.dori.mapper.reviewMapper.selectList3", member_idx );
	    } else {
	    	return sqlSession.selectList("game.dori.mapper.reviewMapper.selectList3_R", search);
	    }
	}

		
	//마이페이지 리뷰 개수
	public int selectListCount2(int member_td_idx){
		
		return sqlSession.selectOne("game.dori.mapper.reviewMapper.selectListCount2", member_td_idx);
	}
		
}
