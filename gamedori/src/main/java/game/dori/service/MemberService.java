
package game.dori.service;

import game.dori.vo.MEMBER_VO;

public interface MemberService {

	void update(MEMBER_VO memberVO);

	MEMBER_VO selectByBno(int member_idx);

	int insert(MEMBER_VO memberVO);

	MEMBER_VO selectByEmail(String id);

	public int insertMember(MEMBER_VO memberVO);
}