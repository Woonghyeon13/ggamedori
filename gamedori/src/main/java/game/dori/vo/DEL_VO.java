package game.dori.vo;

public class DEL_VO {
	
	private int 	del_idx;		// 배송정보 인덱스
	private int 	orderd_tb_idx;	// 주문상세 인덱스
	private String  del_date;		// 배송일자
	private int 	del_co;			// 배송업체 1:대한통운,2:로젠,3:우체국
	private int 	del_num;		// 운송장번호
	private String  del_tdate;		// 송장입력일자
	
	public int getDel_idx() {
		return del_idx;
	}
	public void setDel_idx(int del_idx) {
		this.del_idx = del_idx;
	}
	public int getOrderd_tb_idx() {
		return orderd_tb_idx;
	}
	public void setOrderd_tb_idx(int orderd_tb_idx) {
		this.orderd_tb_idx = orderd_tb_idx;
	}
	public String getDel_date() {
		return del_date;
	}
	public void setDel_date(String del_date) {
		this.del_date = del_date;
	}
	public int getDel_co() {
		return del_co;
	}
	public void setDel_co(int del_co) {
		this.del_co = del_co;
	}
	public int getDel_num() {
		return del_num;
	}
	public void setDel_num(int del_num) {
		this.del_num = del_num;
	}
	public String getDel_tdate() {
		return del_tdate;
	}
	public void setDel_tdate(String del_tdate) {
		this.del_tdate = del_tdate;
	}
}
