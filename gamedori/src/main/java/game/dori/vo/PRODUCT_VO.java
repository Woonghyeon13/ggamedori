package game.dori.vo;

/* ��ǰ ���̺�	*/

public class PRODUCT_VO {

	private int prod_idx;				// 상품 인덱스
	private String category_tb_code;		// 카테고리 코드 (품번)
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
	private String prod_img_t;			// 썸네일 이미지
	private String prod_img_m;			// 메인 이미지
	private String prod_img_d;			// 상세정보 이미지
	
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
	public String getProd_img_t() {
		return prod_img_t;
	}
	public void setProd_img_t(String prod_img_t) {
		this.prod_img_t = prod_img_t;
	}
	public String getProd_img_m() {
		return prod_img_m;
	}
	public void setProd_img_m(String prod_img_m) {
		this.prod_img_m = prod_img_m;
	}
	public String getProd_img_d() {
		return prod_img_d;
	}
	public void setProd_img_d(String prod_img_d) {
		this.prod_img_d = prod_img_d;
	}
	
	
	
	
}
