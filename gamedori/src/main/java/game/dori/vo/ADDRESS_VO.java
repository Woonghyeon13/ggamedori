package game.dori.vo;

public class ADDRESS_VO {
	
	private String address_idx; //도로명주소 인덱스
	private int member_tb_idx; //회원 인덱스
	private String addr_1 ; //우편번호
	private String addr_2 ; //주소
	private String addr_3 ; //상세주소
	
	public String getAddress_idx() {
		return address_idx;
	}
	public void setAddress_idx(String address_idx) {
		this.address_idx = address_idx;
	}
	public int getMember_tb_idx() {
		return member_tb_idx;
	}
	public void setMember_tb_idx(int member_tb_idx) {
		this.member_tb_idx = member_tb_idx;
	}
	public String getAddr_1() {
		return addr_1;
	}
	public void setAddr_1(String addr_1) {
		this.addr_1 = addr_1;
	}
	public String getAddr_2() {
		return addr_2;
	}
	public void setAddr_2(String addr_2) {
		this.addr_2 = addr_2;
	}
	public String getAddr_3() {
		return addr_3;
	}
	public void setAddr_3(String addr_3) {
		this.addr_3 = addr_3;
	}
	
	
}
