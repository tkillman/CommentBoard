package spring.Dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import spring.Dto.CommentCommand;

public class CommentDao extends SqlSessionDaoSupport {

	public void insertComment(CommentCommand commentCommand) {

		getSqlSession().insert("comment.insert", commentCommand);

	}

	public List<CommentCommand> selectList() {
		List<CommentCommand> commentCommands = getSqlSession().selectList("comment.getList");
		
		return commentCommands;
	}

}
