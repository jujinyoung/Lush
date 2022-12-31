package com.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebFilter("/manager/*")
public class AdmCheckFilter implements Filter {


    public AdmCheckFilter() {
        // TODO Auto-generated constructor stub
    }


	public void destroy() {
		// TODO Auto-generated method stub
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("관리자 체크 필터 실행");
		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession session = req.getSession(false);

		if(session== null || session.getAttribute("Admin") == null) {
			System.out.println("관리작 세션이 없음");
			
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('관리자로 로그인 해 주세요.'); location.href='../admin/AdminLogin.jsp';</script>");
            out.flush();
			
			
			//HttpServletResponse res = (HttpServletResponse)response;
		//	res.sendRedirect("../admin/AdminLogin.jsp"); //로그인페이지로 이동
			destroy();
		}else {
			chain.doFilter(request, response);
		}
		
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
