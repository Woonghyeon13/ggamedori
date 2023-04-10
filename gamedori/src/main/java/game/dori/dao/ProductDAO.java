package game.dori.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<PRODUCT_VO> list( PRODUCT_VO pvo){
		return sqlSession.selectList("game.dori.mapper.productMapper.prodSelectAll",pvo);
	}
	
	// 상품 수정
	public int pordUpdate( PRODUCT_VO pvo ) {
		return sqlSession.update("game.dori.mapper.productMapper.prodUpdate",pvo);
	}
	
	// 상품 상세
	public PRODUCT_VO prodSelectOne( int prod_idx ) {
		return sqlSession.selectOne("game.dori.mapper.productMapper.prodSelectOne",prod_idx);
	}
}
