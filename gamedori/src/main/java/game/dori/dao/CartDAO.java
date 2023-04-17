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
	
	public List<CARTP_VO> selectCartListDAO(int member_idx)
	{
		return sqlSession.selectList(namespace+"selectCartListMapper",member_idx);
		
	}
	
	
}
