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
	public List<OTO_VO> otolist(int limit, int start){
		Map<String, Object> params = new HashMap<String, Object>();
	    params.put("limit", limit);
	    params.put("start", start);
		return sqlSession.selectList(namespace + "otolist", params);
	}
	
	// 1 : 1 문의사항 페이징
	public List<QA_VO> list(int limit, int start) {
	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("limit", limit);
	    params.put("start", start);

	    return sqlSession.selectList("game.dori.mapper.qaMapper.oto_selectAll", params);
	}
	
	// 1 : 1 문의사항 검색 기능
	public int oto_countSearchResults(String searchText, String searchOption) {
	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("searchText", searchText);
	    params.put("searchOption", searchOption);
	    
	    return sqlSession.selectOne("game.dori.mapper.qaMapper.oto_countSearchResults", params);
	}	
	
	// 1 : 1 문의사항 글 검색 후 페이징
	public List<QA_VO> oto_search(String searchText, String searchOption, int start, int limit) {
	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("searchText", searchText);
	    params.put("searchOption", searchOption);
	    params.put("start", start);
	    params.put("limit", limit);

	    return sqlSession.selectList("game.dori.mapper.qaMapper.oto_search", params);
	}

	// 1 : 1문의사항 답변
	public int otoAnswer(OTO_VO otoVO) {
		return sqlSession.update(namespace + "otoAnswer", otoVO);
	}
	
//	// 내가 작성한 1:1 문의사항 리스트 조회
//    public List<QA_VO> otoListByMember(int member_Idx, int limit, int start){
//    	return sqlSession.selectList(namespace + "otoListByMember", member_Idx);
//    }
//
//    // 내가 작성한 1:1 문의사항 게시물 총 개수 조회
//    public int countOtoByMember(int member_Idx) {
//    	return sqlSession.selectOne(namespace + "countOtoByMember");
//    }
	
    
	
}
