package game.dori.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.dori.vo.AD_VO;
import game.dori.vo.CAROUSEL_VO;
import game.dori.vo.MEMBER_VO;

@Repository
public class PageModifyDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static String namespace = "game.dori.mapper.pageModifyMapper.";
	
	//캐러셀 이미지 등록(ajax)
	public int carouselInsert(CAROUSEL_VO cavo) {
		return sqlSession.insert(namespace + "carouselInsert", cavo);
	}

	//캐러셀 이미지 리스트
	public List<CAROUSEL_VO> list(){
		return sqlSession.selectList(namespace + "carouselList");
	}
	
	//광고 등록
	public int adInsert(AD_VO advo) {
		return sqlSession.insert(namespace + "adInsert", advo);
	}
	
	//광고 리스트
	public List<AD_VO> adlist(){
		return sqlSession.selectList(namespace + "adlist");
	}
	
}
