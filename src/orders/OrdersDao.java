package orders;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface OrdersDao {
	public int getCount(int id);
	public int getAllCount();
	public List<HashMap<String, Object>> getOrders(int did);
	public List<OrdersDataBean> getAllOrders();
	public int acceptOrder(Map<String, Integer> map);
	public int refuseOrder(Map<String, Integer> map);
	public List<HashMap<String, Object>> getResOrders(int did);
	public int changeState(int onum);
	public int deleteState(int onum);
	public int insertOrderOne(HashMap<String, Object> map);
	public int insertOrderAll(HashMap<String, Object> map);
	public List<OrdersDataBean> adminGetOrders();
	public int updateCurrent(int onum);
}
 