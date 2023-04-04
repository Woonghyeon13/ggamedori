package game.dori.vo;

public class POINT_USED_VO {
	
	private int pt_used_idx; //사용 적립금상세 인덱스
	private int usept_tb_idx; //사용적립금 인덱스
	private int savept_tb_idx; //누적 적립금 인덱스
	private int pt_used_amount; //차감금액
	
	
	public int getPt_used_idx() {
		return pt_used_idx;
	}
	public void setPt_used_idx(int pt_used_idx) {
		this.pt_used_idx = pt_used_idx;
	}
	public int getUsept_tb_idx() {
		return usept_tb_idx;
	}
	public void setUsept_tb_idx(int usept_tb_idx) {
		this.usept_tb_idx = usept_tb_idx;
	}
	public int getSavept_tb_idx() {
		return savept_tb_idx;
	}
	public void setSavept_tb_idx(int savept_tb_idx) {
		this.savept_tb_idx = savept_tb_idx;
	}
	public int getPt_used_amount() {
		return pt_used_amount;
	}
	public void setPt_used_amount(int pt_used_amount) {
		this.pt_used_amount = pt_used_amount;
	}
	
	
}
