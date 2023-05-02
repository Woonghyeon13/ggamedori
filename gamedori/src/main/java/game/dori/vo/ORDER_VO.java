package game.dori.vo;

public class ORDER_VO {
	

	private int order_idx; //주문번호 
	private int order_price; //주문금액 --데이터베이스 추가 
	private String order_title; //주문상품이름 --데이터베이스 추가
	private int order_situ; //배송상태--데이터베이스 추가  1:주문완료 2:배송중 3:배송완료
	private int member_tb_idx; //회원 인덱스
	private String order_date; // 주문일
	private String order_addr1; //우편번호
	private String order_addr2; //주소
	private String order_addr3; //상세주소
	private String order_name; //수령자 이름
	private String order_phone; //수령자 번호
	private int order_del_type; //배송조건 1:일반 2:도서산간
	private String order_memo; //배송메모
	private int order_state;	// 처리상태 1:주문접수,2:결제완료,3:상품준비중,4:발송준비중,5:발송완료,6:주문취소,7:반품접수,8:반품완료,9:환불 접수, 10:환불 완료
	private int coupon_tb_idx;	//쿠폰테이블 인덱스
	private int order_usepoint; //사용적립금
	
	
	public int getOrder_usepoint() {
		return order_usepoint;
	}

	public void setOrder_usepoint(int order_usepoint) {
		this.order_usepoint = order_usepoint;
	}

	public int getOrder_price() {
		return order_price;
	}

	public String getOrder_title() {
		return order_title;
	}

	public void setOrder_title(String order_title) {
		this.order_title = order_title;
	}

	public int getOrder_situ() {
		return order_situ;
	}
	public void setOrder_situ(int order_situ) {
		this.order_situ = order_situ;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	public int getOrder_state() {
		return order_state;
	}

	public void setOrder_state(int order_state) {
		this.order_state = order_state;
	}

	public int getCoupon_tb_idx() {
		return coupon_tb_idx;
	}

	public void setCoupon_tb_idx(int coupon_tb_idx) {
		this.coupon_tb_idx = coupon_tb_idx;
	}

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

	public String getOrder_memo() {
		return order_memo;
	}

	public void setOrder_memo(String order_memo) {
		this.order_memo = order_memo;
	}
	
	
}
