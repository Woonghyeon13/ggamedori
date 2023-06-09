package game.dori.vo;

public class OPT_VO {
	private int opt_idx;		// 옵션 인덱스
	private int prod_tb_idx;	// 상품 인덱스
	private String opt_name;	// 옵션이름
	private String opt_stock;		// 옵션재고수
	private String opt_price;		// 옵션추가금액
	private int opt_state;			// 1:판매중, 2:품절, 3:숨김처리
	private int opt_qty;			//옵션 수량
	
	public int getOpt_idx() {
		return opt_idx;
	}
	public int getOpt_qty() {
		return opt_qty;
	}
	public void setOpt_qty(int opt_qty) {
		this.opt_qty = opt_qty;
	}
	public void setOpt_idx(int opt_idx) {
		this.opt_idx = opt_idx;
	}
	public int getProd_tb_idx() {
		return prod_tb_idx;
	}
	public void setProd_tb_idx(int prod_tb_idx) {
		this.prod_tb_idx = prod_tb_idx;
	}
	public String getOpt_name() {
		return opt_name;
	}
	public void setOpt_name(String opt_name) {
		this.opt_name = opt_name;
	}
	public String getOpt_stock() {
		return opt_stock;
	}
	public void setOpt_stock(String opt_stock) {
		this.opt_stock = opt_stock;
	}
	public String getOpt_price() {
		return opt_price;
	}
	public void setOpt_price(String opt_price) {
		this.opt_price = opt_price;
	}
	public int getOpt_state() {
		return opt_state;
	}
	public void setOpt_state(int opt_state) {
		this.opt_state = opt_state;
	}
	
}
