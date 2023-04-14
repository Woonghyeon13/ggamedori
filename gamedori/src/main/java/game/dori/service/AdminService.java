package game.dori.service;

import java.util.List;

import game.dori.util.ORDER_LIST_VO;
import game.dori.util.OTO_VO;
import game.dori.vo.NOTICE_VO;

public interface AdminService {

	public List<NOTICE_VO> list(int limit, int start);
	public int insert(NOTICE_VO noticeVO);
	
	public NOTICE_VO select(int member_tb_idx);
	
	public int delete(int notice_idx);
	
	public int modify(NOTICE_VO noticeVO);
	
	public int countAll();
	
	List<NOTICE_VO> searchNotices(String searchText, String searchOption, int start, int limit);
	
	public int notice_Hit(NOTICE_VO noticeVO);
	
	public List<ORDER_LIST_VO> orderList();
	
	public List<OTO_VO> otoList();

	public int countSearchResults(String searchText, String searchOption);

}
