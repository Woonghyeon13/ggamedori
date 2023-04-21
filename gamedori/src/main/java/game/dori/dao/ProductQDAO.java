package game.dori.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import game.dori.util.OTO_VO;
import game.dori.util.PROD_Q_LIST_VO;
import game.dori.vo.PRODUCTQQ_VO;
import game.dori.vo.PRODUCT_Q_VO;
import game.dori.vo.QA_VO;

@Repository
public class ProductQDAO {

	@Autowired
	private SqlSession sqlSession;
	private static String namespace = "game.dori.mapper.productQMapper.";
	
	//마이페이지 상품문의 리스트 출력
	public List<PRODUCTQQ_VO> selectQAList(int member_idx) {
		return sqlSession.selectList("game.dori.mapper.productQMapper.selectQAList", member_idx); //매개변수릉통해 인자로전달  쿼리에서사용
	}
	
	//관리자 페이지 상품문의 리스트 출력
	public List<PROD_Q_LIST_VO> list(){
		return sqlSession.selectList(namespace + "pqlist");
	}
	
	//상품문의 답변
	public int pqAnswer(PROD_Q_LIST_VO pqVO) {
		return sqlSession.update(namespace + "pqAnswer", pqVO);
	}
	

	// 상품 문의사항 글 등록
	public int prod_insert(PRODUCT_Q_VO product_Q_VO) {
		return sqlSession.insert("game.dori.mapper.productQMapper.prod_insert",product_Q_VO);
	}
	
	// 상품 문의사항 글 삭제
	public int prod_delete(int prod_q_idx) {
		return sqlSession.delete("game.dori.mapper.productQMapper.prod_delete",prod_q_idx);
	}
	
	// 상품 문의사항 글 개수 카운트
	public int prod_countAll()
	{
		return sqlSession.selectOne("game.dori.mapper.productQMapper.prod_countAll");
	}
	
	// 상품 문의사항 페이징
	public List<PRODUCT_Q_VO> prod_list(int prod_limit, int prod_start) {
	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("prod_limit", prod_limit);
	    params.put("prod_start", prod_start);

	    return sqlSession.selectList("game.dori.mapper.productQMapper.prod_selectAll", params);
	}
	
	// 상품 문의사항 검색 기능
	public int prod_countSearchResults(String prod_searchText, String prod_searchOption) {
	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("prod_searchText", prod_searchText);
	    params.put("prod_searchOption", prod_searchOption);
	    
	    return sqlSession.selectOne("game.dori.mapper.productQMapper.prod_countSearchResults", params);
	}	
	
	// 상품 문의사항 글 검색 후 페이징
	public List<PRODUCT_Q_VO> prod_search(String prod_searchText, String prod_searchOption, int prod_start, int prod_limit) {
	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("prod_searchText", prod_searchText);
	    params.put("prod_searchOption", prod_searchOption);
	    params.put("prod_start", prod_start);
	    params.put("prod_limit", prod_limit);

	    return sqlSession.selectList("game.dori.mapper.productQMapper.prod_search", params);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 상품 문의사항 상세보기
	public PRODUCT_Q_VO prod_select(int prod_q_idx) {
		return sqlSession.selectOne("game.dori.mapper.productQMapper.prod_select", prod_q_idx);
	}
	
	//상품문의 작성
	public int prodQinsert( PRODUCT_Q_VO pqvo ) {
		return sqlSession.insert("game.dori.mapper.productQMapper.prodQinsert",pqvo);
	}
	
	//상품문의 목록
	public List<PROD_Q_LIST_VO> prodQlist( int prod_idx ){
		return sqlSession.selectList("game.dori.mapper.productQMapper.prodQlist",prod_idx);
	}
	//상품문의 목록 카운트
	public int prodQlistCnt( int prod_idx ){
		return sqlSession.selectOne("game.dori.mapper.productQMapper.prodQlistCnt",prod_idx);
	}
}

// vo를 참조자료형으로사용해서 member_idx를 인자로 mapper를 호출해 쿼리문을실행 
// 메서드를사용한 service나 controller에 반환값 전달 