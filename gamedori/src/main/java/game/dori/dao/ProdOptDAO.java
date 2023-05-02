package game.dori.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.dori.util.PRODOPT_VO;
import game.dori.vo.OPT_VO;
import game.dori.vo.ORDER_DETAIL_VO;

@Repository
public class ProdOptDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// 상품 옵션 등록
	public int optInsert( OPT_VO opt ){
		return sqlSession.insert("game.dori.mapper.prodOptMapper.optInsert",opt);
	}
	// 상품 옵션 등록
	public int optInsertt( List<OPT_VO> optlist ){
		return sqlSession.insert("game.dori.mapper.prodOptMapper.optInsertt",optlist);
	}
	// 상품 인덱스
	public int optIdx() {
		return sqlSession.selectOne("game.dori.mapper.prodOptMapper.optIdx");
	}
	// 상품 옵션 조회
	public List<OPT_VO> optSelect( int prod_idx ) {
		return sqlSession.selectList("game.dori.mapper.prodOptMapper.optSelect",prod_idx);
	}
	// 상품 선택 옵션 조회
	public OPT_VO optSelectOne( int opt_idx ) {
		return sqlSession.selectOne("game.dori.mapper.prodOptMapper.optSelectOne",opt_idx);
	}
	// 상품 옵션 업데이트
	public int optModify( OPT_VO opt ) {
		return sqlSession.update("game.dori.mapper.prodOptMapper.optModify",opt);
	}
	// 상품 옵션상태 업데이트
	public int optStateModify( OPT_VO opt ) {
		return sqlSession.update("game.dori.mapper.prodOptMapper.updateOptState",opt);
	}
	// 상품 옵션 삭제
	public int optDel( int prod_idx ) {
		return sqlSession.delete("game.dori.mapper.prodOptMapper.optDel",prod_idx);
	}
	// 상품 옵션 삭제
	public int optDelOne( int opt_idx ) {
		return sqlSession.delete("game.dori.mapper.prodOptMapper.optDelOne",opt_idx);
	}
	// 상품옵션 상세정보 목록
	public PRODOPT_VO prodOptSelect( int opt_idx ){
		return sqlSession.selectOne("game.dori.mapper.prodOptMapper.prodOptSelect",opt_idx);
	}
	// 상품 옵션 재고 감소
	public int optStockMinus( OPT_VO povo ) {
		return sqlSession.update("game.dori.mapper.prodOptMapper.optStockMinus",povo);
	}
}
