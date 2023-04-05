package game.dori.service;

import java.util.List;

import game.dori.vo.CATEGORY_VO;
import game.dori.vo.PRODUCT_VO;

public interface ProductService {

	public List<CATEGORY_VO> category();
	
	public int prodInsert( PRODUCT_VO pvo );
}
