package game.dori.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.dori.vo.MEMBER_VO;
import game.dori.vo.NOTICE_VO;

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSession sqlSession;

	// 공지사항 글 등록
	public int insert(NOTICE_VO noticeVO) {
		return sqlSession.insert("game.dori.mapper.noticeMapper.insert",noticeVO);
	}
	
	// 공지사항 페이징
	public List<NOTICE_VO> list(int limit, int start) {
	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("limit", limit);
	    params.put("start", start);

	    return sqlSession.selectList("game.dori.mapper.noticeMapper.selectAll", params);
	}
	
	// 공지사항 글 개수
	public int countAll()
	{
		return sqlSession.selectOne("game.dori.mapper.noticeMapper.countAll");
	}
	
	// 공지사항 검색 기능
	public List<NOTICE_VO> search(String searchText, String searchOption, int start, int limit) {
	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("searchText", searchText);
	    params.put("searchOption", searchOption);
	    params.put("start", start);
	    params.put("limit", limit);

	    return sqlSession.selectList("game.dori.mapper.noticeMapper.search", params);
	}
	
	// 공지사항 글 검색 후 페이징에 쓸 갯수
	public int countSearchResults(String searchText, String searchOption) {
	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("searchText", searchText);
	    params.put("searchOption", searchOption);
	    
	    return sqlSession.selectOne("game.dori.mapper.noticeMapper.countSearchResults", params);
	}
	
	// 공지사항 상세보기
	public NOTICE_VO select(int notice_idx)
	{
		return sqlSession.selectOne("game.dori.mapper.noticeMapper.select", notice_idx);
	}
	
	// 공지사항 글 삭제
	public int delete(int notice_idx)
	{
		return sqlSession.delete("game.dori.mapper.noticeMapper.delete", notice_idx);
	}
	
	// 공지사항 글 삭제?
	public int deleteAll(MEMBER_VO MemberVO)
	{
		return sqlSession.delete("game.dori.mapper.noticeMapper.delete", MemberVO);
	}
	
	// 공지사항 글 수정
	public int modify(NOTICE_VO noticeVO)
	{		
		return sqlSession.update("game.dori.mapper.noticeMapper.modify", noticeVO);	
	}
	
	// 공지사항 조회수
	public int update_Hit(NOTICE_VO noticeVO)
	{
		return sqlSession.update("game.dori.mapper.noticeMapper.updateHit", noticeVO);
	}
	
}
