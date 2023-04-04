package game.dori.vo;

public class ORDER_VO {
	
	private int order_idx; //주문번호
	private int member_tb_idx; //회원 인덱스
	private String order_date; // 주문일
	private String order_addr1; //우편번호
	private String order_addr2; //주소
	private String order_addr3; //상세주소
	private String order_name; //수령자 이름
	private String order_phone; //수령자 번호
	private int order_del_type; //배송조건 1:일반 2:도서산간 
	
	public int getOrder_idx() {
		return order_idx;
	}
	public void setOrder_idx(int order_idx) {
		this.order_idx = order_idx;
	}
	public int getMember_tb_idx() {
		return member_tb_idx;
	}
	public void setMember_tb_idx(int member_tb_idx) {
		this.member_tb_idx = member_tb_idx;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getOrder_addr1() {
		return order_addr1;
	}
	public void setOrder_addr1(String order_addr1) {
		this.order_addr1 = order_addr1;
	}
	public String getOrder_addr2() {
		return order_addr2;
	}
	public void setOrder_addr2(String order_addr2) {
		this.order_addr2 = order_addr2;
	}
	public String getOrder_addr3() {
		return order_addr3;
	}
	public void setOrder_addr3(String order_addr3) {
		this.order_addr3 = order_addr3;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public String getOrder_phone() {
		return order_phone;
	}
	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}
	public int getOrder_del_type() {
		return order_del_type;
	}
	public void setOrder_del_type(int order_del_type) {
		this.order_del_type = order_del_type;
	}
}
