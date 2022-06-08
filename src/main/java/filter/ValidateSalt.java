package filter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import com.google.common.cache.Cache;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

@WebFilter(filterName = "ValidateSalt", urlPatterns = { "/*" })
public class ValidateSalt implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        // Assume its HTTP
        HttpServletRequest httpReq = (HttpServletRequest) request;

        // Check request with method POST
        if (httpReq.getMethod().equals("POST")) {
            // Get the salt sent with the request
            String salt = (String) httpReq.getParameter("anticsrf");

            // Validate that the salt is in the cache
            Cache<String, Boolean> csrfPreventionSaltCache = (Cache<String, Boolean>)
                    httpReq.getSession().getAttribute("csrfPreventionSaltCache");

            if (csrfPreventionSaltCache != null &&
                    salt != null &&
                    csrfPreventionSaltCache.getIfPresent(salt) != null){

                // If the salt is in the cache, we move on
                chain.doFilter(request, response);
                return;
            } else {
                // Otherwise we throw an exception aborting the request flow
                throw new ServletException("Potential CSRF detected!! Inform a scary sysadmin ASAP.");
            }
        }
        chain.doFilter(request, response);
    }
}
