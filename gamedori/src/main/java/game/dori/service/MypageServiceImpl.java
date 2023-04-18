package game.dori.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import game.dori.dao.CartDAO;
import game.dori.dao.CouponDAO;
import game.dori.dao.MemberDAO;
import game.dori.dao.OrderDAO;
import game.dori.dao.ProductQDAO;
import game.dori.dao.QaDAO;
import game.dori.dao.ReviewDAO;
import game.dori.dao.SavepointDAO;
import game.dori.dao.WishlistDAO;
import game.dori.vo.CARTP_VO;
import game.dori.vo.COUPON_VO;
import game.dori.vo.ORDER_VO;
import game.dori.vo.PRODUCTQQ_VO;
import game.dori.vo.QA_VO;
import game.dori.vo.REVIEW_VO;
import game.dori.vo.SAVEPOINT_VO;
import game.dori.vo.WISHLIST_VO;

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
	
	//마이페이지 등급 출력
	@Override
	public int selectMemberLevelService(int member_idx) {
		return memberDAO.selectMemberLevelDAO(member_idx);
	}
	
	
	//마이페이지 상품문의 리스트출력
	@Override
	public List<PRODUCTQQ_VO> selectList(int member_idx) {
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
	
	//마이페이지 상단 적립금 출력
	@Override
	public int selectPointBalanceService(int member_tb_idx) {
		return savepointDAO.selectPointBalanceDAO(member_tb_idx);
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

	
	//마이페이지 리뷰 개수
	@Override
	public int selectListCount2(int member_tb_idx) {
		return reviewDAO.selectListCount2(member_tb_idx);
	}

	//마에피이지 주문내역 출력
	@Override
	public List<ORDER_VO> selectOrderListService(int member_tb_idx){
		return orderDAO.selectOrderListDAO(member_tb_idx);
	}

	
	//장바구니
	@Override
	public List<CARTP_VO> selectCartListService(int member_idx){
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


	//위시리스트(찜목록)
	@Override 
	public List<WISHLIST_VO> selectWishlist(int member_tb_idx) {
		return wishlistDAO.selectWishlist(member_tb_idx);
	}


	
}
