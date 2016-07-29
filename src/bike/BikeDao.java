package bike;

import java.util.List;

public interface BikeDao {
	public List<BikeDataBean> bikeList(int id);
	public int insertBike(BikeDataBean dto);
}
 