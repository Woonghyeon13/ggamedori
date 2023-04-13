package game.dori.util;

public class ORDER_LIST_VO {

	private int order_idx; //주문번호
	private int member_tb_idx; //회원 인덱스
	private String order_date; // 주문일
	private String order_addr1; //우편번호
	private String order_addr2; //주소
	private String order_addr3; //상세주소
	private String order_name; //수령자 이름
	private String order_phone; //수령자 번호
	private int order_del_type; //배송조건 1:일반 2:도서산간 
	
	private int orderd_idx;			// 주문상세 인덱스
	private int order_tb_idx;		// 주문번호 인덱스
	private int product_tb_idx;		// 상품 인덱스
	private int coupon_tb_idx;		// 쿠폰 인덱스
	private int orderd_qty;			// 수량
	private int orderd_price;		// 총 가격
	private int orderd_state;		// 처리상태 1:주문접수,2:결제완료,3:상품준비중,4:발송준비중,5:발송완료,6:주문취소,7:반품접수,8:반품완료
	
	private int member_idx ; //유저 인덱스
	private int member_level ; //회원 등급 1:브론즈 2:실버 3:골드
	private String member_email; //회원 이메일(아이디)
	private String member_pw; //회원 비밀번호
	private String member_phone ; //회원 폰번호
	private String member_indate ; //가입날짜
	private int member_state; //회원상태 1:일반 2:정지 3:탈퇴
	private String member_name; //회원 이름
	private int member_email_yn;  //이메일 인증여부  1:Y 2:N
	private String member_email_key; //이메일인증키
	private int member_role; //회원권한 1:일반 2:관리자
	
	
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
	public int getOrderd_idx() {
		return orderd_idx;
	}
	public void setOrderd_idx(int orderd_idx) {
		this.orderd_idx = orderd_idx;
	}
	public int getOrder_tb_idx() {
		return order_tb_idx;
	}
	public void setOrder_tb_idx(int order_tb_idx) {
		this.order_tb_idx = order_tb_idx;
	}
	public int getProduct_tb_idx() {
		return product_tb_idx;
	}
	public void setProduct_tb_idx(int product_tb_idx) {
		this.product_tb_idx = product_tb_idx;
	}
	public int getCoupon_tb_idx() {
		return coupon_tb_idx;
	}
	public void setCoupon_tb_idx(int coupon_tb_idx) {
		this.coupon_tb_idx = coupon_tb_idx;
	}
	public int getOrderd_qty() {
		return orderd_qty;
	}
	public void setOrderd_qty(int orderd_qty) {
		this.orderd_qty = orderd_qty;
	}
	public int getOrderd_price() {
		return orderd_price;
	}
	public void setOrderd_price(int orderd_price) {
		this.orderd_price = orderd_price;
	}
	public int getOrderd_state() {
		return orderd_state;
	}
	public void setOrderd_state(int orderd_state) {
		this.orderd_state = orderd_state;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public int getMember_level() {
		return member_level;
	}
	public void setMember_level(int member_level) {
		this.member_level = member_level;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_indate() {
		return member_indate;
	}
	public void setMember_indate(String member_indate) {
		this.member_indate = member_indate;
	}
	public int getMember_state() {
		return member_state;
	}
	public void setMember_state(int member_state) {
		this.member_state = member_state;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public int getMember_email_yn() {
		return member_email_yn;
	}
	public void setMember_email_yn(int member_email_yn) {
		this.member_email_yn = member_email_yn;
	}
	public String getMember_email_key() {
		return member_email_key;
	}
	public void setMember_email_key(String member_email_key) {
		this.member_email_key = member_email_key;
	}
	public int getMember_role() {
		return member_role;
	}
	public void setMember_role(int member_role) {
		this.member_role = member_role;
	}
	
	
	
}
