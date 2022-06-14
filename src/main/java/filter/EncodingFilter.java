package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;

@WebFilter(filterName = "EncodingFilter", urlPatterns = { "/*" })
public class EncodingFilter implements Filter {

	public static final String POLICY = "connect-src 'self';frame-src 'self'";
	public EncodingFilter() {
	}

	@Override
	public void init(FilterConfig fConfig) throws ServletException {

	}

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		if (response instanceof HttpServletResponse) {
			((HttpServletResponse)response).setHeader("Content-Security-Policy", EncodingFilter.POLICY);
		}

		chain.doFilter(request, response);
	}


}