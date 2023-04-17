package game.dori.util;

public class PROD_Q_LIST_VO {

	private int prod_q_idx;				// 상품 문의 인덱스
	private int product_tb_idx;			// 상품 인덱스
	private int member_tb_idx;			// 회원 인덱스
	private String prod_q_title;		// 제목
	private String prod_q_contents;		// 내용
	private String prod_q_writer;		// 작성 자
	private String prod_q_wdate;		// 작성 일
	private int prod_q_yn;				// 답변 여부	[1: y / 2 : n]
	private	int prod_q_secret;			// 비밀 글 여부	[1: y / 2 : n]
	private String	prod_q_reply;	// 답변내용
	
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
	private String prod_opt;			// 제품 옵션
	private String prod_rdate;			// 출시 일
	private int prod_rating;			// 성인 등급 여부	 [ 1: 일반 / 2 : 성인등급 ]
	private int prod_reserv;			// 예약 상품 여부
	private String prod_imgt;			// 썸네일 이미지
	private String prod_imgm;			// 메인 이미지
	private String prod_imgd;			// 상세정보 이미지
	private int prod_qtymin;			// 최소구매수량
	private int prod_qtymax;
	
	
	
	public int getProd_q_idx() {
		return prod_q_idx;
	}
	public void setProd_q_idx(int prod_q_idx) {
		this.prod_q_idx = prod_q_idx;
	}
	public int getProduct_tb_idx() {
		return product_tb_idx;
	}
	public void setProduct_tb_idx(int product_tb_idx) {
		this.product_tb_idx = product_tb_idx;
	}
	public int getMember_tb_idx() {
		return member_tb_idx;
	}
	public void setMember_tb_idx(int member_tb_idx) {
		this.member_tb_idx = member_tb_idx;
	}
	public String getProd_q_title() {
		return prod_q_title;
	}
	public void setProd_q_title(String prod_q_title) {
		this.prod_q_title = prod_q_title;
	}
	public String getProd_q_contents() {
		return prod_q_contents;
	}
	public void setProd_q_contents(String prod_q_contents) {
		this.prod_q_contents = prod_q_contents;
	}
	public String getProd_q_writer() {
		return prod_q_writer;
	}
	public void setProd_q_writer(String prod_q_writer) {
		this.prod_q_writer = prod_q_writer;
	}
	public String getProd_q_wdate() {
		return prod_q_wdate;
	}
	public void setProd_q_wdate(String prod_q_wdate) {
		this.prod_q_wdate = prod_q_wdate;
	}
	public int getProd_q_yn() {
		return prod_q_yn;
	}
	public void setProd_q_yn(int prod_q_yn) {
		this.prod_q_yn = prod_q_yn;
	}
	public int getProd_q_secret() {
		return prod_q_secret;
	}
	public void setProd_q_secret(int prod_q_secret) {
		this.prod_q_secret = prod_q_secret;
	}
	public String getProd_q_reply() {
		return prod_q_reply;
	}
	public void setProd_q_reply(String prod_q_reply) {
		this.prod_q_reply = prod_q_reply;
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
	public String getProd_opt() {
		return prod_opt;
	}
	public void setProd_opt(String prod_opt) {
		this.prod_opt = prod_opt;
	}
	public String getProd_rdate() {
		return prod_rdate;
	}
	public void setProd_rdate(String prod_rdate) {
		this.prod_rdate = prod_rdate;
	}
	public int getProd_rating() {
		return prod_rating;
	}
	public void setProd_rating(int prod_rating) {
		this.prod_rating = prod_rating;
	}
	public int getProd_reserv() {
		return prod_reserv;
	}
	public void setProd_reserv(int prod_reserv) {
		this.prod_reserv = prod_reserv;
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
	}			// 최대구매수량
	
}
	