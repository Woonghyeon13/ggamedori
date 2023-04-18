package game.dori.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.dori.vo.CART_VO;
import game.dori.vo.WISHLIST_VO;

@Repository
public class WishlistDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public List<WISHLIST_VO> selectWishlist(int member_idx)
	{
		return sqlSession.selectList("game.dori.mapper.wishlistMapper.selectWishlist", member_idx);
	}
	
	public void addCart(CART_VO cart) {
		sqlSession.insert("game.dori.mapper.wishlistMapper.addCart", cart);
	}
	
	
}
