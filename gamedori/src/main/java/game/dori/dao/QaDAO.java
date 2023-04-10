package game.dori.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.dori.vo.QA_VO;

@Repository
public class QaDAO {

	@Autowired
	private SqlSession sqlSession;
	
	//마이페이지 1:1문의 리스트 출력
	public List<QA_VO> selectList2(int member_idx){
		return sqlSession.selectList("game.dori.mapper.qaMapper.selectList2", member_idx);
	}
	
}
