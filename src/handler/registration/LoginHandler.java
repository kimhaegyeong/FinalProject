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
import stores.StoresDao;
 
@Controller
public class LoginHandler implements CommandHandler {
	
	@Resource(name="deliveryDao")
	private DeliveryDao deliveryDao;
	
	@Resource(name="adminDao")
	private AdminDao adminDao;
	
	@Resource(name="storesDao")
	private StoresDao storesDao;
	
	@RequestMapping("/login")
	@Override 
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int check = Integer.parseInt(request.getParameter("check"));
		String email = request.getParameter("email");
		String passwd = request.getParameter("passwd");
		
		
		int result = 0;
		int id = 0;
		
		if(check==1){
			result = deliveryDao.loginCheck(email, passwd);
		}else if(check==2){
			result = storesDao.loginCheck(email, passwd);
		}else if(check==3){
			result = adminDao.loginCheck(email, passwd);
		}
		
		if(result==1){
			if(check==1){
				id = deliveryDao.getId(email);
			}else if(check==2){
				id = storesDao.getId(email);
			}
		}
		
		request.setAttribute("check", check);
		request.setAttribute("id", id);
		request.setAttribute("result", result);
		request.setAttribute("email", email);
		
		return new ModelAndView("/registration/login");
	}

}
