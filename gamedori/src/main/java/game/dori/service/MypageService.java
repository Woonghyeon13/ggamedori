package game.dori.service;

import java.util.List;

import game.dori.vo.CARTP_VO;
import game.dori.vo.CART_VO;
import game.dori.vo.COUPON_VO;
import game.dori.vo.NOTICE_VO;
import game.dori.vo.ORDER_DETAIL_VO;
import game.dori.vo.ORDER_VO;
import game.dori.vo.PAY_VO;
import game.dori.vo.PRODUCTQQ_VO;
import game.dori.vo.PRODUCT_Q_VO;
import game.dori.vo.QA_VO;
import game.dori.vo.REVIEW_VO;
import game.dori.vo.SAVEPOINT_VO;
import game.dori.vo.WISHLIST_VO;

public interface MypageService {
	
	//마이페이지 상품문의 리스트 출력
	public List<PRODUCTQQ_VO> selectQAList(int member_idx);
	
	//마이페이지 1:1문의 리스트 출력
	public List<QA_VO> selectOtoList(int member_idx);
	
	// 마이페이지 1 : 1 문의 역순으로 출력
	public List<QA_VO> selectOtoListD(int member_idx);
	
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
	//마이페이지 누적 적립금 출력
	public int selectPointAmount(int member_td_idx);
	
	
	/*-------------------------------------------------------------------------------*/
	
	// 1 : 1 문의사항 리스트
	public List<QA_VO> oto_list(int limit, int start);
	
	// 1 : 1 문의사항 글 등록
	public int oto_insert(QA_VO qaVO);
	
	// 1 : 1 문의사항 글 삭제
	public int oto_delete(int qa_idx);
	
	// 1 : 1 문의사항 상세보기
	public QA_VO oto_select(int member_tb_idx);
	
	// 1 : 1 문의사항 글 검색기능
	public int oto_countSearchResults(String searchText, String searchOption);
	
	List<QA_VO> oto_search(String searchText, String searchOption, int start, int limit);
	
	// 1 : 1 문의사항 글 개수	
	public int oto_countAll();
	
	/*-------------------------------------------------------------------------------*/
	
	// 상품 문의사항 리스트
	public List<PRODUCT_Q_VO> prod_list(int prod_limit, int prod_start);
	
	// 상품 문의사항 글 등록
	public int prod_insert(PRODUCT_Q_VO product_Q_VO);

	
	// 상품 문의사항 글 삭제
	public int prod_delete(int prod_q_idx);
	
	// 상품 문의사항 상세보기
	public PRODUCT_Q_VO prod_select(int member_tb_idx);
	
	// 상품 문의사항 글 검색 기능
	public int prod_countSearchResults(String prod_searchText, String prod_searchOption);
	
	List<PRODUCT_Q_VO> prod_search(String prod_searchText, String prod_searchOption, int prod_start, int prod_limit);
	
	// 상품 문의사항 글 개수
	public int prod_countAll();
	
	/*-------------------------------------------------------------------------------*/

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
	public List<CART_VO> selectCartListService(int member_idx);

	// 장바구니 삭제
	public int cartDel( int cart_idx );
	
	// 장바구니 옵션수정
	public int cartModify( CART_VO cvo );
	
	int selectPointBal(int member_idx);
	
	// 상품 상세페이지에서 장바구니 담기
	public int insertCart( CART_VO cvo );
	
	// 장바구니 옵션정보
	public CARTP_VO cartView( CARTP_VO cpvo );
	
	// 주문 목록 리스트 연결
	public ORDER_DETAIL_VO orderDetailOne( int order_tb_idx );
	
	// 주문목록 금액 선택
	public PAY_VO selectPayPrice( int order_tb_idx );
}
