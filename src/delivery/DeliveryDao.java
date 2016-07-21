package delivery;

public interface DeliveryDao {
	public int checkEmail(String id);
	public int loginCheck(String email, String passwd);
	public int getId(String email);
}
 