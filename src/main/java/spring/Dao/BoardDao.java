package spring.Dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import spring.Dto.WriteFormCommand;

public class BoardDao extends SqlSessionDaoSupport{
	
	
	public int insertRecord(WriteFormCommand writeFormCommand){
		

		int resultNum =getSqlSession().insert("board.insert", writeFormCommand);
		
		return resultNum;
	}
	
	public List<WriteFormCommand> getList(Map<String, Integer> map){
		
		
		List<WriteFormCommand> writeFormCommands = getSqlSession().selectList("board.listGet", map);
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
