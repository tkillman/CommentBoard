package spring.Dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import spring.Dto.CommentCommand;

public class CommentDao extends SqlSessionDaoSupport {

	public void insertComment(CommentCommand commentCommand) {

		getSqlSession().insert("comment.insert", commentCommand);

	}

	public List<CommentCommand> selectList(int commentStartRow, int commentEndRow,int content_num) {
		Map<String, Integer> numbers = new HashMap<>();
		numbers.put("commentStartRow", commentStartRow);
		numbers.put("commentEndRow",commentEndRow);
		numbers.put("content_num", content_num);
		
		List<CommentCommand> commentCommands = getSqlSession().selectList("comment.getList",numbers);
		
		return commentCommands;
	}

	public int counting(int content_num){
		
		int resultNum = getSqlSession().selectOne("comment.count",content_num);
			return resultNum;	
	}
}
