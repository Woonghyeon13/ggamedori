package game.dori.vo;

/*	��ǰ ���� ���̺�	*/

public class REVIEW_VO{

	private int review_idx;			// 리뷰 인덱스
	private int member_tb_idx;		// 회원 인덱스
	private int product_tb_idx;		// 상품 인덱스
	private String review_title;	// 리뷰 제목
	private String review_contents;	// 리뷰 내용
	private String review_writer;	// 작성자
	private String review_wdate;	// 작성일
	private int review_hit;			// 조회수
	private int review_star;		// 별점
	private String review_img;		// 이미지
	
	
	public int getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	public int getMember_tb_idx() {
		return member_tb_idx;
	}
	public void setMember_tb_idx(int member_tb_idx) {
		this.member_tb_idx = member_tb_idx;
	}
	public int getProduct_tb_idx() {
		return product_tb_idx;
	}
	public void setProduct_tb_idx(int product_tb_idx) {
		this.product_tb_idx = product_tb_idx;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_contents() {
		return review_contents;
	}
	public void setReview_contents(String review_contents) {
		this.review_contents = review_contents;
	}
	public String getReview_writer() {
		return review_writer;
	}
	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}
	public String getReview_wdate() {
		return review_wdate;
	}
	public void setReview_wdate(String review_wdate) {
		this.review_wdate = review_wdate;
	}
	public int getReview_hit() {
		return review_hit;
	}
	public void setReview_hit(int review_hit) {
		this.review_hit = review_hit;
	}
	public int getReview_star() {
		return review_star;
	}
	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}
	public String getReview_img() {
		return review_img;
	}
	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}
	
	
	
}
