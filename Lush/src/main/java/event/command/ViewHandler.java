package event.command;

import command.CommandHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewHandler implements CommandHandler {
    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String requestMethod = request.getMethod();
        String requestURI = request.getRequestURI();
        int startIdx = requestURI.indexOf("view") + 5;
        int endIdx = requestURI.indexOf(".do");
        String pageNo = requestURI.substring(startIdx, endIdx);
        if (requestMethod.equals("GET")){
            return "/event/view/"+ pageNo +".jsp";
        }else if (requestMethod.equals("POST")){

        }

        return null;
    }
}
