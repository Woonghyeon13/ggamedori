package game.dori.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import game.dori.dao.NoticeDAO;
import game.dori.dao.OrderListDAO;
import game.dori.dao.PageModifyDAO;
import game.dori.dao.ProductQDAO;
import game.dori.dao.QaDAO;
import game.dori.dao.SearchDAO;
import game.dori.dao.SearchDAO;
import game.dori.util.ORDER_LIST_VO;
import game.dori.util.OTO_VO;
import game.dori.util.PROD_Q_LIST_VO;
import game.dori.vo.AD_VO;
import game.dori.vo.CAROUSEL_VO;
import game.dori.vo.CATEGORY_IMG_VO;
import game.dori.vo.MEMBER_VO;
import game.dori.vo.NOTICE_VO;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
	private OrderListDAO orderlistDAO;
	
	@Autowired
	private QaDAO qaDAO;
	
	@Autowired
	private ProductQDAO pqDAO;
	
	@Autowired
	private PageModifyDAO pmDAO;

	@Autowired
	private SearchDAO scDAO;
	
	// 공지사항 페이징
	public List<NOTICE_VO> list(int limit, int start) {
        return noticeDAO.list(limit, start);
    }

	// 공지사항 글 등록
	@Override
	public int insert(NOTICE_VO vo){
		
		return noticeDAO.insert(vo);	
	}
	
	// 공지사항 글 개수
	@Override
	public int countAll() {
	    return noticeDAO.countAll();
	}

	// 공지사항 상세보기
	@Override
	public NOTICE_VO select(int member_tb_idx) {
		// TODO Auto-generated method stub
		return noticeDAO.select(member_tb_idx);
	}

	// 공지사항 글 삭제
	@Override
	public int delete(int notice_idx) {
		// TODO Auto-generated method stub
		return noticeDAO.delete(notice_idx);
	}

	// 공지사항 글 수정
	@Override
	public int modify(NOTICE_VO noticeVO) {
		// TODO Auto-generated method stub
		return noticeDAO.modify(noticeVO);
	}
	
	// 공지사항 글 검색후 페이징
	public int countSearchResults(String searchText, String searchOption) {
		// TODO Auto-generated method stub
		return noticeDAO.countSearchResults(searchText, searchOption);

	}

	// 공지사항 글 검색기능
	@Override
	public List<NOTICE_VO> searchNotices(String searchText, String searchOption, int start, int limit) {
	    return noticeDAO.search(searchText, searchOption, start, limit);
	}

	// 공지사항 조회수
	@Override
	public int notice_Hit(NOTICE_VO noticeVO) {
		// TODO Auto-generated method stub
		 return noticeDAO.update_Hit(noticeVO);
	}

	@Override
	public List<ORDER_LIST_VO> orderList() {//주문목록 리스트
		return orderlistDAO.list();
	}

	@Override

	public List<OTO_VO> otoList(int limit, int start) {//1:1문의 리스트
		return qaDAO.otolist(limit, start);
	}
	

	@Override
	public int otoAnswer(OTO_VO otoVO) {//1:1문의 답변
		return qaDAO.otoAnswer(otoVO);
	}

	@Override
	public List<PROD_Q_LIST_VO> pqlist() {//상품문의 리스트
		return pqDAO.list();
	}

	@Override
	public int pqAnswer(PROD_Q_LIST_VO pqVO) {//상품 문의 답변
		return pqDAO.pqAnswer(pqVO);
	}

	@Override
	public int carouselInsert(CAROUSEL_VO cavo) {//캐러셀 수정
		return pmDAO.carouselInsert(cavo);
	}

	@Override
	public int adInsert(AD_VO advo) {//광고 수정
		return pmDAO.adInsert(advo);
	}

	@Override
	public List<CAROUSEL_VO> clist() {//캐러셀 리스트
		return pmDAO.list();
	}

	@Override
	public List<AD_VO> adlist() {//광고 리스트
		return pmDAO.adlist();
	}

	@Override
	public int cateImgInsert(CATEGORY_IMG_VO civo) {//카테고리 이미지 등록
		return pmDAO.cateImgInsert(civo);
	}

	@Override
	public Map<String, String> selectCategoryImages() {//카테고리 이미지 리스트
		return pmDAO.selectCategoryImages();
	}
	
	@Override
	public int mCountAll() {//총 회원 수 카운트(검색과 페이징에 사용)
		return scDAO.mCountAll();
	}
	
	@Override
	public List<MEMBER_VO> memberSearch(String searchText, String searchOption, int start, int limit) {//회원리스트 검색
		return scDAO.mSearch(searchText, searchOption, start, limit);
	}

	@Override
	public int mCountSearchResults(String searchText, String searchOption) {
		return scDAO.mCountSearchResults(searchText, searchOption);
	}

	@Override
	public int oto_countAll() {
		return scDAO.oto_countAll();
	}

	@Override
	public List<OTO_VO> oto_search(String searchText, String searchOption, int start, int limit) {
		return scDAO.oto_search(searchText, searchOption, start, limit);
	}

	@Override
	public int oto_countSearchResults(String searchText, String searchOption) {
		return scDAO.oto_countSearchResults(searchText, searchOption);
	}

	@Override
	public int updateOrderState(ORDER_LIST_VO orderlistVO) {
		return orderlistDAO.updateOrderState(orderlistVO);
	}

}
