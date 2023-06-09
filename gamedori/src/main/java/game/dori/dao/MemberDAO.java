package game.dori.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import game.dori.vo.COUPON_VO;
import game.dori.vo.MEMBER_VO;


@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static String namespace = "game.dori.mapper.MemberMapper.";
	
	public MEMBER_VO selectByBno(int member_idx)
	{
		return sqlSession.selectOne(namespace + "selectByBno",member_idx);
	}
	
	public int insertMember(MEMBER_VO memberVO) {
	    // 매퍼 인터페이스를 사용하여 insertMember 쿼리를 실행합니다.
		sqlSession.insert(namespace + "insertMember", memberVO);

	    // 새로 생성된 MEMBER_IDX 값을 반환합니다.
	    return memberVO.getMember_idx();
	}
	
	public MEMBER_VO Login(MEMBER_VO memberVO)
	{
		
		return sqlSession.selectOne(namespace + "Login" , memberVO);
	}
	
	public MEMBER_VO selectByEmail(String member_email)
	{
		return sqlSession.selectOne(namespace + "selectByEmail", member_email);
	}
	
	public int updateyn(MEMBER_VO memberVO) {
		return sqlSession.update(namespace + "updateMemberyn",memberVO);
	
	}
	

	//회원리스트
	public List<MEMBER_VO> list(int limit, int start){
	    Map<String, Object> params = new HashMap<String, Object>();
	    params.put("limit", limit);
	    params.put("start", start);
	    
		return sqlSession.selectList(namespace + "memberlist", params);
	}
	
	//회원 상태(일반, 정지) 변경  ajax
	public int updateMemberState(MEMBER_VO memberVO) {
		return sqlSession.update(namespace + "updateMemberState", memberVO);
	
	}
	

	public int member_delete(MEMBER_VO memberVO)
	{
		return sqlSession.delete(namespace + "delete_member", memberVO);
	}
	
	
	public int member_update(MEMBER_VO memberVO)
	{
		return sqlSession.update(namespace + "updateMember", memberVO);
	}
	
	//쿠폰 생성
    public int insertCoupon(COUPON_VO couponVO)
    {
    	
        return sqlSession.insert("game.dori.mapper.couponMapper.insertcoupon", couponVO);
    }
	
    public int insertSavePoint(int member_idx)
    {
    	return sqlSession.insert("game.dori.mapper.savepointMapper.insertSavePoint", member_idx);
    }
    
	//마이페이지 등급 출력
	public int selectMemberLevelDAO(int member_idx)
	{
		return sqlSession.selectOne(namespace+ "selectMemberLevelMapper",member_idx);
		
	}

	//누적적립금에 따른 등급업
	public int memberLevelUP(int member_idx)
	{
		return sqlSession.update(namespace+ "memberLevelUP",member_idx);
	}
	
	
	
	public int updatePasswordByEmail(String email, String newPassword) {
        Map<String, String> paramMap = new HashMap<String, String>();
        paramMap.put("email", email);
        paramMap.put("newPassword", newPassword);
        
        
        return sqlSession.update(namespace+ "updatePassword", paramMap);
	}
	
	//회원 주문정보
	public MEMBER_VO orderMem( MEMBER_VO memberVO ) {
		return sqlSession.selectOne("game.dori.mapper.MemberMapper.orderMem",memberVO);
	}
}
