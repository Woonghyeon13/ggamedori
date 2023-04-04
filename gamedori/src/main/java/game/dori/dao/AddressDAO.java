package game.dori.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.dori.vo.ADDRESS_VO;

@Repository
public class AddressDAO {

	@Autowired
	private SqlSession sqlSession;
	
	
	public int insert(ADDRESS_VO AddressVO)
	{
		return sqlSession.insert("game.dori.mapper.addressMapper.insert",AddressVO);
		
	}
}
