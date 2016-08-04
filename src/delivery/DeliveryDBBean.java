package delivery;

import java.util.List;
import java.util.Map;

import mybatis.SqlMapClient;

public class DeliveryDBBean implements DeliveryDao {
	 
	public int loginCheck(String email, String passwd){
		int result = 0;
		String anspw = SqlMapClient.getSession().selectOne("Delivery.getPasswd", email);
		if(passwd.equals(anspw)){
			//비밀번호가 같다
			result = 1;
		}else{
			//비밀번호가 다르다
			result = 0;
		}
		return result;
	}
	
	public int checkEmail(String id){
		int result = 0;
		int count = SqlMapClient.getSession().selectOne("Delivery.getCount", id);
		if(count!=0){
			//아이디가 있다.
			result = 1;
		}else{
			//아이디가 없다.
			result = 0;
		}
		return result;
	}
	public int getId(String email){
		int id = SqlMapClient.getSession().selectOne("Delivery.getId", email);

		return id;
	}

	@Override
	public List<DeliveryDataBean> getInRangeMember(Map<String, Double> map) {
		return SqlMapClient.getSession().selectList("Delivery.getInRangeMember", map);
	}

	@Override
	public List<DeliveryDataBean> findDelName(String delname) {
		return SqlMapClient.getSession().selectList("Delivery.findDelName", delname);
	}
}