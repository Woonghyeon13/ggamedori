package game.dori.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import game.dori.dao.ProductQDAO;
import game.dori.vo.PRODUCT_Q_VO;

@Service
public class MypageServiceImpl implements MypageService{

	
	@Autowired
	private ProductQDAO productQDAO;
	
	@Override
	public List<PRODUCT_Q_VO> selectList(int member_idx) {
		// TODO Auto-generated method stub
		return  productQDAO.selectList(member_idx);
	}
	
}
