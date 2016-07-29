package handler.registration;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import admin.AdminDao;
import delivery.DeliveryDao;
import handler.CommandHandler;
 
@Controller
public class LoginHandler implements CommandHandler {
	
	@Resource(name="deliveryDao")
	private DeliveryDao deliveryDao;
	
	@Resource(name="adminDao")
	private AdminDao adminDao;
	
	@RequestMapping("/login")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int check = Integer.parseInt(request.getParameter("check"));
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		int result = 0;
		
		if(check==1){
			//A로 로그인할 경우
			//result = deliverydao.loginCheck(id, passwd);
		}else if(check==2){
			//B로 로그인할 경우
			//result = deliverydao.loginCheck(id, passwd);
		}else if(check==3){
			//C로 로그인할 경우
			result = adminDao.loginCheck(id, passwd);
		}
		
		
		request.setAttribute("check", check);
		request.setAttribute("id", id);
		request.setAttribute("passwd", passwd);
		request.setAttribute("result", result);
		
		return new ModelAndView("/registration/login");
	}

}
