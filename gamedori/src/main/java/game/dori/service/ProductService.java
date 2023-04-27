package game.dori.service;

import java.util.List;

import game.dori.util.ORDER_LIST_VO;
import game.dori.util.PRODOPT_VO;
import game.dori.util.PROD_Q_LIST_VO;
import game.dori.vo.ADDRESS_VO;
import game.dori.vo.CATEGORY_VO;
import game.dori.vo.MEMBER_VO;
import game.dori.vo.OPT_VO;
import game.dori.vo.PRODUCT_Q_VO;
import game.dori.vo.PRODUCT_VO;

public interface ProductService {

	// 카테고리 리스트
	public List<CATEGORY_VO> category();
	// 상품등록
	public int prodInsert( PRODUCT_VO pvo );
	// 상품목록
	public List<PRODUCT_VO> list( CATEGORY_VO cvo );
		// 상품목록 인기순
		public List<PRODUCT_VO> list_hot(CATEGORY_VO cvo);
		// 상품목록 최신순
		public List<PRODUCT_VO> list_new(CATEGORY_VO cvo);
		// 상품목록 낮은가격순
		public List<PRODUCT_VO> list_row(CATEGORY_VO cvo);
		// 상품목록 높은가격순
		public List<PRODUCT_VO> list_high(CATEGORY_VO cvo);
	// 상품목록 카운트
	public int listCnt( CATEGORY_VO cvo );
	// 상품수정
	public int prodUpdate( PRODUCT_VO pvo );
	// 상품삭제
	public int prodDelete( int prod_idx );
	// 상품상세
	public PRODUCT_VO prodSelectOne( int prod_idx );
	// 상품 옵션 등록
	public int optInsert( OPT_VO opt );
	// 상품 인덱스
	public int optIdx();
	// 상품 옵션 상세
	public List<OPT_VO> optSelect( int prod_idx );
	// 상품 선택 옵션 상세
	public OPT_VO optSelectOne( int opt_idx );
	// 상품 옵션 수정
	public int optModify( OPT_VO opt );
	// 상품 옵션상태 수정
	public int optStateModify( OPT_VO opt );
	// 상품 옵션 전체 삭제
	public int optDel( int prod_idx );
	// 상품 옵션 삭제
	public int optDelOne( int opt_idx );
	// 상품 문의 등록
	public int prodQinsert( PRODUCT_Q_VO pqvo );
	// 상품 문의 목록
	public List<PROD_Q_LIST_VO> prodQlist( int prod_idx );
	// 상품 문의 목록 카운트
	public int prodQlistCnt( int prod_idx );
	// 회원 주소정보 
	public ADDRESS_VO selectMemAddr( MEMBER_VO memberVO );
	// 회원 주문 정보
	public MEMBER_VO orderMem( MEMBER_VO memberVO );
	
	// 주문 인덱스 생성
	public int insertOrder( ORDER_LIST_VO olvo );
	// 주문 인덱스 호출
	public int orderNum();
	// 상품 옵션 상세 정보
	public List<PRODOPT_VO> prodOptList( PRODOPT_VO povo );
	// 주문 상세 상품등록
	public int insertOrderDetail( ORDER_LIST_VO olvo );
	// 주문 결제서 생성
	public int insertPay( ORDER_LIST_VO olvo );
	
	//예약상품 리스트
	public List<PRODUCT_VO> reservlist();

	// 상품옵션 상세정보 목록
	public PRODOPT_VO prodOptSelect( int opt_idx );

}
