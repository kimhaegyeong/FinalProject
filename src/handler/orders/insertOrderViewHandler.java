package handler.orders;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.SessionScope;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
 
@Controller
public class insertOrderViewHandler implements CommandHandler {

	@RequestMapping("/orderViewForm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String sid = (String) request.getSession().getAttribute( "sid" );
		
		
	
		return new ModelAndView("order/orderViewForm");
	}

}
