package game.dori.service;

import java.util.List;

import game.dori.vo.CARTP_VO;
import game.dori.vo.CART_VO;
import game.dori.vo.COUPON_VO;
import game.dori.vo.ORDER_VO;
import game.dori.vo.PRODUCTQQ_VO;
import game.dori.vo.PRODUCT_Q_VO;
import game.dori.vo.QA_VO;
import game.dori.vo.REVIEW_Search_VO;
import game.dori.vo.REVIEW_VO;
import game.dori.vo.SAVEPOINT_VO;

public interface MypageService {
	//마이페이지 상품문의 리스트 출력
	public List<PRODUCTQQ_VO> selectList(int member_idx);
	
	//마이페이지 1:1문의 리스트 출력
	public List<QA_VO> selectList2(int member_idx);
	
	//마이페이지 리뷰 리스트 출력, 검색포함
	public List<REVIEW_VO> selectList3(int member_idx, REVIEW_Search_VO search);
	//마이페이지 리뷰 카운트
	public int selectListCount2(int member_tb_idx);
	
	//마이페이지 적립금 리스트 출력
	public List<SAVEPOINT_VO> selectList4(int member_tb_idx);
	
	//마이페이지 상단 적립금 출력
	public int selectPointBalanceService(int member_tb_idx);
	
	//마이페이지 쿠폰 리스트 출력
	public List<COUPON_VO> selectList5(int member_tb_idx);
	//마이페이지 쿠폰 카운트
	public int selectListCount(int member_tb_idx);

	//마이페이지 주문내역 리스트 출력
	public List<ORDER_VO> selectOrderListService(int memeber_tb_idx);
	
	
	//마이페이지 등급
	public int selectMemberLevelService(int member_idx);
	
	//장바구니
	public List<CARTP_VO> selectCartListService(int member_idx);
}
