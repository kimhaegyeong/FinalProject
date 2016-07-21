package orders;

import java.util.List;

import mybatis.SqlMapClient;

public class OrdersDBBean implements OrdersDao {
	
	// 주문개수 가져오기
	public int getCount(int did) {
		return SqlMapClient.getSession().selectOne("Orders.getCount", did);
	}
	
	// 주문목록 가져오기
	public List<OrdersDataBean> getOrders(int did) {	
		return SqlMapClient.getSession().selectList("Orders.getOrders", did);
	} 
	
	// 주문수락 
	public int acceptOrder(int onum) {
		return SqlMapClient.getSession().update("Orders.acceptOrder", onum);
	}
	
	// 주문거절 
	public int refuseOrder(int onum) {
		return SqlMapClient.getSession().update("Orders.refuseOrder", onum);
	}
}
 