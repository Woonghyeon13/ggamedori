package game.dori.controller;



import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@RequestMapping(value="/payment")
@Controller
public class PaymentController {
    @RequestMapping(value = "/payment")
    public String payment() {
        return "payment";
    }
    
    
    @RequestMapping(value = "/complete", method = RequestMethod.POST)
    public @ResponseBody String paymentComplete(HttpServletRequest request) {
        // 결제 완료 시 처리 로직
        String imp_uid = request.getParameter("imp_uid");
        String merchant_uid = request.getParameter("merchant_uid");
        String paid_amount = request.getParameter("paid_amount");
        String apply_num = request.getParameter("apply_num");

        // 추가된 파라미터 값을 가져옵니다.
        String originalPrice = request.getParameter("originalPrice");
        String ord_pric = request.getParameter("ord_pric");

        System.out.println("결제성공");

        // 파라미터 값을 출력합니다.
        System.out.println("imp_uid: " + imp_uid);
        System.out.println("merchant_uid: " + merchant_uid);
        System.out.println("paid_amount: " + paid_amount);
        System.out.println("apply_num: " + apply_num);

        // 추가된 파라미터 값을 출력합니다.
        System.out.println("originalPrice: " + originalPrice);
        System.out.println("ord_pric: " + ord_pric);

        // 위에서 얻은 정보를 사용하여 결제 정보를 검증하고, 필요한 작업을 수행하세요.
        // 예를 들어, 주문 정보를 데이터베이스에 저장하거나 이메일로 결제 영수증을 발송할 수 있습니다.

        

        return "success";
    }
}
