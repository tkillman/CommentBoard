package spring.Dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import spring.Dto.CommentCommand;
import spring.Dto.CommentNumbers;

public class CommentDao extends SqlSessionDaoSupport {

	public void insertComment(CommentCommand commentCommand) {

		getSqlSession().insert("comment.insert", commentCommand);

	}

	public List<CommentCommand> selectList(int commentStartRow, int commentEndRow) {
		CommentNumbers numbers = new CommentNumbers();
		numbers.setCommentStartRow(commentStartRow);
		numbers.setCommentEndRow(commentEndRow);
		
		
		List<CommentCommand> commentCommands = getSqlSession().selectList("comment.getList",numbers);
		
		return commentCommands;
	}

	public int counting(){
		
		int resultNum = getSqlSession().selectOne("comment.count");
			return resultNum;	
	}
}
