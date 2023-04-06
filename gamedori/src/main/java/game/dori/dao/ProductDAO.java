package game.dori.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.dori.vo.PRODUCT_VO;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public void prodInsert( PRODUCT_VO pvo )
	{
		sqlSession.insert("game.dori.mapper.productMapper.prodInsert",pvo);
	}
}
