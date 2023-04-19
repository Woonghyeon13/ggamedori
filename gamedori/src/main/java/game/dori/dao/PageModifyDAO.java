package game.dori.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.dori.vo.AD_VO;
import game.dori.vo.CAROUSEL_VO;

@Repository
public class PageModifyDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static String namespace = "game.dori.mapper.pageModifyMapper.";
	
	//캐러셀 이미지 등록
	public int carouselInsert(CAROUSEL_VO cavo) {
		return sqlSession.insert(namespace + "carouselInsert", cavo);
	}
	
	//광고 수정
	public int adModify(AD_VO advo) {
		return sqlSession.update(namespace + "adModify", advo);
	}
}
