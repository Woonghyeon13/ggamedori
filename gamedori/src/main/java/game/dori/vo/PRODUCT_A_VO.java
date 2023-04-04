package game.dori.vo;

public class PRODUCT_A_VO {
	
	private int 	product_a_idx;		// 상품문의 답변 인덱스
	private String	product_a_reply;	// 답변내용
	private int 	product_q_tb_idx;	// 상품문의 인덱스
	
	public int getProduct_a_idx() {
		return product_a_idx;
	}
	public void setProduct_a_idx(int product_a_idx) {
		this.product_a_idx = product_a_idx;
	}
	public String getProduct_a_reply() {
		return product_a_reply;
	}
	public void setProduct_a_reply(String product_a_reply) {
		this.product_a_reply = product_a_reply;
	}
	public int getProduct_q_tb_idx() {
		return product_q_tb_idx;
	}
	public void setProduct_q_tb_idx(int product_q_tb_idx) {
		this.product_q_tb_idx = product_q_tb_idx;
	}
}
