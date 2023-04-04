package game.dori.vo;

/*	��ٱ��� ���̺�	*/

public class CART_VO {

	private int cart_qty;			// 구매 수량
	private int memver_tb_idx;		// 회원 인덱스
	private int product_tb_idx;		// 상품 인덱스
	private int cart_yn;			// 결제 여부	[1 : y / 2 : n]
	
	public int getCart_qty() {
		return cart_qty;
	}
	public void setCart_qty(int cart_qty) {
		this.cart_qty = cart_qty;
	}
	public int getMemver_tb_idx() {
		return memver_tb_idx;
	}
	public void setMemver_tb_idx(int memver_tb_idx) {
		this.memver_tb_idx = memver_tb_idx;
	}
	public int getProduct_tb_idx() {
		return product_tb_idx;
	}
	public void setProduct_tb_idx(int product_tb_idx) {
		this.product_tb_idx = product_tb_idx;
	}
	public int getCart_yn() {
		return cart_yn;
	}
	public void setCart_yn(int cart_yn) {
		this.cart_yn = cart_yn;
	}
	
	
	
}
