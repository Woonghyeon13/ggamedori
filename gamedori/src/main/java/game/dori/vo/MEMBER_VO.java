package game.dori.vo;


//유저 정보 테이블

public class MEMBER_VO {
	private int member_idx ; //유저 인덱스
	private int member_level ; //회원 등급 1:브론즈 2:실버 3:골드
	private String member_email; //회원 이메일(아이디)
	private String member_pw; //회원 비밀번호
	private String member_phone ; //회원 폰번호
	private String member_indate ; //가입날짜
	private int member_state; //회원상태 1:일반 2:정지 3:탈퇴
	private String member_name; //회원 이름
	private int member_mail_yn;  //이메일 인증여부  1:Y 2:N
	private String member_mail_key; //이메일인증키
	private int member_role; //회원권한 1:일반 2:관리자
	
	public int getMember_role() {
		return member_role;
	}
	public void setMember_role(int member_role) {
		this.member_role = member_role;
	}
	
	public int getMember_mail_yn() {
		return member_mail_yn;
	}
	public void setMember_mail_yn(int member_mail_yn) {
		this.member_mail_yn = member_mail_yn;
	}
	public String getMember_mail_key() {
		return member_mail_key;
	}
	public void setMember_mail_key(String member_mail_key) {
		this.member_mail_key = member_mail_key;
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
	
	
	
	
}
