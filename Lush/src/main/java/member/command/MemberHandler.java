package member.command;

import command.CommandHandler;
import member.domain.Member;
import member.service.MemberService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberHandler implements CommandHandler {

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	System.out.println("MemberHandler.process");
        MemberService memberService = MemberService.getInstance();
        Member member = memberService.selectMember();
        request.setAttribute("member", member);
        return "/order/order.jsp";
    }
}
