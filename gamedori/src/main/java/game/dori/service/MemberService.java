
package game.dori.service;

import java.util.List;

import game.dori.vo.COUPON_VO;
import game.dori.vo.MEMBER_VO;

public interface MemberService {

	//회원정보 email_yn 업데이트
	void updateyn(MEMBER_VO MemberVO);

	//회원 번호찾기
	MEMBER_VO selectByBno(int member_idx);

	//아이디 중복찾기
	MEMBER_VO selectByEmail(String id);
	
	//멤버 회원가입
	public int insertMember(MEMBER_VO MemberVO);
	
	
	//로그인
	public MEMBER_VO Login(MEMBER_VO MemberVO);
	

	public List<MEMBER_VO> list(); //회원 리스트
	
	public int updateMemberState(MEMBER_VO memberVO); //회원 상태

	//회원탈퇴
	public int Delete(MEMBER_VO MemberVO);
	
	//회원정보 업데이트
	public int Update(MEMBER_VO MemberVO);
	
	
	//멤버 쿠폰 생성
	public int insertCoupon(COUPON_VO couponVO);
	
	//멤버 적립금 생성
	public int insertPoint(int member_idx);
	
	//멤버 쿠폰 삭제
	public int deleteCupon(MEMBER_VO MemberVO);
	
	//멤버 포인트 삭제
	public int deletePoint(MEMBER_VO MemberVO);
	
	//멤버 작성글 전부삭제
	public int NoticedeleteAll(MEMBER_VO MemberVO);
	

	//멤버 비밀번호만 변경
	 public int updatePasswordByEmail(String email, String newPassword);

	//적립금에 따른 등급업
	void memberLevelUP(int member_idx);



}