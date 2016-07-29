package handler.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import orders.OrdersDao;
import orders.OrdersDataBean;

@Controller
public class AdminOrderViewHandler implements CommandHandler {

	@Resource(name="ordersDao")
	private OrdersDao ordersdao;
	
	@RequestMapping("/adminOrderView")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<OrdersDataBean> orders = ordersdao.adminGetOrders();
		
		request.setAttribute("orders", orders);
		
		return new ModelAndView("/admin/adminOrderView");
	}

}
