package handler.orders;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import delivery.DeliveryDao;
import delivery.DeliveryDataBean;
import handler.CommandHandler;

@Controller
public class InRangeDeliveryHandler implements CommandHandler {
	@Resource(name="deliveryDao")
	private DeliveryDao deliveryDao;
		
	@RequestMapping("/inRangeDelivery")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		double swLat = Double.parseDouble(request.getParameter("swLat"));
		double swLng = Double.parseDouble(request.getParameter("swLng"));
		double neLat = Double.parseDouble(request.getParameter("neLat"));
		double neLng = Double.parseDouble(request.getParameter("neLnt"));
		
		Map<String, Double> map = new HashMap<String, Double> (); 
		map.put("swLat", swLat);
		map.put("swLng", swLng);
		map.put("neLat", neLat);
		map.put("neLng", neLng);
		
		List<DeliveryDataBean> deliveryList = deliveryDao.getInRangeMember(map);
		request.setAttribute("deliveryList", deliveryList);
		
		return new ModelAndView("orders/inRangeDelivery");
	}

}
