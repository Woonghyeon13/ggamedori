package game.dori.service;

import java.util.List;

import game.dori.vo.PRODUCT_Q_VO;
import game.dori.vo.QA_VO;

public interface MypageService {
	//마이페이지 상품문의 리스트 출력
	public List<PRODUCT_Q_VO> selectList(int member_idx);
	
	//마이페이지 1:1문의 리스트 출력
	public List<QA_VO> selectList2(int member_idx);
	
}
