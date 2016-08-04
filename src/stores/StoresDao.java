package stores;

import java.util.List;

public interface StoresDao {
	public int loginCheck(String email, String passwd);
	public int checkEmail(String id);
	public int getId(String email);
	public StoresDataBean getMember(int id);
	public List<StoresDataBean> adminFindOwner(String finder);
}
 