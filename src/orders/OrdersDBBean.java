package orders;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import mybatis.SqlMapClient;

public class OrdersDBBean implements OrdersDao {
	
	/*	배달신청	*/ 
	// 오토바이 대수 가져오기
	public int getBikeCount(int id) {
		return SqlMapClient.getSession().selectOne("Orders.getBikeCount", id);
	}
	// 선택 주문개수 가져오기
	public int getCount(int id) {		
		return SqlMapClient.getSession().selectOne("Orders.getCount", id);
	}
	// 전체 주문개수 가져오기
	public int getAllCount() {
		return SqlMapClient.getSession().selectOne("Orders.getAllCount");
	}
	
	// 선택 주문목록 가져오기
	public List<HashMap<String, Object>> getOrders(int id) {	
		return SqlMapClient.getSession().selectList("Orders.getOrders", id);
	} 
	
	// 전체 주문목록 가져오기
	public List<HashMap<String, Object>> getAllOrders() {
		return SqlMapClient.getSession().selectList("Orders.getAllOrders");
	}
	
	// 주문수락 오토바이-1
	public int acceptBike(int id) {
		return SqlMapClient.getSession().update("Orders.acceptBike", id);
	}
	
	// 주문수락 
	public int acceptOrder(Map<String, Integer> map) {
		return SqlMapClient.getSession().update("Orders.acceptOrder", map);
	}
	
	// 주문거절 
	public int refuseOrder(Map<String, Integer> map) {
		return SqlMapClient.getSession().update("Orders.refuseOrder", map);
	}
	
	/*	배달현황	*/ 
	// 배달 중 개수 가져오기
	public int getStateCount(int id) {
		return SqlMapClient.getSession().selectOne("Orders.getStateCount", id);
	}
	
	// 완료된 배달 카운팅
	public int getCompleteCount(int id) {
		return SqlMapClient.getSession().selectOne("Orders.getCompleteCount", id);
	}
	
	// 배달현황 가져오기
	public List<HashMap<String, Object>> getResOrders(int id) {	
		return SqlMapClient.getSession().selectList("Orders.getResOrders", id);
	} 
	
	// 배달완료 오토바이+1
	public int completeBike(int id) {
		return SqlMapClient.getSession().update("Orders.completeBike", id);
	}
	// 주문수락 상태변경
	public int changeState(int onum) {
		return SqlMapClient.getSession().update("Orders.changeState", onum);
	}
	
	// 주문거절 
	public int deleteState(int onum) {
		return SqlMapClient.getSession().update("Orders.deleteState", onum);
	}

	/* 주문신청 */
	@Override
	public int insertOrderOne(HashMap<String, Object> map) {
		return SqlMapClient.getSession().update("Orders.insertOrderOne", map);
	}

	@Override
	public int insertOrderAll(HashMap<String, Object> map) {
		return SqlMapClient.getSession().update("Orders.insertOrderAll", map);
	}
	
	public List<OrdersDataBean> adminGetOrders(){
		return SqlMapClient.getSession().selectList("Orders.adminGetOrders");
	}
	
	public int updateCurrent(int onum){
		return SqlMapClient.getSession().update("Orders.updateCurrent", onum);
	}
	
	@Override
	public int changeOpenAll(String now) {
		return SqlMapClient.getSession().update("Orders.changeOpenAll", now);
	}
	
	public int getStatusCount(int id) {
		return SqlMapClient.getSession().selectOne("Orders.getStatusCount", id);
	}
	
	public int getStatusAllCount(int id) {
		return SqlMapClient.getSession().selectOne("Orders.getStatusAllCount", id);
	}
	
	public List<HashMap<String, Object>> getStatusOrders(int id) {	
		return SqlMapClient.getSession().selectList("Orders.getStatusOrders", id);
	} 
	
}
 