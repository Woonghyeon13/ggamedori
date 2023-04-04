package game.dori.vo;

public class REFUND_VO {
	
	private int		refund_idx;		// 환불 인덱스
	private int		orderd_tb_idx;	// 주문상세 인덱스
	private int		refund_res;		// 환불사유
	private String	refund_img;		// 환불사진
	private String	refund_email;	// 이메일
	private int		refund_yn;		// 환불여부
	
	public int getRefund_idx() {
		return refund_idx;
	}
	public void setRefund_idx(int refund_idx) {
		this.refund_idx = refund_idx;
	}
	public int getOrderd_tb_idx() {
		return orderd_tb_idx;
	}
	public void setOrderd_tb_idx(int orderd_tb_idx) {
		this.orderd_tb_idx = orderd_tb_idx;
	}
	public int getRefund_res() {
		return refund_res;
	}
	public void setRefund_res(int refund_res) {
		this.refund_res = refund_res;
	}
	public String getRefund_img() {
		return refund_img;
	}
	public void setRefund_img(String refund_img) {
		this.refund_img = refund_img;
	}
	public String getRefund_email() {
		return refund_email;
	}
	public void setRefund_email(String refund_email) {
		this.refund_email = refund_email;
	}
	public int getRefund_yn() {
		return refund_yn;
	}
	public void setRefund_yn(int refund_yn) {
		this.refund_yn = refund_yn;
	}
}
