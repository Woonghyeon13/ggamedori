package game.dori.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import game.dori.util.OTO_VO;
import game.dori.util.PROD_Q_LIST_VO;
import game.dori.vo.PRODUCTQQ_VO;
import game.dori.vo.PRODUCT_Q_VO;

@Repository
public class ProductQDAO {

	@Autowired
	private SqlSession sqlSession;
	private static String namespace = "game.dori.mapper.productQMapper.";
	
	//마이페이지 상품문의 리스트 출력
	public List<PRODUCTQQ_VO> selectList(int member_idx) {
		return sqlSession.selectList("game.dori.mapper.productQMapper.selectList", member_idx); //매개변수릉통해 인자로전달  쿼리에서사용
	}
	
	//관리자 페이지 상품문의 리스트 출력
	public List<PROD_Q_LIST_VO> list(){
		return sqlSession.selectList(namespace + "pqlist");
	}
	
	//상품문의 답변
	public int pqAnswer(PROD_Q_LIST_VO pqVO) {
		return sqlSession.update(namespace + "pqAnswer", pqVO);
	}
	
}

// vo를 참조자료형으로사용해서 member_idx를 인자로 mapper를 호출해 쿼리문을실행 
// 메서드를사용한 service나 controller에 반환값 전달 