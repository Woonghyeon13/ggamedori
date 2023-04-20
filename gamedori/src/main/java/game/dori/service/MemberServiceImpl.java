package game.dori.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import game.dori.dao.CouponDAO;
import game.dori.dao.MemberDAO;
import game.dori.dao.NoticeDAO;
import game.dori.dao.SavepointDAO;
import game.dori.vo.COUPON_VO;
import game.dori.vo.MEMBER_VO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private CouponDAO couponDAO;
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
	SavepointDAO savePointDAO;

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
	public MEMBER_VO Login(MEMBER_VO memberVO) {
		// TODO Auto-generated method stub
		return memberDAO.Login(memberVO);
	}

	@Override
	public int Delete(MEMBER_VO memberVO) {
		// TODO Auto-generated method stub
		return memberDAO.member_delete(memberVO);
	}

	@Override
	public int Update(MEMBER_VO MemberVO) {
		// TODO Auto-generated method stub
		return memberDAO.member_update(MemberVO);
	}

	@Override
	public List<MEMBER_VO> list() {//회원리스트
		return memberDAO.list();
	}

	@Override
	public int updateMemberState(MEMBER_VO memberVO) {//회원 상태 변경
		 return memberDAO.updateMemberState(memberVO);
	}

	@Override
	public int insertCoupon(COUPON_VO couponVO) {
		// TODO Auto-generated method stub
		return  memberDAO.insertCoupon(couponVO);
	}

	@Override
	public int insertPoint(int member_idx) {
		// TODO Auto-generated method stub
		return memberDAO.insertSavePoint(member_idx);
	}

	@Override
	public int deleteCupon(MEMBER_VO MemberVO) {
		// TODO Auto-generated method stub
		return couponDAO.deleteCoupon(MemberVO);
	}

	@Override
	public int deletePoint(MEMBER_VO MemberVO) {
		// TODO Auto-generated method stub
		return savePointDAO.deletePoint(MemberVO) ;
	}

	@Override
	public int NoticedeleteAll(MEMBER_VO MemberVO) {
		// TODO Auto-generated method stub
		return noticeDAO.deleteAll(MemberVO);
	}

	 public int updatePasswordByEmail(String email, String newPassword) {
	     
	        return memberDAO.updatePasswordByEmail(email, newPassword);
	    }
	
	



		
}

