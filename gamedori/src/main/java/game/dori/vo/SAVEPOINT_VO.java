package game.dori.vo;

public class SAVEPOINT_VO {
	
	private int savept_idx ; //누적적립금 인덱스
	private int member_tb_idx; //회원인덱스
	private int savept_amount; //누적적림금
	private int savept_balance; //잔액적립금
	private String savept_created; //적립시점
	
	public int getSavept_idx() {
		return savept_idx;
	}
	public void setSavept_idx(int savept_idx) {
		this.savept_idx = savept_idx;
	}
	public int getMember_tb_idx() {
		return member_tb_idx;
	}
	public void setMember_tb_idx(int member_tb_idx) {
		this.member_tb_idx = member_tb_idx;
	}
	public int getSavept_amount() {
		return savept_amount;
	}
	public void setSavept_amount(int savept_amount) {
		this.savept_amount = savept_amount;
	}
	public int getSavept_balance() {
		return savept_balance;
	}
	public void setSavept_balance(int savept_balance) {
		this.savept_balance = savept_balance;
	}
	public String getSavept_created() {
		return savept_created;
	}
	public void setSavept_created(String savept_created) {
		this.savept_created = savept_created;
	}
	
	
}
