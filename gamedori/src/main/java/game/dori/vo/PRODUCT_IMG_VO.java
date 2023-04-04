package game.dori.vo;

public class PRODUCT_IMG_VO {
	private int 	img_idx;			// 이미지 인덱스
	private int 	product_tb_idx;		// 상품 인덱스
	private String  img_origin;			// 원본파일명
	private String  img_save;			// 저장파일명
	private String  img_sum;			// 썸네일(기본이미지)
	private String  img_1;				// 추가이미지1
	private String  img_2;				// 추가이미지2
	
	public int getImg_idx() {
		return img_idx;
	}
	public void setImg_idx(int img_idx) {
		this.img_idx = img_idx;
	}
	public int getProduct_tb_idx() {
		return product_tb_idx;
	}
	public void setProduct_tb_idx(int product_tb_idx) {
		this.product_tb_idx = product_tb_idx;
	}
	public String getImg_origin() {
		return img_origin;
	}
	public void setImg_origin(String img_origin) {
		this.img_origin = img_origin;
	}
	public String getImg_save() {
		return img_save;
	}
	public void setImg_save(String img_save) {
		this.img_save = img_save;
	}
	public String getImg_sum() {
		return img_sum;
	}
	public void setImg_sum(String img_sum) {
		this.img_sum = img_sum;
	}
	public String getImg_1() {
		return img_1;
	}
	public void setImg_1(String img_1) {
		this.img_1 = img_1;
	}
	public String getImg_2() {
		return img_2;
	}
	public void setImg_2(String img_2) {
		this.img_2 = img_2;
	}
	public String getImg_3() {
		return img_3;
	}
	public void setImg_3(String img_3) {
		this.img_3 = img_3;
	}
	private String  img_3;				// �߰��̹���3
}
