package game.dori.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import game.dori.dao.CategoryDAO;
import game.dori.dao.ProdOptDAO;
import game.dori.dao.ProductDAO;
import game.dori.dao.ProductQDAO;
import game.dori.util.PROD_Q_LIST_VO;
import game.dori.vo.CATEGORY_VO;
import game.dori.vo.OPT_VO;
import game.dori.vo.PRODUCT_Q_VO;
import game.dori.vo.PRODUCT_VO;

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
	public int prodQinsert(PRODUCT_Q_VO pqvo) {
		return prodQDAO.prodQinsert(pqvo);
	}

	// 상품 문의 목록
	@Override
	public List<PROD_Q_LIST_VO> prodQlist( int prod_idx ) {
		return prodQDAO.prodQlist(prod_idx);
	}

	// 상품 문의 목록 카운트
	@Override
	public int prodQlistCnt(int prod_idx) {
		return prodQDAO.prodQlistCnt(prod_idx);
	}

}
