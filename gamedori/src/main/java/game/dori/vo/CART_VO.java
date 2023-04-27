package game.dori.vo;

/*	��ٱ��� ���̺�	*/

public class CART_VO {

	private String cart_idx;			// 카트 인덱스
	private String cart_amount;			// 구매 수량
	private int member_tb_idx;		// 회원 인덱스
	private String opt_tb_idx;		// 상품 인덱스
	private int cart_yn;			// 결제 여부	[1 : y / 2 : n]
	
	
	public String getCart_idx() {
		return cart_idx;
	}
	public void setCart_idx(String cart_idx) {
		this.cart_idx = cart_idx;
	}
	public String getCart_amount() {
		return cart_amount;
	}
	public void setCart_amount(String cart_amount) {
		this.cart_amount = cart_amount;
	}
	public String getOpt_tb_idx() {
		return opt_tb_idx;
	}
	public void setOpt_tb_idx(String opt_tb_idx) {
		this.opt_tb_idx = opt_tb_idx;
	}
	public int getMember_tb_idx() {
		return member_tb_idx;
	}
	public void setMember_tb_idx(int member_tb_idx) {
		this.member_tb_idx = member_tb_idx;
	}
	public int getCart_yn() {
		return cart_yn;
	}
	public void setCart_yn(int cart_yn) {
		this.cart_yn = cart_yn;
	}
	
}
