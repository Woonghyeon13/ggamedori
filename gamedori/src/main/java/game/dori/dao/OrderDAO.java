package game.dori.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.dori.util.ORDER_LIST_VO;
import game.dori.vo.ORDER_VO;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSession sqlSession;
	private static String namespace = "game.dori.mapper.orderMapper.";
	
	
	//마이페이지 주문내역 리스트 출력
	public List<ORDER_VO> selectOrderListDAO(int member_tb_idx){
		return sqlSession.selectList(namespace + "selectOrderListMapper", member_tb_idx);
	}

	// 주문인덱스 생성
	public int insertOrder( ORDER_LIST_VO olvo ) {
		return sqlSession.insert("game.dori.mapper.orderMapper.insertOrder",olvo);
	}
	
	// 주문인덱스호출
	public int orderNum() {
		return sqlSession.selectOne("game.dori.mapper.orderMapper.orderNum");
	}
	
	//마이페이지 - 환불하기
	public int UpdateOrderStatus (int member_tb_idx) {
		return sqlSession.update("game.dori.mapper.orderMapper.UpdateOrderStatus", member_tb_idx);
	}
	
	
}



