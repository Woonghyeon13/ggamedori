package game.dori.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.dori.vo.CATEGORY_VO;
import game.dori.vo.PRODUCT_VO;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// 상품 등록
	public int prodInsert( PRODUCT_VO pvo )	{
		return sqlSession.insert("game.dori.mapper.productMapper.prodInsert",pvo);
	}
	
	// 상품 목록
	public List<PRODUCT_VO> list( CATEGORY_VO cvo ){
		return sqlSession.selectList("game.dori.mapper.productMapper.prodSelectAll",cvo);
	}
	// 상품 목록 카운트
	public int listCnt( CATEGORY_VO cvo ){
		return sqlSession.selectOne("game.dori.mapper.productMapper.listCnt",cvo);
	}

	// 상품 수정
	public int pordUpdate( PRODUCT_VO pvo ) {
		return sqlSession.update("game.dori.mapper.productMapper.prodUpdate",pvo);
	}
	
	// 상품 삭제
	public int pordDelete( int prod_idx ) {
		return sqlSession.delete("game.dori.mapper.productMapper.prodDelete",prod_idx);
	}
	
	// 상품 상세
	public PRODUCT_VO prodSelectOne( int prod_idx ) {
		return sqlSession.selectOne("game.dori.mapper.productMapper.prodSelectOne",prod_idx);
	}
}
