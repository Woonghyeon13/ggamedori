package game.dori.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import game.dori.dao.CartDAO;
import game.dori.dao.CouponDAO;
import game.dori.dao.MemberDAO;
import game.dori.dao.OrderDAO;
import game.dori.dao.OrderDetailDAO;
import game.dori.dao.PayDAO;
import game.dori.dao.ProductQDAO;
import game.dori.dao.QaDAO;
import game.dori.dao.ReviewDAO;
import game.dori.dao.SavepointDAO;
import game.dori.dao.WishlistDAO;
import game.dori.vo.CARTP_VO;
import game.dori.vo.CART_VO;
import game.dori.vo.COUPON_VO;
import game.dori.vo.ORDER_DETAIL_VO;
import game.dori.vo.ORDER_VO;
import game.dori.vo.PAY_VO;
import game.dori.vo.PRODUCTQQ_VO;
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

	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private CartDAO cartDAO;
	
	@Autowired
	private WishlistDAO wishlistDAO;
	
	@Autowired
	private OrderDetailDAO orderDetailDAO;
	
	@Autowired
	private PayDAO payDAO;

	
	//마이페이지 등급 출력
	@Override
	public int selectMemberLevelService(int member_idx) {
		return memberDAO.selectMemberLevelDAO(member_idx);
	}
	
	
	//마이페이지 상품문의 리스트출력
	@Override
	public List<PRODUCTQQ_VO> selectQAList(int member_idx) {
		return productQDAO.selectQAList(member_idx);
	}

	//마이페이지 1:1문의 리스트출력
	@Override
	public List<QA_VO> selectOtoList(int member_idx) {
		return qaDAO.selectOtoList(member_idx);
	}
	
	// 마이페이지 1 : 1 문의 리스트 역순으로 출력
	@Override
	public List<QA_VO> selectOtoListD(int member_idx) {
		return qaDAO.selectOtoListD(member_idx);
	}

	
	//마이페이지 리뷰 리스트출력
	@Override
	public List<REVIEW_VO> selectReviewList(int member_idx) {
		return reviewDAO.selectReviewList(member_idx);
	}

	//마이페이지 적립금 리스트출력
	@Override
	public List<SAVEPOINT_VO> selectSavePointList(int member_tb_idx) {
		return savepointDAO.selectSavePointList(member_tb_idx);
	}
	
	//마이페이지 상단 적립금 출력
	@Override
	public int selectPointBalanceService(int member_tb_idx) {
		return savepointDAO.selectPointBalanceService(member_tb_idx);
	}
	
	//누적 적립금
	@Override
	public int selectPointAmount(int member_td_idx) {
		return savepointDAO.selectPointAmount(member_td_idx);
	}

	//마이페이지 쿠폰 리스트출력
	@Override
	public List<COUPON_VO> selectCouponList(int member_tb_idx) {
		return couponDAO.selectCouponList(member_tb_idx);
	}

	//마이페이지 쿠폰 개수
	@Override
	public int CouponCount(int member_tb_idx) {
		return couponDAO.CouponCount(member_tb_idx);
	}
	
	//마이페이지 리뷰 개수
	@Override
	public int ReviewCount(int member_tb_idx) {
		return reviewDAO.ReviewCount(member_tb_idx);
	}

	/*-------------------------------------------------------------------------------*/
	
	// 1 : 1 문의사항 글 등록
	@Override
	public int oto_insert(QA_VO qaVO) {
		// TODO Auto-generated method stub
		return qaDAO.oto_insert(qaVO);
	}
	
	// 1 : 1 문의사항 글 삭제
	@Override
	public int oto_delete(int qa_idx) {
		// TODO Auto-generated method stub
		return qaDAO.oto_delete(qa_idx);
	}
	
	// 1 : 1 문의사항 상세보기
	@Override
	public QA_VO oto_select(int member_tb_idx) {
		// TODO Auto-generated method stub
		return qaDAO.oto_select(member_tb_idx);
	}

	// 1 : 1 문의사항 글 개수
	@Override
	public int oto_countAll() {
		// TODO Auto-generated method stub
		return qaDAO.oto_countAll();
	}
	
	// 1 : 1 문의사항 페이징
	@Override
	public List<QA_VO> oto_list(int limit, int start) {
		// TODO Auto-generated method stub
		return qaDAO.list(limit, start);
	}
	
	// 1 : 1 문의사항 글 검색
	@Override
	public int oto_countSearchResults(String searchText, String searchOption) {
		// TODO Auto-generated method stub
		return qaDAO.oto_countSearchResults(searchText, searchOption);
	}	

	// 1 : 1 문의사항 글 검색 후 페이징
	@Override
	public List<QA_VO> oto_search(String searchText, String searchOption, int start, int limit) {
		// TODO Auto-generated method stub
		return qaDAO.oto_search(searchText, searchOption, start, limit);
	}
	
