package game.dori.service;

import java.util.List;
import java.util.Map;

import game.dori.util.ORDER_LIST_VO;
import game.dori.util.OTO_VO;
import game.dori.util.PROD_Q_LIST_VO;
import game.dori.vo.AD_VO;
import game.dori.vo.CAROUSEL_VO;
import game.dori.vo.CATEGORY_IMG_VO;
import game.dori.vo.MEMBER_VO;
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
	
	
	// 주문목록 리스트
	public List<ORDER_LIST_VO> orderList(); 
	
	// 1 : 1문의 리스트
	public List<OTO_VO> otoList(int limit, int start); 

	// 공지사항 글 검색 후 페이징 개수
	public int countSearchResults(String searchText, String searchOption);
	
	// 1 : 1문의 답변
	public int otoAnswer(OTO_VO otoVO); 
	
	// 상품 문의 리스트
	public List<PROD_Q_LIST_VO> pqlist(); 

	// 상품 문의 답변
	public int pqAnswer(PROD_Q_LIST_VO pqVO); 
	
	// 캐러셀 수정
	public int carouselInsert(CAROUSEL_VO cavo); 

	public List<CAROUSEL_VO> clist();//캐러셀 리스트

	public int adInsert(AD_VO advo); //광고 수정
	
	public List<AD_VO> adlist(); //광고 리스트

	public int cateImgInsert(CATEGORY_IMG_VO civo); //카테고리 이미지 등록
	
	public Map<String, String> selectCategoryImages(); //카테고리 이미지 리스트 
	
	// 총 회원수 카운트
	public int mCountAll();
	
	// 관리자페이지 멤버리스트  검색기능
	List<MEMBER_VO> memberSearch(String searchText, String searchOption, int start, int limit);
		
	// 공지사항 글 검색 후 페이징 개수
	public int mCountSearchResults(String searchText, String searchOption);
	
	// 총 1:1문의 카운트
	public int oto_countAll();
	
	// 관리자페이지 1:1문의 내역 검색기능
	List<OTO_VO> oto_search(String searchText, String searchOption, int start, int limit);
	
	// 1:1문의 내역 검색 후 페이징 개수
	public int oto_countSearchResults(String searchText, String searchOption);

	//주문 상태(관리자 페이지)
	public int updateOrderState(ORDER_LIST_VO orderlistVO);
}
