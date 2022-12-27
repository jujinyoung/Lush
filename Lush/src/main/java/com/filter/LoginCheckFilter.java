package com.filter;

import java.io.IOException;
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


@WebFilter("/member/logout.do")
public class LoginCheckFilter implements Filter {
	
	// 인증여부 사용 안 하는 url 리스트 
	//	private static final String[] whiteList = {"/", "/members/add", "/login", "/logout", "/css/*"}
 
    public LoginCheckFilter() {
  
    }


	public void destroy() {
		// TODO Auto-generated method stub
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("체크 필터 실행");
		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession session = req.getSession(false);
		
		if(session== null || session.getAttribute("authUser") == null) {
			System.out.println("세션이 없음");
			HttpServletResponse res = (HttpServletResponse)response;
			res.sendRedirect("LoginMain.jsp"); //로그인페이지로 이동
		}else {
			chain.doFilter(request, response);
		}
		
		
	
	}


	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
