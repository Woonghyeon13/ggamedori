package game.dori.vo;

/*	�� ��� ���̺�	*/

public class WISHLIST_VO {
	
	private int idwishlist_tb;		// 찜목록 인덱스
	private int member_tb_idx;		// 회원 인덱스
	private int product_tb_idx;		// 상품 인덱스
	
	private String prod_imgt;			// 썸네일 이미지
	private String prod_name;			// 상품 명
	private int prod_price;				// 상품 가격
	private String prod_opt;			// 제품 옵션
	
	
	
	public int getIdwishlist_tb() {
		return idwishlist_tb;
	}
	public void setIdwishlist_tb(int idwishlist_tb) {
		this.idwishlist_tb = idwishlist_tb;
	}
	public int getMember_tb_idx() {
		return member_tb_idx;
	}
	public void setMember_tb_idx(int member_tb_idx) {
		this.member_tb_idx = member_tb_idx;
	}
	public int getProduct_tb_idx() {
		return product_tb_idx;
	}
	public void setProduct_tb_idx(int product_tb_idx) {
		this.product_tb_idx = product_tb_idx;
	}
	public String getProd_imgt() {
		return prod_imgt;
	}
	public void setProd_imgt(String prod_imgt) {
		this.prod_imgt = prod_imgt;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public int getProd_price() {
		return prod_price;
	}
	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}
	public String getProd_opt() {
		return prod_opt;
	}
	public void setProd_opt(String prod_opt) {
		this.prod_opt = prod_opt;
	}
	
	
}
