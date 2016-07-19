package handler.registration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
 
@Controller
public class SignupFormHandler implements CommandHandler {

	@RequestMapping("/signupForm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String check = request.getParameter("check");
		
		request.setAttribute("check", check);
		
		return new ModelAndView("registration/signupForm");
	}

}
