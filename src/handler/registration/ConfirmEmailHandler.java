package handler.registration;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import delivery.DeliveryDao;
import handler.CommandHandler;
  
@Controller
public class ConfirmEmailHandler implements CommandHandler {

	@Resource(name="deliveryDao")
	private DeliveryDao deliverydao;

	@RequestMapping("/confirmEmail")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String id = request.getParameter("id");
		int result = deliverydao.checkEmail(id);
		
		request.setAttribute("id", id);
		request.setAttribute("result", result);

		return new ModelAndView("/registration/confirmEmail");
	}

}
