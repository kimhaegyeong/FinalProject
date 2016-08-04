package qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import mybatis.SqlMapClient;

public class QnADBBean implements QnADao {
	
	// 글쓰기 작성자 얻어오기
	public String getDWriter( int id ) {
		return SqlMapClient.getSession().selectOne("Board.getDWriter", id);
	}
	
	public String getSWriter( int id ) {
		return SqlMapClient.getSession().selectOne("Board.getSWriter", id);
	}
	 
	// 검색할 글 개수 얻어오기
	public int getSearchTitle(String searchText) {
		return SqlMapClient.getSession().selectOne("Board.getSearchTitle", searchText);
	}
	
	public int getSearchWriter(String searchText) {
		return SqlMapClient.getSession().selectOne("Board.getSearchWriter", searchText);
	}
	
	public int insertArticle( QnADataBean dto) {
		int no = dto.getNo();				// 제목글 / 답변글
		int refe = dto.getRefe();			// 그룹화 아이디
		int re_step = dto.getRe_step();		// 글순서
		int re_level = dto.getRe_level();	// 글레벨
		if( no == 0 ) {
			// 제목글			
			if( getCount() != 0 ) {	
				// 글이 있는 경우				
				refe = (Integer)SqlMapClient.getSession().selectOne("Board.getMaxNum") + 1;
				// 그룹화 아이디 = 글번호 최대값 + 1					
			} else {
				// 글이 없는 경우
				refe = 1;
			}
			re_step = 0;
			re_level = 0;
		} else {
			// 답변글
			SqlMapClient.getSession().update("Board.updateReply", dto);			
			re_step ++;
			re_level ++;
		}	
		
		dto.setRefe(refe);
		dto.setRe_step(re_step);
		dto.setRe_level(re_level);
		
		/*
		System.out.println(dto.getCategory());
		System.out.println(dto.getContent());
		System.out.println(dto.getDid());
		System.out.println(dto.getId());
		System.out.println(dto.getNo());
		System.out.println(dto.getPasswd());
		System.out.println(dto.getRe_level());
		System.out.println(dto.getRe_step());
		System.out.println(dto.getReadcount());
		System.out.println(dto.getRefe());
		System.out.println(dto.getSid());
		System.out.println(dto.getSubject());
		System.out.println(dto.getWriter());
		*/
		
		return SqlMapClient.getSession().insert("Board.insertArticle", dto);
	}
	
	public int getCount() {			
		return SqlMapClient.getSession().selectOne("Board.getCount");
	}
	
	public List<QnADataBean> getArticles(Map<String, String> map) {	
		return SqlMapClient.getSession().selectList("Board.getArticles", map);
	}
	
	public QnADataBean getArticle( int num ) {		
		return SqlMapClient.getSession().selectOne("Board.getArticle", num);
	}

	public void addCount( int num ) {
		SqlMapClient.getSession().update("Board.addCount", num);
	}
	
	public int check( int num, String passwd ) {
		int result = 0;
		QnADataBean dto = getArticle( num );
		if( dto.getPasswd().equals( passwd ) ) {
			// 비밀번호가 같다
			result = 1;
		} else {
			// 비밀번호가 다르다
			result = 0;
		}
		return result;		
	}

	public int modifyArticle( QnADataBean dto ) {
		return SqlMapClient.getSession().update("Board.modifyArticle", dto);
	}
	
	public int deleteArticle( int num ) {
		int result = 0;
		QnADataBean dto = getArticle( num );
		
		int count = SqlMapClient.getSession().selectOne("Board.replyCheck", dto);
				
		if( count != 0 ) {
			// 답글이 있다
			result = -1;
		} else {
			// 답글이 없다
			SqlMapClient.getSession().update("Board.deleteReply", dto);
			
			result = SqlMapClient.getSession().delete("Board.deleteArticle", num);					
		}		
		
		return result;
	}	
} // class










 