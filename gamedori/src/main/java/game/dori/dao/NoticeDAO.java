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

	
	public int insert(NOTICE_VO noticeVO) {
		return sqlSession.insert("game.dori.mapper.noticeMapper.insert",noticeVO);
	}
	
	public List<NOTICE_VO> list(){
		return sqlSession.selectList("game.dori.mapper.noticeMapper.selectAll");	
	}
	
	public NOTICE_VO select(int notice_idx)
	{
		return sqlSession.selectOne("game.dori.mapper.noticeMapper.select", notice_idx);
	}
	
	
	public int delete(int notice_idx)
	{
		
		return sqlSession.delete("game.dori.mapper.noticeMapper.delete", notice_idx);
	}
	
	
	public int modfiy(NOTICE_VO noticeVO)
	{	
		
		return sqlSession.update("game.dori.mapper.noticeMapper.modify", noticeVO);
		
	}
	
}
