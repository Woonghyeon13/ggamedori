package game.dori.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.dori.util.ORDER_LIST_VO;

@Repository
public class OrderDetailDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// 주문상세상품 등록
	public int insertOrderDetail( ORDER_LIST_VO olvo ) {
		return sqlSession.insert("game.dori.mapper.orderDetailMapper.insertOrderDetail",olvo);
	}
}
