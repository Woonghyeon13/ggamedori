package game.dori.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.dori.util.ORDER_LIST_VO;

@Repository
public class PayDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// 주문결제서 생성
	public int insertPay( ORDER_LIST_VO olvo ) {
		return sqlSession.insert("game.dori.mapper.payMapper.insertPay",olvo);
	};
}
