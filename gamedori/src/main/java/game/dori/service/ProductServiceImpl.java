package game.dori.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import game.dori.dao.CategoryDAO;
import game.dori.dao.ProductDAO;
import game.dori.vo.CATEGORY_VO;
import game.dori.vo.PRODUCT_VO;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private CategoryDAO categoryDAO;

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
	public List<PRODUCT_VO> list( CATEGORY_VO cvo ) {
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

	@Override
	public int prodDelete(int prod_idx) {
		return productDAO.pordDelete(prod_idx);
	}
	
}
