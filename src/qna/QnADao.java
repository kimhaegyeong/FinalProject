package qna;

import java.util.List;
import java.util.Map;

public interface QnADao {
	public String getDWriter( int id );
	public String getSWriter( int id );
	public int getSearchTitle(String searchText);
	public int getSearchWriter(String searchText);
	public int getCount();
	public List<QnADataBean> getArticles(Map<String, String> map);
	public int insertArticle( QnADataBean dto);
	public QnADataBean getArticle( int num );
	public void addCount( int num );
	public int check( int num, String passwd );
	public int modifyArticle( QnADataBean dto );
	public int deleteArticle( int num );
}
