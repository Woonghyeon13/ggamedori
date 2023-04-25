package game.dori.vo;

/*	ī�װ� ���̺�	*/

public class CATEGORY_VO {


	private String cate_code;		// 카테고리 코드 (품번)
	private String cate_name;		// 이름
	private String cate_refcode;	// 참조 코드
	private int level;
	private String cate_rsv;		// 예약여부
	private String cate_new;		//새로운 상품
	
	
	public String getCate_new() {
		return cate_new;
	}
	public void setCate_new(String cate_new) {
		this.cate_new = cate_new;
	}
	public String getCate_rsv() {
		return cate_rsv;
	}
	public void setCate_rsv(String cate_rsv) {
		this.cate_rsv = cate_rsv;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getCate_code() {
		return cate_code;
	}
	public void setCate_code(String cate_code) {
		this.cate_code = cate_code;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	public String getCate_refcode() {
		return cate_refcode;
	}
	public void setCate_refcode(String cate_refcode) {
		this.cate_refcode = cate_refcode;
	}
	

	
}
