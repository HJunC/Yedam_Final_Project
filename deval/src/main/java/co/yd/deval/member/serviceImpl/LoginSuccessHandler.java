package co.yd.deval.member.serviceImpl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		String uri = "/deval/";
		
		RequestCache requestCache = new HttpSessionRequestCache();
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		
		String prevPage = (String) request.getSession().getAttribute("prevPage");
		
		if(prevPage != null) {
			request.getSession().removeAttribute("prevPage");
		}
		
		if(savedRequest != null) {
			uri = savedRequest.getRedirectUrl();
		} else if(prevPage != null && !prevPage.equals("")) {
			uri = prevPage;
		}
		
		if(uri.contains("loginForm.do") || uri.contains("signUpForm")) {
			uri = "/deval/";
		}
		
		response.sendRedirect(uri);
	}

}
