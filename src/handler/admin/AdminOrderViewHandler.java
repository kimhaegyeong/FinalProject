package handler.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;

@Controller
public class AdminOrderViewHandler implements CommandHandler {

	@RequestMapping("/adminOrderView")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int check = Integer.parseInt(request.getParameter("check"));
		String id = request.getParameter("id");
		
				
		
		request.setAttribute("check", check);
		request.setAttribute("id", id);
		 
		return new ModelAndView("/admin/adminOrderView");
	}

}
