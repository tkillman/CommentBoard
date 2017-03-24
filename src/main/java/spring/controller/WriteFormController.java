package spring.controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.Dao.BoardDao;
import spring.Dto.RecordCommand;
import spring.Dto.WriteFormCommand;


@Controller
@RequestMapping("/writeForm.do")
public class WriteFormController {

	@Autowired
	private BoardDao dao;
	
	
	public void setDao(BoardDao dao) {
		this.dao = dao;
	}


	@ModelAttribute("writeFormCommand")
	public WriteFormCommand WriteFormCommandMake(){
		
		return new WriteFormCommand();
	} 
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String writeForm(){
		return "writeForm";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String insertRecord(WriteFormCommand writeFormCommand,HttpServletRequest request){
		
		writeFormCommand.setReg_date(new Timestamp(System.currentTimeMillis()));
		writeFormCommand.setIp(request.getRemoteAddr());
		
		int resultNum =dao.insertRecord(writeFormCommand);
		
		if(resultNum==1){
			System.out.println("디비 저장완료");
		}
		
		
		return "writeForm";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
