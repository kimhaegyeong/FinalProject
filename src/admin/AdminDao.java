package admin;

public interface AdminDao {
	public int loginCheck(String id, String passwd);
	public int getFees();
	public AdminDataBean getAdmin(String id);
	public int updateAdmin(AdminDataBean dto);
}
 