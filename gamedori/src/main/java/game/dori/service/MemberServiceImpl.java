package game.dori.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import game.dori.dao.MemberDAO;
import game.dori.vo.MEMBER_VO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;

	MEMBER_VO memverVO;

	@Autowired
	JavaMailSender mailSender;

	@Override
	public MEMBER_VO selectByBno(int member_idx) {
		return memberDAO.selectByBno(member_idx);
	}

	@Override
	public MEMBER_VO selectByEmail(String id) {
		return memberDAO.selectByEmail(id);
	}

	@Override
	public void updateyn(MEMBER_VO memberVO) {
		memberDAO.updateyn(memberVO);
	}

	@Override
	public int insertMember(MEMBER_VO memberVO) {
		return memberDAO.insertMember(memberVO);
	}

	@Override
	public MEMBER_VO Login(MEMBER_VO MemberVO) {
		// TODO Auto-generated method stub
		return memberDAO.Login(MemberVO);
	}

	@Override
	public List<MEMBER_VO> list() {//회원리스트
		return memberDAO.list();
	}

	@Override
	public void updateMemberState(MEMBER_VO memberVO) {
		 memberDAO.updateMemberState(memberVO);
	}



		
}

