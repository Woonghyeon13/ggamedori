
package game.dori.service;

import game.dori.vo.MEMBER_VO;

public interface MemberService {

	void updateyn(MEMBER_VO MemberVO);

	MEMBER_VO selectByBno(int member_idx);

	MEMBER_VO selectByEmail(String id);

	public int insertMember(MEMBER_VO MemberVO);
	
	public MEMBER_VO Login(MEMBER_VO MemberVO);
	
	public int Delete(MEMBER_VO MemberVO);
	
	public int Update(MEMBER_VO MemberVO);
	

}