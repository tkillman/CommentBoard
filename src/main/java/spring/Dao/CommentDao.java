package spring.Dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import spring.Dto.CommentCommand;
import spring.Dto.CommentNumbers;

public class CommentDao extends SqlSessionDaoSupport {

	public void insertComment(CommentCommand commentCommand) {

		getSqlSession().insert("comment.insert", commentCommand);

	}

	public List<CommentCommand> selectList(int commentStartRow, int commentEndRow,int content_num) {
		CommentNumbers numbers = new CommentNumbers();
		numbers.setCommentStartRow(commentStartRow);
		numbers.setCommentEndRow(commentEndRow);
		numbers.setContent_num(content_num); 
		
		List<CommentCommand> commentCommands = getSqlSession().selectList("comment.getList",numbers);
		
		return commentCommands;
	}

	public int counting(int content_num){
		
		int resultNum = getSqlSession().selectOne("comment.count",content_num);
			return resultNum;	
	}
}
