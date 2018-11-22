package controllers.filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.Duration;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Arrays;
import  models.User;

@WebFilter("/RequestLoggingFilter")
public class RequestLogFilter implements Filter {
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		Instant start = Instant.now();
		try
		{

			HttpServletRequest in = (HttpServletRequest) request;

			HttpSession session=in.getSession();
			User uservalid = (User) session.getAttribute("user");

			HttpServletRequest requestreal = (HttpServletRequest) request;
			String requestURI = requestreal.getRequestURI();

			String path= ((HttpServletRequest) request).getServletPath();


			ArrayList<String> allow = new ArrayList<String>(
					Arrays.asList("/index.jsp","/" , ".js",

							"/backend/login.jsp",
							"/Logout",
							"/rentals",
							"/backend/signin.css",
							"/backend/signin.css",

							"/loginController",
							"/images",
							"/frontend/rentals.css",
							".jsp",


							".css","/backend/login.jsp"));

			if ("POST".equals( requestreal.getMethod()))

			{
				if (  uservalid == null )

				{


					RequestDispatcher dd=request.getRequestDispatcher("/backend/login.jsp");
					dd.forward(request, response);


				}

			}

			else if (!allow.contains(path)  && !path.contains("css") && !path.contains("js") && !path.contains("png") && !path.contains("jpg")    )

			{

				if (  uservalid == null )

				{


					RequestDispatcher dd=request.getRequestDispatcher("/backend/login.jsp");
					dd.forward(request, response);


				}



			}

			chain.doFilter(request, response);

		} finally {
			Instant end = Instant.now();
			Duration timeElapsed = Duration.between(start, end);
			HttpServletRequest in = (HttpServletRequest) request;
			HttpServletResponse out = (HttpServletResponse) response;
			String length = out.getHeader("Content-Length");
			if (length == null || length.length() == 0)
				length = "-";
			System.out.println(in.getRemoteAddr() + " - - [" + start + "]" + " \"" + in.getMethod() + " "
					+ in.getRequestURI() + " " + in.getProtocol() + "\" " + out.getStatus() + " " + length + " "
					+ timeElapsed.toNanos() + " nano-seconds");
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void destroy() {
	}
}