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
	private String order_memo; //배송메모
	private int order_state;	// 처리상태 1:주문접수,2:결제완료,3:상품준비중,4:발송준비중,5:발송완료,6:주문취소,7:반품접수,8:반품완료
	
	private int orderd_idx;			// 주문상세 인덱스
	private int order_tb_idx;		// 주문번호 인덱스
	private int product_tb_idx;		// 상품 인덱스
	private int coupon_tb_idx;		// 쿠폰 인덱스
	private int orderd_qty;			// 수량
	private int orderd_price;		// 총 가격
	
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
	
	private int prod_idx;				// 상품 인덱스
	private String category_tb_code;	// 카테고리 코드 (품번)
	private String prod_name;			// 상품 명
	private int prod_price;				// 상품 가격
	private int prod_stock;				// 재고 량
	private String prod_wdate;			// 등록 일
	private int prod_hit;				// 조회 수
	private int prod_sales;				// 판매 량
	private String prod_co;				// 제조사
	private String prod_rdate;			// 출시 일
	private String prod_imgt;			// 썸네일 이미지
	private String prod_imgm;			// 메인 이미지
	private String prod_imgd;			// 상세정보 이미지
	private int prod_qtymin;			// 최소구매수량
	private int prod_qtymax;			// 최대구매수량
	private int prod_reserv;			// 예약
	
	private int opt_idx;		// 옵션 인덱스
	private int prod_tb_idx;	// 상품 인덱스
	private String opt_name;	// 옵션이름
	private String opt_stock;		// 옵션재고수
	private String opt_price;		// 옵션추가금액
	private int opt_state;			// 1:판매중, 2:품절, 3:숨김처리
	
	private int		coupon_idx; 		//쿠폰 인덱스
	private String 	coupon_name; 		//쿠폰 이름
	private double 	coupon_discount; 	//할인율
	private String 	coupon_date; 		//쿠폰 생성일
	private String 	coupon_start;		//쿠폰 시작일
	private String 	coupon_end; 		//쿠폰 종료일
	private int 	coupon_min_amount; 	//최소주문금액
	private int 	coupon_max_amount; 	//최대할인금액
	private int		coupon_yn;			//쿠폰 사용여부
	
	
	public String getOrder_memo() {
		return order_memo;
	}
	public void setOrder_memo(String order_memo) {
		this.order_memo = order_memo;
	}
	public int getOrder_state() {
		return order_state;
	}
	public void setOrder_state(int order_state) {
		this.order_state = order_state;
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
	public int getProd_idx() {
		return prod_idx;
	}
	public void setProd_idx(int prod_idx) {
		this.prod_idx = prod_idx;
	}
	public String getCategory_tb_code() {
		return category_tb_code;
	}
	public void setCategory_tb_code(String category_tb_code) {
		this.category_tb_code = category_tb_code;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public int getProd_price() {
		return prod_price;
	}
	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}
	public int getProd_stock() {
		return prod_stock;
	}
	public void setProd_stock(int prod_stock) {
		this.prod_stock = prod_stock;
	}
	public String getProd_wdate() {
		return prod_wdate;
	}
	public void setProd_wdate(String prod_wdate) {
		this.prod_wdate = prod_wdate;
	}
	public int getProd_hit() {
		return prod_hit;
	}
	public void setProd_hit(int prod_hit) {
		this.prod_hit = prod_hit;
	}
	public int getProd_sales() {
		return prod_sales;
	}
	public void setProd_sales(int prod_sales) {
		this.prod_sales = prod_sales;
	}
	public String getProd_co() {
		return prod_co;
	}
	public void setProd_co(String prod_co) {
		this.prod_co = prod_co;
	}
	public String getProd_rdate() {
		return prod_rdate;
	}
	public void setProd_rdate(String prod_rdate) {
		this.prod_rdate = prod_rdate;
	}
	public String getProd_imgt() {
		return prod_imgt;
	}
	public void setProd_imgt(String prod_imgt) {
		this.prod_imgt = prod_imgt;
	}
	public String getProd_imgm() {
		return prod_imgm;
	}
	public void setProd_imgm(String prod_imgm) {
		this.prod_imgm = prod_imgm;
	}
	public String getProd_imgd() {
		return prod_imgd;
	}
	public void setProd_imgd(String prod_imgd) {
		this.prod_imgd = prod_imgd;
	}
	public int getProd_qtymin() {
		return prod_qtymin;
	}
	public void setProd_qtymin(int prod_qtymin) {
		this.prod_qtymin = prod_qtymin;
	}
	public int getProd_qtymax() {
		return prod_qtymax;
	}
	public void setProd_qtymax(int prod_qtymax) {
		this.prod_qtymax = prod_qtymax;
	}
	public int getProd_reserv() {
		return prod_reserv;
	}
	public void setProd_reserv(int prod_reserv) {
		this.prod_reserv = prod_reserv;
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
	public String getOpt_stock() {
		return opt_stock;
	}
	public void setOpt_stock(String opt_stock) {
		this.opt_stock = opt_stock;
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
	public int getCoupon_idx() {
		return coupon_idx;
	}
	public void setCoupon_idx(int coupon_idx) {
		this.coupon_idx = coupon_idx;
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
	public String getCoupon_date() {
		return coupon_date;
	}
	public void setCoupon_date(String coupon_date) {
		this.coupon_date = coupon_date;
	}
	public String getCoupon_start() {
		return coupon_start;
	}
	public void setCoupon_start(String coupon_start) {
		this.coupon_start = coupon_start;
	}
	public String getCoupon_end() {
		return coupon_end;
	}
	public void setCoupon_end(String coupon_end) {
		this.coupon_end = coupon_end;
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
	
	
	
}
