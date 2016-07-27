package bike;

import java.util.List;

import mybatis.SqlMapClient;

public class BikeDBBean implements BikeDao {
	
	public List<BikeDataBean> bikeList(int id){
		return SqlMapClient.getSession().selectList("Bike.bikeList", id);
	}
	public int insertBike(BikeDataBean dto){
		return SqlMapClient.getSession().insert("Bike.insertBike",dto);
	}
}
 