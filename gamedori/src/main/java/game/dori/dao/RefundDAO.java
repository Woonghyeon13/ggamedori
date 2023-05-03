package game.dori.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.dori.util.ORDER_LIST_VO;

@Repository
public class RefundDAO {

	@Autowired
	private SqlSession sqlSession;
	private static String namespace = "game.dori.mapper.refundMapper.";
	
	public List<ORDER_LIST_VO> refundlist(){
		return sqlSession.selectList(namespace + "refundlist");
	}
	
}
