package game.dori.vo;


//QA 테이블의 VO클래스
public class QA_VO {
	
	private int qa_idx; //문의 인덱스
	private int member_tb_idx; //회원 인덱스
	private String qa_title; //제목
	private String qa_wdate; //작성일
	private String qa_contents; //내용
	private String qa_writer; //문의 작성자
	private int qa_yn; //답변여부 1:답변완료 2.미완
	
	public int getQa_idx() {
		return qa_idx;
	}
	public void setQa_idx(int qa_idx) {
		this.qa_idx = qa_idx;
	}
	public int getMember_tb_idx() {
		return member_tb_idx;
	}
	public void setMember_tb_idx(int member_tb_idx) {
		this.member_tb_idx = member_tb_idx;
	}
	public String getQa_title() {
		return qa_title;
	}
	public void setQa_title(String qa_title) {
		this.qa_title = qa_title;
	}
	public String getQa_wdate() {
		return qa_wdate;
	}
	public void setQa_wdate(String qa_wdate) {
		this.qa_wdate = qa_wdate;
	}
	public String getQa_contents() {
		return qa_contents;
	}
	public void setQa_contents(String qa_contents) {
		this.qa_contents = qa_contents;
	}
	public String getQa_writer() {
		return qa_writer;
	}
	public void setQa_writer(String qa_writer) {
		this.qa_writer = qa_writer;
	}
	public int getQa_yn() {
		return qa_yn;
	}
	public void setQa_yn(int qa_yn) {
		this.qa_yn = qa_yn;
	}
}
