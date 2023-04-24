package game.dori.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.dori.vo.MEMBER_VO;
import game.dori.vo.SAVEPOINT_VO;

@Repository
public class SavepointDAO {

	@Autowired
	private SqlSession sqlSession;
	
	//마이페이지 적립금 리스트 출력
	public List<SAVEPOINT_VO> selectSavePointList(int member_td_idx){
		return sqlSession.selectList("game.dori.mapper.savepointMapper.selectSavePointList", member_td_idx);
	}
	
	//마이페이지 상단 적립금 출력
	public int selectPointBalanceService(int member_td_idx) {
		return sqlSession.selectOne("game.dori.mapper.savepointMapper.selectPointBalance", member_td_idx);
	}
	
	//마이페이지 누적 적립금 출력
	public int selectPointAmount(int member_td_idx){
		return sqlSession.selectOne("game.dori.mapper.savepointMapper.selectPointAmount", member_td_idx);
	}
	
	
	public int deletePoint(MEMBER_VO MemberVO)
	{
		return sqlSession.delete("game.dori.mapper.savepointMapper.deletePoint", MemberVO);
	}
	
	// 회원 잔여 포인트
	public int selectPointBal( int member_idx ) {
		return sqlSession.selectOne("game.dori.mapper.savepointMapper.selectPointBal",member_idx);
	}
}
