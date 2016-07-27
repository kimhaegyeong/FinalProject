package orders;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface OrdersDao {
	public int getCount(String did);
	public int getAllCount();
	public List<OrdersDataBean> getOrders(String did);
	public List<OrdersDataBean> getAllOrders();
	public int acceptOrder(Map<String, Integer> map);
	public int refuseOrder(Map<String, Integer> map);
	public List<OrdersDataBean> getResOrders(String did);
	public int changeState(int onum);
	public int deleteState(int onum);
	public int insertOrderOne(HashMap<String, Object> map);
	public int insertOrderAll(HashMap<String, Object> map);
	public List<OrdersDataBean> adminGetOrders();
	public int updateCurrent(int onum);
}
 