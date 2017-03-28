package spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.Dao.BoardDao;
import spring.Dto.WriteFormCommand;
import spring.util.PageingUtil;

@Controller
public class ListController {

	@Autowired
	private BoardDao dao;
	
	
	public void setDao(BoardDao dao) {
		this.dao = dao;
	}
		
	@RequestMapping("/list.do")
	public String listForm(@RequestParam( value="pageNum", defaultValue="1") int pageNum
							,@RequestParam(value ="searchValue", defaultValue="") String searchValue
							,@RequestParam(value="selectName", defaultValue="") String selectName 
							,Model model){
		int count = 0;
		
		//글 갯수 구해오기
        if(!searchValue.equals("")){	
        	//count = dbPro.getArticleCount(request.getParameter("selectName"),searchValue);
        } else{
        count = dao.getArticleCount();//전체 글의 수
        model.addAttribute("count", count);
        }
       
        
        
        //글 갯수가 존재한다면 어디서부터 어디까지 불러올 것인지
        int pageSize = 3;//한 페이지의 글의 개수
	    
        int startRow = (pageNum - 1) * pageSize + 1;//한 페이지의 시작글 번호
        
        int endRow = pageNum * pageSize;//한 페이지의 마지막 글번호
        
        
		//글 갯수가 존재하면 리스트 불러오기
        if(count>0){
        	if(!searchValue.equals("")){
           	 
          	   model.addAttribute(searchValue);
          	   model.addAttribute(selectName);
          	  System.out.println("searchValue가 있을 때 구현할 공간");
             
             }else{
             	Map<String, Integer> numbers = new HashMap<>();
            	numbers.put("startRow", startRow);
            	numbers.put("endRow", endRow);
             	
             	List<WriteFormCommand> writeFormCommands = dao.getList(numbers);		
     			model.addAttribute("articleList", writeFormCommands);
     		
             }
	
        }else{
        	
        	return "list";
        }
    
		
        int number=0;
  
        //해당 뷰에서 사용할 속성,글목록에 표시할 글번호
        number=count-(pageNum-1)*pageSize;
        
        model.addAttribute("number", number);
        
		model.addAttribute("pageNum", pageNum);
		
		
		PageingUtil.pageing(model,count,pageSize,pageNum,3);
		return "list";
	}
	
	//페이징 처리 ,(전체 글수,한 페이지에 보여줄 글 갯수, 현재 보고있는 페이징번호)
		
}
