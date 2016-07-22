package stores;

public interface StoresDao {
	public int loginCheck(String email, String passwd);
	public int checkEmail(String id);
	public int getId(String email);
	public StoresDataBean getMember(int id);
}
 