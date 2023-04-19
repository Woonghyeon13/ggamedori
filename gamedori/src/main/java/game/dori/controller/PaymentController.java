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

        return "success";
    }
}
