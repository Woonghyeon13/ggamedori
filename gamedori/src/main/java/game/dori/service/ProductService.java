package game.dori.service;

import java.util.List;

import game.dori.vo.CATEGORY_VO;
import game.dori.vo.OPT_VO;
import game.dori.vo.PRODUCT_VO;

public interface ProductService {

	// 카테고리 리스트
	public List<CATEGORY_VO> category();
	// 상품등록
	public int prodInsert( PRODUCT_VO pvo );
	// 상품목록
	public List<PRODUCT_VO> list( CATEGORY_VO cvo );
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
	public List<OPT_VO> optSelecet( int prod_idx );
	// 상품 옵션 수정
	public int optModify( OPT_VO opt );
	// 상품 옵션 삭제
	public int optDel( int prod_idx );
}
