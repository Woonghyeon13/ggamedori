package game.dori.service;

import java.util.List;

import game.dori.vo.NOTICE_VO;

public interface AdminService {

	public List<NOTICE_VO> list( );
	public int insert(NOTICE_VO noticeVO);
	
	public NOTICE_VO select(int member_tb_idx);
	
	public int delete(int notice_idx);
	
	public int modify(NOTICE_VO noticeVO);
	
}
