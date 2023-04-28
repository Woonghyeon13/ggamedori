package game.dori.vo;

public class PRODUCTQQ_VO {
	
	private int prod_idx;				// 상품 인덱스
	private int prod_q_idx;				// 상품 문의 인덱스
	private int product_tb_idx;			// 상품 인덱스
	private int member_tb_idx;			// 회원 인덱스
	private String prod_q_title;		// 제목
	private String prod_q_contents;		// 내용
	private String prod_q_writer;		// 작성 자
	private String prod_q_wdate;		// 작성 일
	private int prod_q_yn;				// 답변 여부	[1: y / 2 : n]
	private	int prod_q_secret;			// 비밀 글 여부	[1: y / 2 : n] 1일때 비밀글 2일떄 안비밀글
	private String	prod_q_reply;		// 답변내용
	private String prod_name;			//상품명


}
