package controller;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "doFilter",
        description = "No Cache Filter",
        urlPatterns = {"/contact.jsp","/menuAd.jsp","/menu.jsp","/shopCar.jsp","/personal.jsp","/personalAd.jsp"},
        initParams = {
        @WebInitParam(name = "backurl",value = "index.jsp")
        }
)
public class doFilter implements Filter {
    String backUrl;
    public void destroy() {
    }
    public void init(FilterConfig config) throws ServletException {
        backUrl = config.getInitParameter("backurl");
        System.out.println("过滤器初始化");
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        //向下转型
        HttpServletRequest httpServletRequest = (HttpServletRequest) req;
        HttpServletResponse httpServletResponse = (HttpServletResponse) resp;
        HttpSession session = httpServletRequest.getSession();

        httpServletResponse.setHeader("Pragma", "no-cache");
        httpServletResponse.setHeader("Cache-Control", "no-cache");
        httpServletResponse.setDateHeader("Expires", -1);

        String a = ((HttpServletRequest) req).getRequestURI();
        //获取session对象
        String username = (String) session.getAttribute("username");
        if (username == null) {
            httpServletResponse.sendRedirect(backUrl);
        } else {
            chain.doFilter(req, resp);
        }
    }
}
