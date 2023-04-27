package game.dori.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.dori.vo.CARTP_VO;
import game.dori.vo.CART_VO;

@Repository
public class CartDAO {

	@Autowired
	private SqlSession sqlSession;
	private static String namespace = "game.dori.mapper.CartMapper.";
	
	public List<CART_VO> selectCartListDAO(int member_idx)
	{
		return sqlSession.selectList(namespace+"selectCartListMapper",member_idx);
		
	}
	
	/* 상품 상세페이지에서 장바구니 담기 */
	public int insertCart( CART_VO cvo ) {
		return sqlSession.insert("game.dori.mapper.CartMapper.insertCart",cvo);
	}
	
	/* 카트 삭제 */
	public int cartDel( int cart_idx ) {
		return sqlSession.delete("game.dori.mapper.CartMapper.cartDel",cart_idx);
	}
	
	/* 장바구니 옵션수정 */
	public int cartModify( CART_VO cvo ) {
		return sqlSession.update("game.dori.mapper.CartMapper.cartModify",cvo);
	}
}
