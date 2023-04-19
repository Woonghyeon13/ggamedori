package game.dori.service;

import java.util.List;

import game.dori.util.ORDER_LIST_VO;
import game.dori.util.OTO_VO;
import game.dori.util.PROD_Q_LIST_VO;
import game.dori.vo.AD_VO;
import game.dori.vo.CAROUSEL_VO;
import game.dori.vo.NOTICE_VO;

public interface AdminService {

	// 공지사항 리스트
	public List<NOTICE_VO> list(int limit, int start);
	
	// 공지사항 글 등록
	public int insert(NOTICE_VO noticeVO);
	
	// 공지사항 뷰 상세보기
	public NOTICE_VO select(int member_tb_idx);
	
	// 공지사항 글 삭제
	public int delete(int notice_idx);
	
	// 공지사항 글 수정
	public int modify(NOTICE_VO noticeVO);
	
	// 공지사항 글 개수
	public int countAll();
	
	// 공지사항 글 검색기능
	List<NOTICE_VO> searchNotices(String searchText, String searchOption, int start, int limit);
	
	// 공지사항 조회수
	public int notice_Hit(NOTICE_VO noticeVO);
	
	public List<ORDER_LIST_VO> orderList(); //주문목록 리스트
	
	public List<OTO_VO> otoList(); //1:1문의 리스트

	public int countSearchResults(String searchText, String searchOption);
	
	public int otoAnswer(OTO_VO otoVO); //1:1문의 답변
	
	public List<PROD_Q_LIST_VO> pqlist(); //상품 문의 리스트

	public int pqAnswer(PROD_Q_LIST_VO pqVO); //상품 문의 답변
	
	public int carouselInsert(CAROUSEL_VO cavo); //캐러셀 수정
	
	public int adModify(AD_VO advo); //광고 수정
}
