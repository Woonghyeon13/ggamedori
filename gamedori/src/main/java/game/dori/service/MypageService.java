package game.dori.service;

import java.util.List;

import game.dori.vo.CARTP_VO;
import game.dori.vo.CART_VO;
import game.dori.vo.COUPON_VO;
import game.dori.vo.ORDER_VO;
import game.dori.vo.PRODUCTQQ_VO;
import game.dori.vo.QA_VO;
import game.dori.vo.REVIEW_VO;
import game.dori.vo.SAVEPOINT_VO;
import game.dori.vo.WISHLIST_VO;

public interface MypageService {
	//마이페이지 상품문의 리스트 출력
	public List<PRODUCTQQ_VO> selectQAList(int member_idx);
	
	//마이페이지 1:1문의 리스트 출력
	public List<QA_VO> selectOtoList(int member_idx);
	
	//마이페이지 리뷰 리스트 출력, 검색포함
	public List<REVIEW_VO> selectReviewList(int member_idx);
	//마이페이지 리뷰 카운트
	public int ReviewCount(int member_tb_idx);
	//복붙해온 검색기능
	List<REVIEW_VO> searchReview(String R_searchValue, String R_searchType, int start, int limit);
	//복붙해온 검색기능2
	public int countSearchResults(String R_searchValue, String R_searchType);
	
	
	//마이페이지 적립금 리스트 출력
	public List<SAVEPOINT_VO> selectSavePointList(int member_tb_idx);
	
	//마이페이지 상단 적립금 출력
	public int selectPointBalanceService(int member_tb_idx);
	
	//마이페이지 쿠폰 리스트 출력
	public List<COUPON_VO> selectCouponList(int member_tb_idx);
	//마이페이지 쿠폰 카운트
	public int CouponCount(int member_tb_idx);

	//마이페이지 주문내역 리스트 출력
	public List<ORDER_VO> selectOrderListService(int memeber_tb_idx);
	
	
	//마이페이지 등급
	public int selectMemberLevelService(int member_idx);
	
	//장바구니
	public List<CARTP_VO> selectCartListService(int member_idx);
	
	//위시리스트(찜목록)
	public List<WISHLIST_VO> selectWishlist(int member_tb_idx);
	//찜목록에서 카트담기
	public void addCart(CART_VO cart);
	
}
