package game.dori.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.dori.vo.SAVEPOINT_VO;

@Repository
public class SavepointDAO {

	@Autowired
	private SqlSession sqlSession;
	
	//마이페이지 적립금 리스트 출력
	public List<SAVEPOINT_VO> selectSavePointList(int member_td_idx){
		return sqlSession.selectList("game.dori.mapper.savepointMapper.selectSavePointList", member_td_idx);
		
	
	}
	public int selectPointBalanceDAO(int member_tb_idx){
		return sqlSession.selectOne("game.dori.mapper.savepointMapper.selectPointBalance", member_tb_idx);
		
}
}
