package game.dori.vo;

public class ORDER_DETAIL_VO {

	private int 	orderd_idx;			// 주문상세 인덱스
	private int 	order_tb_idx;		// 주문번호 인덱스
	private int 	product_tb_idx;		// 상품 인덱스
	private int 	coupon_tb_idx;		// 쿠폰 인덱스
	private int 	orderd_qty;			// 수량
	private int 	orderd_price;		// 총 가격
	private int 	orderd_state;		// 처리상태 1:주문접수,2:결제완료,3:상품준비중,4:발송준비중,5:발송완료,6:주문취소,7:반품접수,8:반품완료
	
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
	public int getProduct_tb_idx() {
		return product_tb_idx;
	}
	public void setProduct_tb_idx(int product_tb_idx) {
		this.product_tb_idx = product_tb_idx;
	}
	public int getCoupon_tb_idx() {
		return coupon_tb_idx;
	}
	public void setCoupon_tb_idx(int coupon_tb_idx) {
		this.coupon_tb_idx = coupon_tb_idx;
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
	public int getOrderd_state() {
		return orderd_state;
	}
	public void setOrderd_state(int orderd_state) {
		this.orderd_state = orderd_state;
	}
}
