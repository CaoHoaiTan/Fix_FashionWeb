package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "XFrameOptionFilter", urlPatterns = {"/*"})
public class XFrameOptionFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {
        // TODO Auto-generated method stub
        System.out.println("X-frame Filter");
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        response.addHeader("X-FRAME-OPTIONS", "SAMEORIGIN");

        filterChain.doFilter(servletRequest, response);
    }

    @Override
    public void init(FilterConfig filterConfig) {
    }

    @Override
    public void destroy() {
    }


}