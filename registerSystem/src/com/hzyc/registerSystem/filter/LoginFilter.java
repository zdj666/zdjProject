package com.hzyc.registerSystem.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.hzyc.registerSystem.po.Permission;
import com.hzyc.registerSystem.po.Users;
import com.hzyc.registerSystem.services.impl.FilterImpl;
import com.hzyc.registerSystem.tools.BeanUtil;

/**
 * Servlet Filter implementation class LoginFilter
 */
public class LoginFilter implements Filter {
	
	
    /**
     * Default constructor. 
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	/*在这里面设置要过滤的规则！*/
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		String url = httpRequest.getRequestURI();//得到访问的路径
		String lastUrl = url.substring(url.lastIndexOf("/") , url.length() );
		Users user = (Users)httpRequest.getSession().getAttribute("user");
		FilterImpl filter = (FilterImpl)BeanUtil.getBean("filterImpl");
		List<Permission> pList = filter.chaAllFunHasPer();
		
		boolean both = true;
		
		for (int i=0; i<pList.size(); i++) {
			String pinjie = "/" + pList.get(i).getResourcePath() ;
			if (pinjie.equals(lastUrl)) {
				both = false;
				break;
			}
		}
		
		if (both) {
			chain.doFilter(request, response);
		} else if (user!=null) {
			boolean flag = false;
			int id = user.getId();
			//查询出这个id下能访问的页面
			List<Permission> list = filter.filterSel(id);
			for (int i=0; i<list.size(); i++) {
				String pinjie = "/" + list.get(i).getResourcePath() ;
				if (pinjie.equals(lastUrl)) {
					flag = true;
					break;
				}
			}
			if (flag) {
				chain.doFilter(request, response);
			} else {
				request.setAttribute("sucess", "你没有访问该页面的权限！");
				request.setAttribute("url", "login.jsp");
				request.getRequestDispatcher("register_clue.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("sucess", "不能这么访问！");
			request.setAttribute("url", "login.jsp");
			request.getRequestDispatcher("register_clue.jsp").forward(request, response);
		}
	}
	

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
