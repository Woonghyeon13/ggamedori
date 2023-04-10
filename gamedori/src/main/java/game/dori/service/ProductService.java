package game.dori.service;

import java.util.List;

import game.dori.vo.CATEGORY_VO;
import game.dori.vo.PRODUCT_VO;

public interface ProductService {

	// 카테고리 리스트
	public List<CATEGORY_VO> category();
	// 상품등록
	public int prodInsert( PRODUCT_VO pvo );
	// 상품목록
	public List<PRODUCT_VO> list( PRODUCT_VO pvo );
	// 상품수정
	public int prodUpdate( PRODUCT_VO pvo );
	// 상품상세
	public PRODUCT_VO prodSelectOne( int prod_idx );
}
