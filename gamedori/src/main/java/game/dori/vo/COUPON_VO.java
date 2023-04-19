package game.dori.vo;

import java.util.Date;

//쿠폰 VO
public class COUPON_VO {
	
	private int		coupon_idx; 		//쿠폰 인덱스
	private int 	member_tb_idx; 		//회원 인덱스
	private String 	coupon_name; 		//쿠폰 이름
	private double 	coupon_discount; 	//할인율
	private Date 	coupon_date; 		//쿠폰 생성일
	private Date 	coupon_start;		//쿠폰 시작일
	private Date 	coupon_end; 		//쿠폰 종료일
	private int 	coupon_min_amount; 	//최소주문금액
	private int 	coupon_max_amount; 	//최대할인금액
	private int		coupon_yn;			//쿠폰 사용여부
	public int getCoupon_idx() {
		return coupon_idx;
	}
	public void setCoupon_idx(int coupon_idx) {
		this.coupon_idx = coupon_idx;
	}
	public int getMember_tb_idx() {
		return member_tb_idx;
	}
	public void setMember_tb_idx(int member_tb_idx) {
		this.member_tb_idx = member_tb_idx;
	}
	public String getCoupon_name() {
		return coupon_name;
	}
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	public double getCoupon_discount() {
		return coupon_discount;
	}
	public void setCoupon_discount(double coupon_discount) {
		this.coupon_discount = coupon_discount;
	}
	public Date getCoupon_date() {
		return coupon_date;
	}
	public void setCoupon_date(Date coupon_date) {
		this.coupon_date = coupon_date;
	}
	public Date getCoupon_start() {
		return coupon_start;
	}
	public void setCoupon_start(Date date) {
		this.coupon_start = date;
	}
	public Date getCoupon_end() {
		return coupon_end;
	}
	public void setCoupon_end(Date date) {
		this.coupon_end = date;
	}
	public int getCoupon_min_amount() {
		return coupon_min_amount;
	}
	public void setCoupon_min_amount(int coupon_min_amount) {
		this.coupon_min_amount = coupon_min_amount;
	}
	public int getCoupon_max_amount() {
		return coupon_max_amount;
	}
	public void setCoupon_max_amount(int coupon_max_amount) {
		this.coupon_max_amount = coupon_max_amount;
	}
	public int getCoupon_yn() {
		return coupon_yn;
	}
	public void setCoupon_yn(int coupon_yn) {
		this.coupon_yn = coupon_yn;
	}

	
	
	
	
	
	//게터 세터
	
	

}
