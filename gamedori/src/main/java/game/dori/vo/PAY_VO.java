package game.dori.vo;

public class PAY_VO {
	
	private int		pay_idx;  			// 결제정보 인덱스
	private int		orderd_tb_idx;  	// 주문상세 인덱스
	private int 	savepoint_tb_idx;  	// 누적적립금 인덱스
	private int 	pay_type; 			// 결제수단
	private String 	pay_date; 			// 결제(입금)일자
	private int 	pay_price_real; 	// 실결제금액
	private int 	pay_price_deposit;	// 입금액
	private String 	pay_deposit_name;	// 입금자명
	private int 	pay_bank; 			// 입금은행
	
	public int getPay_idx() {
		return pay_idx;
	}
	public void setPay_idx(int pay_idx) {
		this.pay_idx = pay_idx;
	}
	public int getOrderd_tb_idx() {
		return orderd_tb_idx;
	}
	public void setOrderd_tb_idx(int orderd_tb_idx) {
		this.orderd_tb_idx = orderd_tb_idx;
	}
	public int getSavepoint_tb_idx() {
		return savepoint_tb_idx;
	}
	public void setSavepoint_tb_idx(int savepoint_tb_idx) {
		this.savepoint_tb_idx = savepoint_tb_idx;
	}
	public int getPay_type() {
		return pay_type;
	}
	public void setPay_type(int pay_type) {
		this.pay_type = pay_type;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public int getPay_price_real() {
		return pay_price_real;
	}
	public void setPay_price_real(int pay_price_real) {
		this.pay_price_real = pay_price_real;
	}
	public int getPay_price_deposit() {
		return pay_price_deposit;
	}
	public void setPay_price_deposit(int pay_price_deposit) {
		this.pay_price_deposit = pay_price_deposit;
	}
	public String getPay_deposit_name() {
		return pay_deposit_name;
	}
	public void setPay_deposit_name(String pay_deposit_name) {
		this.pay_deposit_name = pay_deposit_name;
	}
	public int getPay_bank() {
		return pay_bank;
	}
	public void setPay_bank(int pay_bank) {
		this.pay_bank = pay_bank;
	}
}