//	// 사용자가 작성한 1:1 문의사항 리스트 조회
//	@Override
//	public List<QA_VO> otoListByMember(int member_idx, int limit, int start) {
//	  
//	    return qaDAO.otoListByMember(member_idx, start, limit);
//	}
//
//	// 사용자가 작성한 1:1 문의사항 개수 조회
//	@Override
//	public int countOtoByMember(int memberIdx) {
//	    return qaDAO.countOtoByMember(memberIdx);
//	}

	

	/*-------------------------------------------------------------------------------*/

	// 상품 문의사항 글 등록
	@Override
	public int prod_insert(PRODUCT_Q_VO product_Q_VO) {
		// TODO Auto-generated method stub
		return productQDAO.prod_insert(product_Q_VO);
	}

	// 상품 문의사항 글 삭제
	@Override
	public int prod_delete(int prod_q_idx) {
		// TODO Auto-generated method stub
		return productQDAO.prod_delete(prod_q_idx);
	}
	
	// 상품 문의사항 상세보기
	@Override
	public PRODUCT_Q_VO prod_select(int member_tb_idx) {
		// TODO Auto-generated method stub
		return productQDAO.prod_select(member_tb_idx);
	}
	
	// 상품 문의사항 글 개수
	@Override
	public int prod_countAll() {
		// TODO Auto-generated method stub
		return productQDAO.prod_countAll();
	}
	
	// 상품 문의사항 페이징
	@Override
	public List<PRODUCT_Q_VO> prod_list(int prod_limit, int prod_start) {
		// TODO Auto-generated method stub
		return productQDAO.prod_list(prod_limit, prod_start);
	}

	// 상품 문의사항 글 검색
	@Override
	public int prod_countSearchResults(String prod_searchText, String prod_searchOption) {
		// TODO Auto-generated method stub
		return productQDAO.prod_countSearchResults(prod_searchText, prod_searchOption);
	}

	// 상품 문의사항 글 검색 후 페이징
	@Override
	public List<PRODUCT_Q_VO> prod_search(String prod_searchText, String prod_searchOption, int prod_start,
			int prod_limit) {
		// TODO Auto-generated method stub
		return productQDAO.prod_search(prod_searchText, prod_searchOption, prod_start, prod_limit);
	}
	

	
	
	

	
	/*-------------------------------------------------------------------------------*/
	
	//마이페이지 주문내역 출력
	@Override
	public List<ORDER_VO> selectOrderListService(int member_tb_idx){
		return orderDAO.selectOrderListDAO(member_tb_idx);
	}
	
	//장바구니
	@Override
	public List<CART_VO> selectCartListService(int member_idx){
		return cartDAO.selectCartListDAO(member_idx);
	}
	
	//마이페이지 리뷰 서치... 복붙
	@Override
	public List<REVIEW_VO> searchReview(String R_searchValue, String R_searchType, int start, int limit) {
		return reviewDAO.search(R_searchValue, R_searchType, start, limit);
	}
	
	@Override
	public int countSearchResults(String r_searchValue, String r_searchType) {
		return reviewDAO.countSearchResults(r_searchValue, r_searchType);
	}

	// 회원 잔여 포인트
	@Override
	public int selectPointBal(int member_idx) {
		return savepointDAO.selectPointBal(member_idx);
	}

	//환불하기
	@Override
	public int UpdateOrderStatus(int member_tb_idx) {
		return orderDAO.UpdateOrderStatus(member_tb_idx);
	}

	
	
	/*-------------------------------------------------------------------------------*/



	// 상품 상세페이지에서 장바구니 담기
	@Override
	public int insertCart(CART_VO cvo) {
		return cartDAO.insertCart(cvo);
	}

	// 장바구니 삭제
	@Override
	public int cartDel( int cart_idx) {
		return cartDAO.cartDel(cart_idx);
	}

	// 장바구니 옵션수정
	@Override
	public int cartModify(CART_VO cvo) {
		return cartDAO.cartModify(cvo);
	}

	// 장바구니 옵션정보
	@Override
	public CARTP_VO cartView(CARTP_VO cpvo) {
		return cartDAO.cartView(cpvo);
	}

	// 주문 목록 리스트 연결
	@Override
	public ORDER_DETAIL_VO orderDetailOne(int order_tb_idx) {
		return orderDetailDAO.orderDetailOne(order_tb_idx);
	}

	// 주문목록 금액 선택
	@Override
	public PAY_VO selectPayPrice(int order_tb_idx) {
		return payDAO.selectPayPrice(order_tb_idx);
	}
	
	
	/*-------------------------------------------------------------------------------*/

	
}
