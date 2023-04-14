package game.dori.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import game.dori.dao.NoticeDAO;
import game.dori.dao.OrderListDAO;
import game.dori.dao.ProductQDAO;
import game.dori.dao.QaDAO;
import game.dori.util.ORDER_LIST_VO;
import game.dori.util.OTO_VO;
import game.dori.util.PROD_Q_LIST_VO;
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

	public List<NOTICE_VO> list(int limit, int start) {
        return noticeDAO.list(limit, start);
    }

	@Override
	public int insert(NOTICE_VO vo){
		
		return noticeDAO.insert(vo);	
	}
	
	@Override
	public int countAll() {
	    return noticeDAO.countAll();
	}

	@Override
	public NOTICE_VO select(int member_tb_idx) {
		// TODO Auto-generated method stub
		return noticeDAO.select(member_tb_idx);
	}

	@Override
	public int delete(int notice_idx) {
		// TODO Auto-generated method stub
		return noticeDAO.delete(notice_idx);
	}
	
	

	@Override
	public int modify(NOTICE_VO noticeVO) {
		// TODO Auto-generated method stub
		return noticeDAO.modify(noticeVO);
	}

	@Override
	public List<NOTICE_VO> searchNotices(String searchText, String searchOption, int start, int limit) {
	    return noticeDAO.search(searchText, searchOption, start, limit);
	}

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

	public List<OTO_VO> otoList() {//1:1문의 리스트
		return qaDAO.list();
	}
	public int countSearchResults(String searchText, String searchOption) {
		// TODO Auto-generated method stub
		return noticeDAO.countSearchResults(searchText, searchOption);

	}

	@Override
	public int otoAnswer(OTO_VO otoVO) {//1:1문의 답변
		return qaDAO.otoAnswer(otoVO);
	}

	@Override
	public List<PROD_Q_LIST_VO> pqlist() {//상품문의 리스트
		return pqDAO.list();
	}


	


}
