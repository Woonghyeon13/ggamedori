package game.dori.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import game.dori.dao.CategoryDAO;
import game.dori.dao.ProductDAO;
import game.dori.vo.CATEGORY_VO;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private CategoryDAO categoryDAO;

	@Override
	public List<CATEGORY_VO> category() {
		return categoryDAO.category();
	}
	
}
