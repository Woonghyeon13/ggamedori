package game.dori.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.dori.util.ORDER_LIST_VO;

@Repository
public class OrderListDAO {

	@Autowired
	private SqlSession sqlSession;
	private static String namespace = "game.dori.mapper.orderListMapper.";
	
	//주문내역 리스트
	public List<ORDER_LIST_VO> list(){
		return sqlSession.selectList(namespace + "orderlist");
	}
	
}
