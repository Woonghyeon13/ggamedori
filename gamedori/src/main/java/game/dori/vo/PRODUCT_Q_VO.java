package game.dori.vo;

/* ��ǰ ���� ���̺�	*/

public class PRODUCT_Q_VO {
	
	private int prod_q_inx;				// 상품 문의 인덱스
	private int product_tb_idx;			// 상품 인덱스
	private int member_tb_idx;			// 회원 인덱스
	private String prod_q_title;		// 제목
	private String prod_q_contents;		// 내용
	private String prod_q_writer;		// 작성 자
	private String prod_q_wdate;		// 작성 일
	private int prod_q_yn;				// 답변 여부	[1: y / 2 : n]
	private	int prod_q_secret;			// 비밀 글 여부	[1: y / 2 : n]
	
	
	public int getProd_q_inx() {
		return prod_q_inx;
	}
	public void setProd_q_inx(int prod_q_inx) {
		this.prod_q_inx = prod_q_inx;
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
	
	
}
