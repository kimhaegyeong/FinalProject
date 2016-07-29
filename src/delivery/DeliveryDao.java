package delivery;

import java.util.List;
import java.util.Map;

public interface DeliveryDao {
	public int checkEmail(String id);
	public int loginCheck(String email, String passwd);
	public int getId(String email);
	public List<DeliveryDataBean> getInRangeMember(Map<String, Double> map);
}
 