package game.dori.vo;

public class OPT_VO {
	private int opt_idx;		// 옵션 인덱스
	private int prod_tb_idx;	// 상품 인덱스
	private String opt_name;	// 옵션이름
	private int opt_stock;		// 옵션재고수
	private int opt_price;		// 옵션추가금액
	
	public int getOpt_idx() {
		return opt_idx;
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
	public int getOpt_stock() {
		return opt_stock;
	}
	public void setOpt_stock(int opt_stock) {
		this.opt_stock = opt_stock;
	}
	public int getOpt_price() {
		return opt_price;
	}
	public void setOpt_price(int opt_price) {
		this.opt_price = opt_price;
	}
	
	
}
