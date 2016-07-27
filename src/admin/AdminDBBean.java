package admin;

import mybatis.SqlMapClient;

public class AdminDBBean implements AdminDao{
	public int loginCheck(String id, String passwd){
		int result = 0;
		String anspw = SqlMapClient.getSession().selectOne("Admin.getPasswd", id);
		if(passwd.equals(anspw)){
			//비밀번호가 같다
			result = 1;
		}else{
			//비밀번호가 다르다
			result = 0;
		}
		return result;
	}	
	public int getFees() {
		return SqlMapClient.getSession().selectOne("Admin.getFees");
	}
	public AdminDataBean getAdmin(String id){
		return SqlMapClient.getSession().selectOne("Admin.getAdmin", id);
	}
	public int updateAdmin(AdminDataBean dto){
		return SqlMapClient.getSession().update("Admin.updateAdmin", dto);
	}
}
 