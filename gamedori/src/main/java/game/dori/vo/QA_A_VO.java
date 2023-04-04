package game.dori.vo;



//답글 QA 테이블VO 
public class QA_A_VO {

	private int qa_a_idx; //문의 답변 인덱스
  private int qa_tb_index;    //문의 인덱스
  private String qa_a_reply ; //답글 텍스트 내용

	  public int getQa_a_idx() {
		  return qa_a_idx;
	  }
	  public void setQa_a_idx(int qa_a_idx) {
		  this.qa_a_idx = qa_a_idx;
	  }
	 public String getQa_a_reply() {
		return qa_a_reply;
	}
	public void setQa_a_reply(String qa_a_reply) {
		this.qa_a_reply = qa_a_reply;
	}
	public int getQa_tb_index() {
		return qa_tb_index;
	}
	public void setQa_tb_index(int qa_tb_index) {
		this.qa_tb_index = qa_tb_index;
	}
}
