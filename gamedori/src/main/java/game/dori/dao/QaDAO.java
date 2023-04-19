package game.dori.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.dori.util.OTO_VO;
import game.dori.vo.QA_VO;

@Repository
public class QaDAO {

	@Autowired
	private SqlSession sqlSession;
	private static String namespace = "game.dori.mapper.qaMapper.";
	
	

	//마이페이지 1:1문의사항 리스트 출력
	public List<QA_VO> selectOtoList(int member_idx){
		return sqlSession.selectList("game.dori.mapper.qaMapper.selectOtoList", member_idx);
	}
	
	// 마이페이지 1 : 1 문의사항 리스트 역순으로 출력
	public List<QA_VO> selectOtoListD(int qa_idx){
		return sqlSession.selectList("game.dori.mapper.qaMapper.selectOtoListD", qa_idx);
	}
	
	// 1 : 1 문의사항 글 등록
	public int oto_insert(QA_VO qaVO) {
		return sqlSession.insert("game.dori.mapper.qaMapper.oto_insert", qaVO);
	}
	
	//  1 : 1 문의사항 글 삭제
	public int oto_delete(int qa_idx) {
		return sqlSession.delete("game.dori.mapper.qaMapper.oto_delete", qa_idx);
	}
	
	// 1 : 1 문의사항 상세보기
	public QA_VO oto_select(int qa_idx) {
		return sqlSession.selectOne("game.dori.mapper.qaMapper.oto_select", qa_idx);
	}
	
	// 1 : 1 문의사항 글 개수 카운트
	public int oto_countAll()
	{
		return sqlSession.selectOne("game.dori.mapper.qaMapper.oto_countAll");
	}
	// 1 : 1 문의사항 리스트 출력
	public List<OTO_VO> list(){
		return sqlSession.selectList(namespace + "otolist");
	}
	
	// 1 : 1 문의사항 페이징
	public List<QA_VO> list(int oto_limit, int oto_start) {
	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("oto_limit", oto_limit);
	    params.put("oto_start", oto_start);

	    return sqlSession.selectList("game.dori.mapper.qaMapper.oto_selectAll", params);
	}
	
	// 1 : 1 문의사항 검색 기능
	public int oto_countSearchResults(String oto_searchText, String oto_searchOption) {
	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("oto_searchText", oto_searchText);
	    params.put("oto_searchOption", oto_searchOption);
	    
	    return sqlSession.selectOne("game.dori.mapper.qaMapper.oto_countSearchResults", params);
	}	
	
	// 1 : 1 문의사항 글 검색 후 페이징
	public List<QA_VO> oto_search(String oto_searchText, String oto_searchOption, int oto_start, int oto_limit) {
	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("oto_searchText", oto_searchText);
	    params.put("oto_searchOption", oto_searchOption);
	    params.put("oto_start", oto_start);
	    params.put("oto_limit", oto_limit);

	    return sqlSession.selectList("game.dori.mapper.qaMapper.oto_search", params);
	}
	

	// 1 : 1문의사항 답변
	public int otoAnswer(OTO_VO otoVO) {
		return sqlSession.update(namespace + "otoAnswer", otoVO);
	}
	

	
	
}
