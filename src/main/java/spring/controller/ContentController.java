package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import spring.Dao.BoardDao;
import spring.Dto.CommentCommand;
import spring.Dto.WriteFormCommand;

@Controller
@RequestMapping("/content.do")
public class ContentController {

	@Autowired
	private BoardDao dao;
	
	
	public void setDao(BoardDao dao) {
		this.dao = dao;
	}
	
	



	@ModelAttribute("commentCommand")
	public CommentCommand CommentCommandMake(){
		
		return new CommentCommand();
		
	}
		
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String contentForm(@RequestParam("num") int num 
							, @RequestParam(value="pageNum", defaultValue="1") int pageNum 
							, @RequestParam(value="searchValue",defaultValue="" ) String searchValue 
							, @RequestParam(value="selectName",defaultValue="") String selectName
							,Model model){
		
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("searchValue",searchValue);
		model.addAttribute("selectName",selectName);
		
		
		WriteFormCommand writeFormCommand = dao.selectContent(num);
		model.addAttribute("article", writeFormCommand);
		
		return "content";
		
	}
	
}
