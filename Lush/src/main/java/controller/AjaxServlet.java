package controller;

import command.CommandHandler;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;

public class AjaxServlet extends HttpServlet {

    @Override
    public void destroy() {System.out.println("AjaxServlet.destroy");}


    private Map<String, CommandHandler> commandHandlerMap = new HashMap<>();

    @Override
    public void init() throws ServletException {
//        System.out.println("AjaxServlet.init");
        String path = this.getInitParameter("ajaxPath");
        String realPath = this.getServletContext().getRealPath(path);

        Properties prop = new Properties();

        try(FileReader reader = new FileReader(realPath)){
            prop.load(reader);
        }catch (Exception e){
            throw new ServletException();
        }

        Set<Map.Entry<Object, Object>> set = prop.entrySet();
        Iterator<Map.Entry<Object, Object>> ir = set.iterator();
        while (ir.hasNext()){
            Map.Entry<Object, Object> entry = ir.next();
            String url = (String) entry.getKey();
            String className = (String) entry.getValue();
//            System.out.println("url = " + url);

            try {
                Class<?> handlerClass = Class.forName(className);
                CommandHandler commandHandler = (CommandHandler) handlerClass.newInstance();

                commandHandlerMap.put(url, commandHandler);
            }catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        System.out.println("AjaxServlet.doGet");
        String requestURI = request.getRequestURI();
//        System.out.println("requestURI = " + requestURI);
        CommandHandler handler = commandHandlerMap.get(requestURI);

        try {
//            System.out.println("AjaxServlet.doGet process실행");
            handler.process(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
