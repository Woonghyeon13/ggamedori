package game.dori.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.dori.util.ORDER_LIST_VO;

@Repository
public class RefundDAO {

	@Autowired
	private SqlSession sqlSession;
	private static String namespace = "game.dori.mapper.refundMapper.";
	
	public List<ORDER_LIST_VO> refundlist(int limit, int start){
		Map<String, Object> params = new HashMap<String, Object>();
	    params.put("limit", limit);
	    params.put("start", start);
		
		return sqlSession.selectList(namespace + "refundlist", params);
	}
	
	//환불 승인 여부 업데이트
	public int updateRefundYN(ORDER_LIST_VO orderlistVO) {
		return sqlSession.update(namespace + "updateRefundYN", orderlistVO);
	
	}
	
}
