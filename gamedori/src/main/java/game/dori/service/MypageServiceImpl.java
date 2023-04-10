package game.dori.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import game.dori.dao.CouponDAO;
import game.dori.dao.ProductQDAO;
import game.dori.dao.QaDAO;
import game.dori.dao.ReviewDAO;
import game.dori.dao.SavepointDAO;
import game.dori.vo.COUPON_VO;
import game.dori.vo.PRODUCT_Q_VO;
import game.dori.vo.QA_VO;
import game.dori.vo.REVIEW_VO;
import game.dori.vo.SAVEPOINT_VO;

@Service
public class MypageServiceImpl implements MypageService{

	
	@Autowired
	private ProductQDAO productQDAO;
	
	@Autowired
	private QaDAO qaDAO;
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	@Autowired
	private SavepointDAO savepointDAO;
	
	@Autowired
	private CouponDAO couponDAO;
	
	
	//마이페이지 상품문의 리스트출력
	@Override
	public List<PRODUCT_Q_VO> selectList(int member_idx) {
		return productQDAO.selectList(member_idx);
	}

	//마이페이지 1:1문의 리스트출력
	@Override
	public List<QA_VO> selectList2(int member_idx) {
		return qaDAO.selectList2(member_idx);
	}
	
	//마이페이지 리뷰 리스트출력
	@Override
	public List<REVIEW_VO> selectList3(int member_idx) {
		return reviewDAO.selectList3(member_idx);
	}

	//마이페이지 적립금 리스트출력
	@Override
	public List<SAVEPOINT_VO> selectList4(int member_tb_idx) {
		return savepointDAO.selectList4(member_tb_idx);
	}

	//마이페이지 쿠폰 리스트출력
	@Override
	public List<COUPON_VO> selectList5(int member_tb_idx) {
		return couponDAO.selectList5(member_tb_idx);
	}

	//마이페이지 쿠폰 개수
	@Override
	public int selectListCount(int member_tb_idx) {
		return couponDAO.selectListCount(member_tb_idx);
	}

	//마이페이지 후기 개수
	@Override
	public int selectListCount2(int member_tb_idx) {
		return reviewDAO.selectListCount2(member_tb_idx);
	}
	
	
}
