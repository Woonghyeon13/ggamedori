package game.dori.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import game.dori.service.ProductService;
import game.dori.vo.CATEGORY_VO;
import game.dori.vo.PRODUCT_VO;
import net.sf.json.JSONArray;

@RequestMapping( value = "/admin" )
@Controller
public class AdminController {

	@Autowired
	private ProductService productService;
	
	// 회원관리
	@RequestMapping( value = "/member.do", method = RequestMethod.GET )
	public String member(){
		return "admin/member";
	}

	// 상품관리
	@RequestMapping( value = "/prod.do", method = RequestMethod.GET )
	public String prod( Model model ){
		List<CATEGORY_VO> category = null;
		category = productService.category();
		model.addAttribute("category", JSONArray.fromObject(category));
		return "admin/prod";
	}
	// 상품등록
	@RequestMapping( value = "/prod.do", method = RequestMethod.POST )
	public String prod( PRODUCT_VO pvo, MultipartFile prod_file1, MultipartFile prod_file2, MultipartFile prod_file3 ) throws IllegalStateException, IOException{
		
		String path = "C:\\Users\\720\\git\\ggamedori\\gamedori\\src\\main\\webapp\\resources\\images";
		
		File dir = new File(path);
		if(!dir.exists()) { 
			dir.mkdirs();
		}
		String newFileName = "";
		if(!prod_file1.getOriginalFilename().isEmpty()) { 
			String FileName = System.currentTimeMillis()+prod_file1.getOriginalFilename();
			newFileName = new String(FileName.getBytes("UTF-8"),"8859_1");
			prod_file1.transferTo(new File(path,newFileName));
			
		}else
		if(!prod_file2.getOriginalFilename().isEmpty()) { 
			String FileName = System.currentTimeMillis()+prod_file2.getOriginalFilename();
			newFileName = new String(FileName.getBytes("UTF-8"),"8859_1");
			prod_file2.transferTo(new File(path,newFileName));
			
		}else
		if(!prod_file3.getOriginalFilename().isEmpty()) { 
			String FileName = System.currentTimeMillis()+prod_file3.getOriginalFilename();
			newFileName = new String(FileName.getBytes("UTF-8"),"8859_1");
			prod_file3.transferTo(new File(path,newFileName));
			
		}
		String pfile1 = prod_file1.getOriginalFilename();
		String pfile2 = prod_file2.getOriginalFilename();
		String pfile3 = prod_file3.getOriginalFilename();
		pvo.setProd_imgt(pfile1);
		pvo.setProd_imgm(pfile2);
		pvo.setProd_imgd(pfile3);
		
		productService.prodInsert(pvo);
		return "admin/prod";
	}
	

	// 반품관리
	@RequestMapping( value = "/asreturn.do", method = RequestMethod.GET )
	public String asreturn(){
		return "admin/asreturn";
	}

	// 환불관리
	@RequestMapping( value = "/asrefund.do", method = RequestMethod.GET )
	public String asrefund(){
		return "admin/asrefund";
	}
	
	// 공지사항 관리
	@RequestMapping( value = "/notice.do", method = RequestMethod.GET )
	public String notice(){
		return "admin/notice";
	}
	
	// 1:1문의 관리
	@RequestMapping( value = "/oto.do", method = RequestMethod.GET )
	public String oto(){
		return "admin/oto";
	}
	
	// 상품문의 관리
	@RequestMapping( value = "/qaprod.do", method = RequestMethod.GET )
	public String qaprod(){
		return "admin/qaprod";
	}
}
