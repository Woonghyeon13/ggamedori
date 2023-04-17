package game.dori.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.dori.vo.OPT_VO;

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
	public List<OPT_VO> optSelecet( int prod_idx ) {
		return sqlSession.selectList("game.dori.mapper.prodOptMapper.optSelecet",prod_idx);
	}
	// 상품 옵션 업데이트
	public int optModify( OPT_VO opt ) {
		return sqlSession.update("game.dori.mapper.prodOptMapper.optModify",opt);
	}
	// 상품 옵션 삭제
	public int optDel( int prod_idx ) {
		return sqlSession.delete("game.dori.mapper.prodOptMapper.optDel",prod_idx);
	}
}
