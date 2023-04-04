package game.dori.service;

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
	public int insert(MEMBER_VO memberVO) {
		return memberDAO.insert(memberVO);
	}

	@Override
	public void update(MEMBER_VO memberVO) {
		memberDAO.update(memberVO);
	}

	@Override
	public int insertMember(MEMBER_VO memberVO) {
		return memberDAO.insertMember(memberVO);
	}

}
