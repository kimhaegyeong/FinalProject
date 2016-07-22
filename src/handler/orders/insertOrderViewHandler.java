package handler.orders;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.SessionScope;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import stores.StoresDao;
import stores.StoresDataBean;
 
@Controller
public class insertOrderViewHandler implements CommandHandler {
	@Resource(name="storesDao")
	private StoresDao storesDao;
	
	@RequestMapping("/insertOrderView")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int id = (int)request.getSession().getAttribute("id");
		StoresDataBean dto = storesDao.getMember(id);
		request.setAttribute("lat", dto.getLat());
		request.setAttribute("lng", dto.getLng());
	
		return new ModelAndView("orders/insertOrderView");
	}
}
