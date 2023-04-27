package game.dori.vo;

import java.util.List;

public class CARTP_VO {
	
	private String cart_idx;			// 카트 인덱스
	private String cart_amount;		// 구매 수량
	private int member_tb_idx;		// 회원 인덱스
	private String opt_tb_idx;		// 상품 인덱스
	private int cart_yn;			// 결제 여부	[1 : y / 2 : n]
	
	private int prod_idx;			// 상품 인덱스
	private String prod_imgt;		// 썸네일 이미지
	private String prod_name;			// 상품 명

	private int opt_idx;			// 옵션 인덱스
	private int prod_tb_idx;		// 상품 인덱스
	private String opt_name;		// 옵션이름
	private String opt_price;		// 옵션추가금액
	private int opt_state;			// 1:판매중, 2:품절, 3:숨김처리
	
	private List<OPT_VO> optlist; 	//옵션리스트
	
	public List<OPT_VO> getOptlist() {
		return optlist;
	}
	public void setOptlist(List<OPT_VO> optlist) {
		this.optlist = optlist;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public String getCart_idx() {
		return cart_idx;
	}
	public void setCart_idx(String cart_idx) {
		this.cart_idx = cart_idx;
	}
	public String getCart_amount() {
		return cart_amount;
	}
	public void setCart_amount(String cart_amount) {
		this.cart_amount = cart_amount;
	}
	public int getMember_tb_idx() {
		return member_tb_idx;
	}
	public void setMember_tb_idx(int member_tb_idx) {
		this.member_tb_idx = member_tb_idx;
	}
	public String getOpt_tb_idx() {
		return opt_tb_idx;
	}
	public void setOpt_tb_idx(String opt_tb_idx) {
		this.opt_tb_idx = opt_tb_idx;
	}
	public int getCart_yn() {
		return cart_yn;
	}
	public void setCart_yn(int cart_yn) {
		this.cart_yn = cart_yn;
	}
	public int getProd_idx() {
		return prod_idx;
	}
	public void setProd_idx(int prod_idx) {
		this.prod_idx = prod_idx;
	}
	public String getProd_imgt() {
		return prod_imgt;
	}
	public void setProd_imgt(String prod_imgt) {
		this.prod_imgt = prod_imgt;
	}
	public int getOpt_idx() {
		return opt_idx;
	}
	public void setOpt_idx(int opt_idx) {
		this.opt_idx = opt_idx;
	}
	public int getProd_tb_idx() {
		return prod_tb_idx;
	}
	public void setProd_tb_idx(int prod_tb_idx) {
		this.prod_tb_idx = prod_tb_idx;
	}
	public String getOpt_name() {
		return opt_name;
	}
	public void setOpt_name(String opt_name) {
		this.opt_name = opt_name;
	}
	public String getOpt_price() {
		return opt_price;
	}
	public void setOpt_price(String opt_price) {
		this.opt_price = opt_price;
	}
	public int getOpt_state() {
		return opt_state;
	}
	public void setOpt_state(int opt_state) {
		this.opt_state = opt_state;
	}
	
	
}