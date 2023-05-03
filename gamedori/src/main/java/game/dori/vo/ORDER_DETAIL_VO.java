package game.dori.vo;

public class ORDER_DETAIL_VO {

	private int 	orderd_idx;			// 주문상세 인덱스
	private int 	order_tb_idx;		// 주문번호 인덱스
	private int 	orderd_qty;			// 수량
	private int 	orderd_price;		// 총 가격
	private int 	opt_tb_idx;			// 옵션 테이블 인덱스
	private int 	orderd_order_state;  // 주문 상태
	
	
	public int getOrderd_order_state() {
		return orderd_order_state;
	}
	public void setOrderd_order_state(int orderd_order_state) {
		this.orderd_order_state = orderd_order_state;
	}
	public int getOrderd_idx() {
		return orderd_idx;
	}
	public void setOrderd_idx(int orderd_idx) {
		this.orderd_idx = orderd_idx;
	}
	public int getOrder_tb_idx() {
		return order_tb_idx;
	}
	public void setOrder_tb_idx(int order_tb_idx) {
		this.order_tb_idx = order_tb_idx;
	}
	public int getOrderd_qty() {
		return orderd_qty;
	}
	public void setOrderd_qty(int orderd_qty) {
		this.orderd_qty = orderd_qty;
	}
	public int getOrderd_price() {
		return orderd_price;
	}
	public void setOrderd_price(int orderd_price) {
		this.orderd_price = orderd_price;
	}
	public int getOpt_tb_idx() {
		return opt_tb_idx;
	}
	public void setOpt_tb_idx(int opt_tb_idx) {
		this.opt_tb_idx = opt_tb_idx;
	}
	
	

}
