package game.dori.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import game.dori.dao.AddressDAO;
import game.dori.dao.CategoryDAO;
import game.dori.dao.MemberDAO;
import game.dori.dao.OrderDAO;
import game.dori.dao.OrderDetailDAO;
import game.dori.dao.PayDAO;
import game.dori.dao.ProdOptDAO;
import game.dori.dao.ProductDAO;
import game.dori.dao.ProductQDAO;
import game.dori.dao.ReviewDAO;
import game.dori.util.ORDER_LIST_VO;
import game.dori.util.PRODOPT_VO;
import game.dori.vo.ADDRESS_VO;
import game.dori.vo.CATEGORY_VO;
import game.dori.vo.MEMBER_VO;
import game.dori.vo.OPT_VO;
import game.dori.vo.ORDER_DETAIL_VO;
import game.dori.vo.PRODUCT_Q_VO;
import game.dori.vo.PRODUCT_VO;
import game.dori.vo.REVIEW_VO;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private ProdOptDAO prodOptDAO;
	
	@Autowired
	private ProductQDAO prodQDAO;
	
	@Autowired
	private AddressDAO addressDAO;
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private ReviewDAO reviewDAO;

  @Autowired
	private OrderDetailDAO orderDetailDAO;
	
	@Autowired
	private PayDAO payDAO;

	
	// 카테고리 리스트
	@Override
	public List<CATEGORY_VO> category() {
		return categoryDAO.category();
	}

	// 상품 등록
	@Override
	public int prodInsert( PRODUCT_VO pvo ) {
		return productDAO.prodInsert(pvo);
	}

	// 상품 리스트
	@Override
	public List<PRODUCT_VO> list(CATEGORY_VO cvo) {
		CATEGORY_VO categoryVO = new CATEGORY_VO();
       
        
        return productDAO.list(cvo);
    }

	 
	// 상품 수정
	@Override
	public int prodUpdate(PRODUCT_VO pvo) {
		return productDAO.pordUpdate(pvo);
	}

	// 상품 상세
	@Override
	public PRODUCT_VO prodSelectOne(int prod_idx) {
		return productDAO.prodSelectOne(prod_idx);
	}

	// 상품 삭제
	@Override
	public int prodDelete(int prod_idx) {
		return productDAO.pordDelete(prod_idx);
	}

	// 상품목록 카운트
	@Override
	public int listCnt(CATEGORY_VO cvo) {
		return productDAO.listCnt(cvo);
	}

	// 상품옵션 등록
	@Override
	public int optInsert(OPT_VO opt) {
		return prodOptDAO.optInsert(opt);
	}

	// 상품 인덱스
	@Override
	public int optIdx() {
		return prodOptDAO.optIdx();
	}

	// 상품옵션 상세
	@Override
	public List<OPT_VO> optSelect(int prod_idx) {
		return prodOptDAO.optSelect(prod_idx);
	}

	// 상품선택 옵션 상세
	@Override
	public OPT_VO optSelectOne(int opt_idx ) {
		return prodOptDAO.optSelectOne( opt_idx );
	}
	
	// 상품옵션 수정
	@Override
	public int optModify(OPT_VO opt) {
		return prodOptDAO.optModify(opt);
	}

	// 상품옵션 전체 삭제
	@Override
	public int optDel(int prod_idx) {
		return prodOptDAO.optDel(prod_idx);
	}
	
	// 상품 옵션 삭제
	@Override
	public int optDelOne(int opt_idx) {
		return prodOptDAO.optDelOne(opt_idx);
	}

	// 상품 옵션상태 수정
	@Override
	public int optStateModify(OPT_VO opt) {
		return prodOptDAO.optStateModify(opt);
	}

	// 상품 문의 등록
	@Override
	public int prodq_insert(PRODUCT_Q_VO pqvo) {
		return prodQDAO.prodq_insert(pqvo);
	}

	// 상품 문의 목록
	@Override
	public List<PRODUCT_Q_VO> prodQlist( int prod_idx ) {
		return prodQDAO.prodQlist(prod_idx);
	}

	// 상품 문의 목록 카운트
	@Override
	public int prodQlistCnt(int prod_idx) {
		return prodQDAO.prodQlistCnt(prod_idx);
	}

	// 회원 주소정보
	@Override
	public ADDRESS_VO selectMemAddr( MEMBER_VO memberVO ) {
		return addressDAO.selectMemAddr(memberVO);
	}

	// 회원 주문정보
	@Override
	public MEMBER_VO orderMem(MEMBER_VO memberVO) {
		return memberDAO.orderMem(memberVO);
	}

	// 주문 인덱스 생성
	@Override
	public int insertOrder(ORDER_LIST_VO olvo) {
		return orderDAO.insertOrder(olvo);
	}

	// 상품 옵션 상세 정보리스트
	@Override
	public PRODOPT_VO prodOptSelect( int opt_idx ) {
		return prodOptDAO.prodOptSelect(opt_idx);
	}

	
	@Override
	public List<PRODUCT_VO> reservlist() {
		return productDAO.reservlist();
	}

	@Override
	public List<PRODOPT_VO> prodOptList(PRODOPT_VO povo) {
		// TODO Auto-generated method stub
		return null;
	}


	// 리뷰 등록
	@Override
	public int review_insert(REVIEW_VO reviewVO) {
		return reviewDAO.review_insert(reviewVO);
	}

	// 상품 인덱스 호출
	@Override
	public int orderNum() {
		return orderDAO.orderNum();
	}

	// 주문 상세 상품 등록
	@Override
	public int insertOrderDetail(ORDER_DETAIL_VO ordervo) {
		return orderDetailDAO.insertOrderDetail(ordervo);
	}

	// 주문결제서 생성
	@Override
	public int insertPay(ORDER_LIST_VO olvo) {
		return payDAO.insertPay(olvo);
	}
	
	// 상품 상세 리뷰 목록
	@Override
	public List<REVIEW_VO> prodReviewList(int prod_idx) {
		return reviewDAO.prodReviewList(prod_idx);
	}

	// 상품상세 리뷰카운트
	@Override
	public int prodReviewCnt(int prod_idx) {
		return reviewDAO.prodReviewCnt(prod_idx);
	}

	// 옵션 재고 감소
	@Override
	public int optStockMinus( OPT_VO povo ) {
		return prodOptDAO.optStockMinus(povo);
	}

	// 상품 재고 감소
	@Override
	public int prodStockMinus(PRODOPT_VO optvo) {
		return productDAO.prodStockMinus(optvo);
	}

	@Override
	public int newListCnt() {
		// TODO Auto-generated method stub
		return productDAO.newListCnt();
	}

//	// 상품 문의사항 역순으로 출력
//	@Override
//	public List<PRODUCT_Q_VO> prod_listD(int member_idx) {
//		// TODO Auto-generated method stub
//		return prodQDAO.selectProdListD(member_idx);
//	}


}
