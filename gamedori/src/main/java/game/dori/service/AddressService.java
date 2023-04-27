package game.dori.service;

import java.util.List;

import game.dori.vo.ADDRESS_VO;
import game.dori.vo.MEMBER_VO;

public interface AddressService {
	
	int insert(ADDRESS_VO addressVO);
	
	int delete(MEMBER_VO memberVO);
	
	int update(ADDRESS_VO addr);
	
	//로그인세션에 같이담길 주소찾기
	ADDRESS_VO findByMemberIdx(MEMBER_VO memberVO);
}
