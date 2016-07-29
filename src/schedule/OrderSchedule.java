package schedule;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import delivery.DeliveryDao;
import orders.OrdersDao;

@Component
public class OrderSchedule {
	@Resource( name="ordersDao" )
	private OrdersDao ordersDao;	
	
	@Resource( name="deliveryDao" )
	private DeliveryDao deliveryDao;	
	
	@Scheduled(cron = "0 * * * * *")		// 매분 마다
	public void checkOpenAll() {			// 응답시간 만료 후 전체 공개
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
		ordersDao.changeOpenAll(sdf.format(now));
	}
	
//	@Scheduled(cron = "0 5 * * * *")		// 매일 새벽 5시
//	public void initBikeCount() {
//		deliveryDao.initBikeCount();
//	}
}
