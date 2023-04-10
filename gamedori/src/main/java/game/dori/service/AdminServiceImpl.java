package game.dori.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import game.dori.dao.NoticeDAO;
import game.dori.vo.NOTICE_VO;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private NoticeDAO noticeDAO;

	@Override
	public List<NOTICE_VO> list( ){
		// TODO Auto-generated method stub
		return noticeDAO.list();
	}

	@Override
	public int insert(NOTICE_VO vo){
		
		return noticeDAO.insert(vo);
		
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
		return noticeDAO.modfiy(noticeVO);
	}

//	@Override
//	public void insert(NOTICE_VO vo) throws Exception {
//		// TODO Auto-generated method stub
//		noticeDAO.insert(vo);
//	}



//	@Override
//	public List<NOTICE_VO> List() throws Exception {
//		// TODO Auto-generated method stub
//		return noticeDAO.select(vo);
//	}

}
