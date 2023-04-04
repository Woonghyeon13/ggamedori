package game.dori.vo;

/*	�� ��� ���̺�	*/

public class WISHLIST_VO {
	
	private int idwishlist_tb;		// 찜목록 인덱스
	private int member_tb_idx;		// 회원 인덱스
	private int product_tb_idx;		// 상품 인덱스
	
	
	
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
	
	
}
