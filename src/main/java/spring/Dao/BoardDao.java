package spring.Dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import spring.Dto.CommentCommand;
import spring.Dto.Numbers;
import spring.Dto.WriteFormCommand;

public class BoardDao extends SqlSessionDaoSupport{
	
	
	public int insertRecord(WriteFormCommand writeFormCommand){
		

		int resultNum =getSqlSession().insert("board.insert", writeFormCommand);
		
		return resultNum;
	}
	
	public List<WriteFormCommand> getList(Numbers numbers){
		List<WriteFormCommand> writeFormCommands = getSqlSession().selectList("board.listGet", numbers);
		return writeFormCommands;
		
	}
	
	public int getArticleCount(){
		int resultNum = getSqlSession().selectOne("board.getArticleCount");
		return resultNum;
	}
	
	public WriteFormCommand selectContent(int num){
		
		WriteFormCommand writeFormCommand = getSqlSession().selectOne("board.content", num);
		return writeFormCommand;
	}
	
	
	
	
	
}
