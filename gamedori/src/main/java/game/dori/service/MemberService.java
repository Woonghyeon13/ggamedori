
package game.dori.service;

import java.util.List;

import game.dori.vo.MEMBER_VO;

public interface MemberService {

	void updateyn(MEMBER_VO MemberVO);

	MEMBER_VO selectByBno(int member_idx);

	MEMBER_VO selectByEmail(String id);

	public int insertMember(MEMBER_VO MemberVO);
	
	
	public MEMBER_VO Login(MEMBER_VO MemberVO);
	
	public List<MEMBER_VO> list(); //회원 리스트
	
	public void updateMemberState(MEMBER_VO MemberVO); //회원 상태

}