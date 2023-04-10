package game.dori.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import game.dori.dao.AddressDAO;
import game.dori.vo.ADDRESS_VO;
import game.dori.vo.MEMBER_VO;

@Service
public class AddressServiceImpl implements AddressService{
	
	@Autowired
	private AddressDAO addressDAO;

	@Override
	public int insert(ADDRESS_VO addressVO) {
		// TODO Auto-generated method stub
		return addressDAO.insert(addressVO);
	}

	@Override
	public int delete(MEMBER_VO memberVO) {
		// TODO Auto-generated method stub
		return addressDAO.addr_delete(memberVO);
	}

	@Override
	public int update(ADDRESS_VO addr) {
		// TODO Auto-generated method stub
		return addressDAO.update_Member(addr);
	}
}
