package game.dori.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import game.dori.service.AdminService;
import game.dori.service.MemberService;
import game.dori.util.ORDER_LIST_VO;
import game.dori.vo.AD_VO;
import game.dori.vo.CAROUSEL_VO;
import game.dori.vo.CATEGORY_IMG_VO;
import game.dori.vo.MEMBER_VO;

@Controller
public class AjaxController {

    @Autowired
    MemberService memberService;
    
    @Autowired
    AdminService AdminService;

    //회원관리 회원상태 변경
    @RequestMapping(value="/admin/updateMemberState.do", method=RequestMethod.POST)
    public @ResponseBody void updateMemberState(HttpServletRequest request, MEMBER_VO memberVO) {
        memberService.updateMemberState(memberVO);
    }
    
	// 메인페이지 캐러셀 추가, 이 경우 @responseBody는 안써도 작동함(db에 값 넣어주기만 해서 그런듯)
	@RequestMapping(value = "/admin/carouselInsert.do", method = RequestMethod.POST )
	@ResponseBody
	public String carouselInsert(CAROUSEL_VO cavo, HttpServletRequest req, HttpServletResponse rsp, MultipartFile carousel_img_file) throws IllegalStateException, IOException{
		
		String path = req.getSession().getServletContext().getRealPath("/resources/images/carousel");
		
		System.out.println(path);
		
		File dir = new File(path);
		if(!dir.exists()) { 
			dir.mkdirs();
		}
		
		String newFileName = "";
		if(!carousel_img_file.getOriginalFilename().isEmpty()) { 
			String FileName = System.currentTimeMillis()+carousel_img_file.getOriginalFilename();
			newFileName = new String(FileName.getBytes("UTF-8"),"8859_1");
			carousel_img_file.transferTo(new File(path,newFileName));
			
		//	cavo.setCarousel_img_name(carousel_img_file.getOriginalFilename()); db에 앞에 숫자 잘라서 넣음
			cavo.setCarousel_img_name(newFileName);
			
			int result = AdminService.carouselInsert(cavo);
			
			// Ajax 응답
	        if (result > 0) {
	            return "success";
	        } else {
	            return "fail";
	        }
		}
		return "fail";	
	}
    
	// 메인페이지 광고 추가
	@RequestMapping(value ="/admin/adInsert.do", method = RequestMethod.POST )
	@ResponseBody
	public String adInsert(AD_VO advo, HttpServletRequest req, HttpServletResponse rsp, MultipartFile ad_img_b_file, MultipartFile ad_img_s_file) throws IllegalStateException, IOException{
		
		String path = req.getSession().getServletContext().getRealPath("/resources/images/ad");
		
		System.out.println(path);
		
		File dir = new File(path);
		if(!dir.exists()) { 
			dir.mkdirs();
		}
		
		String newFileName_b = "";//큰 이미지
		String newFileName_s = "";//작은 이미지
		if(!ad_img_b_file.getOriginalFilename().isEmpty() && !ad_img_s_file.getOriginalFilename().isEmpty()) { 
			String FileName_b = System.currentTimeMillis()+ad_img_b_file.getOriginalFilename();//큰 이미지
			String FileName_s = System.currentTimeMillis()+ad_img_s_file.getOriginalFilename();//작은 이미지
			
			newFileName_b = new String(FileName_b.getBytes("UTF-8"),"8859_1");//큰 이미지
			newFileName_s = new String(FileName_s.getBytes("UTF-8"),"8859_1");//작은 이미지
			
			ad_img_b_file.transferTo(new File(path,newFileName_b));//큰 이미지
			ad_img_s_file.transferTo(new File(path,newFileName_s));//작은 이미지
			
			advo.setAd_img_b(newFileName_b);//큰 이미지
			advo.setAd_img_s(newFileName_s);//작은 이미지
	
			int result = AdminService.adInsert(advo);
			
			// Ajax 응답
	        if (result > 0) {
	            return "success";
	        } else {
	            return "fail";
	        }
		}
		return "fail";
		
	}
	
	// 카테고리 이미지 추가
	@RequestMapping(value = "/admin/cateImgInsert.do", method = RequestMethod.POST )
	@ResponseBody
	public String cateImgInsert(CATEGORY_IMG_VO civo, HttpServletRequest req, HttpServletResponse rsp, MultipartFile cate_img_file) throws IllegalStateException, IOException{
		
		String path = req.getSession().getServletContext().getRealPath("/resources/images/categoryImg");
		
		System.out.println(path);
		
		File dir = new File(path);
		if(!dir.exists()) { 
			dir.mkdirs();
		}
		
		String newFileName = "";
		if(!cate_img_file.getOriginalFilename().isEmpty()) { 
			String FileName = System.currentTimeMillis()+cate_img_file.getOriginalFilename();
			newFileName = new String(FileName.getBytes("UTF-8"),"8859_1");
			cate_img_file.transferTo(new File(path,newFileName));
			

			civo.setCate_img_name(newFileName);
			
			
			int result = AdminService.cateImgInsert(civo);
			
			// Ajax 응답
	        if (result > 0) {
	            return "success";
	        } else {
	            return "fail";
	        }
		}
		return "fail";	
	}
	
	
	//주문상태 변경
    @RequestMapping(value="/admin/updateOrderState.do", method=RequestMethod.POST)
    public @ResponseBody void updateOrderState(HttpServletRequest request, ORDER_LIST_VO orderlistVO) {
    	AdminService.updateOrderState(orderlistVO);
    }
    
    //관리자 페이지 주문상세 데이터 보내주기
//    @RequestMapping(value = "/admin/adminOrderDetail.do", method = RequestMethod.POST)
//    @ResponseBody
//    public List<Map<String, Object>> adminOrderDetail(@RequestParam int order_idx) {
//    	 List<Map<String, Object>> data = new ArrayList<>();
//    	    List<ORDER_LIST_VO> orderDetails = AdminService.getOrderDetail(order_idx);
//    	    for (ORDER_LIST_VO orderDetail : orderDetails) {
//    	        Map<String, Object> map = new HashMap<>();
//    	        map.put("order_idx", orderDetail.getOrder_idx());
//    	        map.put("prod_name", orderDetail.getProd_name());
//    	        
//    	        data.add(map);
//    	    }
//    	    return data;
//    }

    @RequestMapping(value = "/admin/adminOrderDetail.do", method = RequestMethod.POST)
    @ResponseBody
    public List<ORDER_LIST_VO> adminOrderDetail(@RequestParam int order_idx, Model model) {
        List<ORDER_LIST_VO> orderd = AdminService.getOrderDetail(order_idx);
        return orderd;
    }

}
