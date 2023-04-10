package game.dori.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import game.dori.dao.ProductQDAO;
import game.dori.dao.QaDAO;
import game.dori.vo.PRODUCT_Q_VO;
import game.dori.vo.QA_VO;

@Service
public class MypageServiceImpl implements MypageService{

	
	@Autowired
	private ProductQDAO productQDAO;
	
	@Autowired
	private QaDAO qaDAO;
	
	
	//마이페이지 상품문의 리스트출력
	@Override
	public List<PRODUCT_Q_VO> selectList(int member_idx) {
		return productQDAO.selectList(member_idx);
	}

	//마이페이지 1:1문의 리스트출력
	@Override
	public List<QA_VO> selectList2(int member_idx) {
		return qaDAO.selectList2(member_idx);
	}
	
	
}
