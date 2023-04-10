package game.dori.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import game.dori.service.MemberService;
import game.dori.vo.MEMBER_VO;

@Controller
public class AjaxController {

    @Autowired
    MemberService memberService;

    @RequestMapping(value="/admin/updateMemberState.do", method=RequestMethod.POST)
    public @ResponseBody void updateMemberState(HttpServletRequest request, MEMBER_VO memberVO) {
        memberService.updateMemberState(memberVO);
    }
    
    
}
