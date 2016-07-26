package handler.orders;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import delivery.DeliveryDao;
import handler.CommandHandler;
import orders.OrdersDao;
import stores.StoresDao;

@Controller
public class InsertOrderHandler implements CommandHandler {
	@Resource(name="storesDao")
	private StoresDao storesDao;
	
	@Resource(name="deliveryDao")
	private DeliveryDao deliveryDao;
	
	@Resource(name="ordersDao")
	private OrdersDao ordersDao;
	
	@RequestMapping("/insertOrder")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int result = 0;
		request.setCharacterEncoding("utf-8");
		
		HashMap<String, Object> map = new HashMap<String, Object> ();
		map.put("sid", request.getSession().getAttribute("id"));
		map.put("destination", request.getParameter("destination"));
		map.put("fees", Integer.parseInt(request.getParameter("fees")));
		map.put("price", Integer.parseInt(request.getParameter("stoPrice")));
		map.put("limit_time", Integer.parseInt(request.getParameter("limit_time")));
		map.put("res_limit_time", request.getParameter("res_limit_time"));
		
		String opencheck = request.getParameter("opencheck");
		map.put("opencheck", opencheck);
		
		if (!opencheck.equals("")  && opencheck.equals("n")) {
			map.put("dprice", Integer.parseInt(request.getParameter("delDPrice")));
			map.put("did", Integer.parseInt(request.getParameter("did")));
			result = ordersDao.insertOrderOne(map);
		} else {
			result = ordersDao.insertOrderAll(map);
		}
		
		request.setAttribute("result", result);
		
		return new ModelAndView("orders/insertOrder");
	}

}
