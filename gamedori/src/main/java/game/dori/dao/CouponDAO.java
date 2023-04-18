package game.dori.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.dori.vo.COUPON_VO;

@Repository
public class CouponDAO {

	@Autowired
	private SqlSession sqlSession;
	
	//마이페이지 쿠폰 리스트 출력
	public List<COUPON_VO> selectCouponList(int member_td_idx) {
		return sqlSession.selectList("game.dori.mapper.couponMapper.selectCouponList", member_td_idx);
	}	
	
	//마이페이지 쿠폰 총 개수
	public int CouponCount(int member_td_idx){
		
		return sqlSession.selectOne("game.dori.mapper.couponMapper.CouponCount", member_td_idx);
	}
	
	
	
	
}
