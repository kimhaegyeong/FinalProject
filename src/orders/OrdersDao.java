package orders;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface OrdersDao {
	public int getBikeCount(int id);
	public int getCount(int id);
	public int getAllCount();
	public int getStateCount(int id);
	public int getCompleteCount(int id);
	public List<HashMap<String, Object>> getOrders(int did);
	public List<HashMap<String, Object>> getAllOrders();	
	public int acceptOrder(Map<String, Integer> map);
	public int acceptBike(int id);
	public int refuseOrder(Map<String, Integer> map);
	public List<HashMap<String, Object>> getResOrders(int id);
	public List<HashMap<String, Object>> getResAllOrders(Map<String, Integer> map);
	public int completeBike(int id);
	public int changeState(int onum);
	public int deleteState(int onum);
	public int insertOrderOne(HashMap<String, Object> map);
	public int insertOrderAll(HashMap<String, Object> map);
	public List<OrdersDataBean> adminGetOrders();
	public int updateCurrent(int onum);
	public int changeOpenAll(String now);
	public int getStatusCount(int id);
	public int getStatusAllCount(int id);
	public List<HashMap<String, Object>> getStatusOrders(int id);
}
 