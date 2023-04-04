package game.dori.vo;

public class USEPOINT_VO {
	
	private int usept_idx; //사용적립금 인덱스
	private int pay_tb_idx; //결제정보 인덱스
	private String usept_created; //차감시점
	
	public int getUsept_idx() {
		return usept_idx;
	}
	public void setUsept_idx(int usept_idx) {
		this.usept_idx = usept_idx;
	}
	public int getPay_tb_idx() {
		return pay_tb_idx;
	}
	public void setPay_tb_idx(int pay_tb_idx) {
		this.pay_tb_idx = pay_tb_idx;
	}
	public String getUsept_created() {
		return usept_created;
	}
	public void setUsept_created(String usept_created) {
		this.usept_created = usept_created;
	}
	
	
}
