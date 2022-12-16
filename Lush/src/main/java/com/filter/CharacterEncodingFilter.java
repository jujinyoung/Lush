package com.filter;

import javax.servlet.*;
import java.io.IOException;

public class CharacterEncodingFilter implements Filter {

    private String encoding;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // web.xml -> filter등록  encoding=UTF-8
        this.encoding =  filterConfig.getInitParameter("encoding");
        if( this.encoding == null )  encoding="UTF-8";
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        //
        System.out.println(">CharacterEncodingFilter.doFilter(); 호출됨");
        request.setCharacterEncoding("UTF-8");

        chain.doFilter(request, response); // 다음 체인이 있다면 이동
    }

    @Override
    public void destroy() {

    }
}
