package spring.Dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import spring.Dto.WriteFormCommand;

public class BoardDao extends SqlSessionDaoSupport{

	
	public int insertRecord(WriteFormCommand writeFormCommand){
		
		int resultNum =getSqlSession().insert("board.insert", writeFormCommand);
		
		return resultNum;
	}
	
	
}
