package game.dori.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.dori.vo.ORDER_VO;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSession sqlSession;
	private static String namespace = "game.dori.mapper.orderMapper.";
	
	
	//마이페이지 주문내역 리스트 출력
	
	public List<ORDER_VO> selectOrderListDAO(int member_tb_idx)
	{
		return sqlSession.selectList(namespace + "selectOrderListMapper", member_tb_idx);
	}

}



