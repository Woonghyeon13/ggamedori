package game.dori.dao;

import java.util.List;

import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.dori.vo.NOTICE_VO;

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSession sqlSession;

	
	public int insert(NOTICE_VO vo) {
		return sqlSession.insert("game.dori.mapper.noticeMapper.insert",vo);
	}
	
	public List<NOTICE_VO> list(){
		return sqlSession.selectList("game.dori.mapper.noticeMapper.selectAll");	
	}
	
}
