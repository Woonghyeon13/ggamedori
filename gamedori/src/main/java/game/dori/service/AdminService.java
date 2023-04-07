package game.dori.service;

import java.util.List;

import game.dori.vo.NOTICE_VO;

public interface AdminService {

	public List<NOTICE_VO> list(NOTICE_VO nvo);
	public int insert(NOTICE_VO vo);
}
