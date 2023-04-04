package game.dori.vo;


//공지사항 테이블의 VO
public class NOTICE_VO {
	
	private int notice_idx ; //공지사항 인덱스
	private int member_tb_idx; //회원 인덱스
	private String notice_title; //글 제목
	private String notice_wdate; //글 작성일
	private String notice_contents; //글 내용
	private String notice_writer; //글 작성자
	
	
	public int getNotice_idx() {
		return notice_idx;
	}
	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}
	public int getMember_tb_idx() {
		return member_tb_idx;
	}
	public void setMember_tb_idx(int member_tb_idx) {
		this.member_tb_idx = member_tb_idx;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_wdate() {
		return notice_wdate;
	}
	public void setNotice_wdate(String notice_wdate) {
		this.notice_wdate = notice_wdate;
	}
	public String getNotice_contents() {
		return notice_contents;
	}
	public void setNotice_contents(String notice_contents) {
		this.notice_contents = notice_contents;
	}
	public String getNotice_writer() {
		return notice_writer;
	}
	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}
}
