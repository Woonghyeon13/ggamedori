package game.dori.service;

import java.util.List;

import game.dori.vo.COUPON_VO;
import game.dori.vo.PRODUCT_Q_VO;
import game.dori.vo.QA_VO;
import game.dori.vo.REVIEW_Search_VO;
import game.dori.vo.REVIEW_VO;
import game.dori.vo.SAVEPOINT_VO;

public interface MypageService {
	//마이페이지 상품문의 리스트 출력
	public List<PRODUCT_Q_VO> selectList(int member_idx);
	
	//마이페이지 1:1문의 리스트 출력
	public List<QA_VO> selectList2(int member_idx);
	
	//마이페이지 리뷰 리스트 출력, 검색포함
	public List<REVIEW_VO> selectList3(int member_idx);
	//마이페이지 리뷰 카운트
	public int selectListCount2(int member_tb_idx);
	//복붙해온 검색기능
	List<REVIEW_VO> searchReview(String R_searchValue, String R_searchType, int start, int limit);
	//복붙해온 검색기능2
	public int countSearchResults(String R_searchValue, String R_searchType);
	
	
	//마이페이지 적립금 리스트 출력
	public List<SAVEPOINT_VO> selectList4(int member_tb_idx);
	
	//마이페이지 쿠폰 리스트 출력
	public List<COUPON_VO> selectList5(int member_tb_idx);
	//마이페이지 쿠폰 카운트
	public int selectListCount(int member_tb_idx);


	
	
}
