package game.dori.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.dori.vo.ADDRESS_VO;
import game.dori.vo.MEMBER_VO;

@Repository
public class AddressDAO {

	@Autowired
	private SqlSession sqlSession;
	
	
	public int insert(ADDRESS_VO AddressVO)
	{
		return sqlSession.insert("game.dori.mapper.addressMapper.insert",AddressVO);
		
	}
	
	public int addr_delete(MEMBER_VO memberVO)
	{
		return sqlSession.delete("game.dori.mapper.addressMapper.delete_address", memberVO);
	}
	
	
	public int update_Member(ADDRESS_VO AddressVO)
	{
		return sqlSession.delete("game.dori.mapper.addressMapper.updateAddress", AddressVO);
	}
}
