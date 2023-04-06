package game.dori.service;

import game.dori.vo.ADDRESS_VO;
import game.dori.vo.MEMBER_VO;

public interface AddressService {
	
	int insert(ADDRESS_VO addressVO);
	
	int delete(MEMBER_VO memberVO);
}
