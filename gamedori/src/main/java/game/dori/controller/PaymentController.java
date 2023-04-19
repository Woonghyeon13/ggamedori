package game.dori.controller;



import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@RequestMapping(value="/test")
@Controller
public class PaymentController {
    @RequestMapping(value = "/payment")
    public String payment() {
        return "payment";
    }
    
    
    @RequestMapping(value = "/payment/complete", method = RequestMethod.POST)
    public @ResponseBody String paymentComplete(HttpServletRequest request) {
        // 결제 완료 시 처리 로직
        String imp_uid = request.getParameter("imp_uid");
        String merchant_uid = request.getParameter("merchant_uid");
        String paid_amount = request.getParameter("paid_amount");
        String apply_num = request.getParameter("apply_num");

        // 위에서 얻은 정보를 사용하여 결제 정보를 검증하고, 필요한 작업을 수행하세요.
        // 예를 들어, 주문 정보를 데이터베이스에 저장하거나 이메일로 결제 영수증을 발송할 수 있습니다.

        
    	//********적립금 쌓은 후에 멤버 등급 처리되는 코드...
        //MemberSevice,DAO,Mapper에 코드 있습니다. . .
    	//1. 주문완료 후 해당 주문에 대한 적립금 연산
    	//2. 로그인한 유저의 총 적립금 에 + 1번 적립금 합을 구함
    	//3. 2번 총 적립금의 해당 등급을 확인
    	//4. 등급 변경이 있을 시에는 update 하는 user 정보에 수정하고자 하는 등급을 vo에 채우기
    	//5. 수정하고자 하는 user vo 에 적립금 누적금액도 채우기
    	//6. db update
        
        
        return "success";
    }
}
