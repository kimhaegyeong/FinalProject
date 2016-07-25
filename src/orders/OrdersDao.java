package orders;

import java.util.HashMap;
import java.util.List;

public interface OrdersDao {
	public int getCount(int did);
	public List<OrdersDataBean> getOrders(int did);
	public int acceptOrder(int onum);
	public int refuseOrder(int onum);
	public int insertOrder(HashMap<String, Object> map);
}
 