package game.dori.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.dori.vo.OPT_VO;

@Repository
public class ProdOptDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// 상품 옵션 등록
	public int optInsert( OPT_VO opt ){
		return sqlSession.insert("game.dori.mapper.prodOptMapper.optInsert",opt);
	}
}
