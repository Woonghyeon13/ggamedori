package game.dori.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public List<NOTICE_VO> list(int limit, int start) {
	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("limit", limit);
	    params.put("start", start);

	    return sqlSession.selectList("game.dori.mapper.noticeMapper.selectAll", params);
	}
	
	public int countAll()
	{
		return sqlSession.selectOne("game.dori.mapper.noticeMapper.countAll");
	}
	
	public List<NOTICE_VO> search(String searchText, String searchOption) {
	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("searchText", searchText);
	    params.put("searchOption", searchOption);

	    return sqlSession.selectList("game.dori.mapper.noticeMapper.search", params);
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
	
	public int update_Hit(NOTICE_VO noticeVO)
	{
		return sqlSession.update("game.dori.mapper.noticeMapper.updateHit", noticeVO);
	}
	
}
