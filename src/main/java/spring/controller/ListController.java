package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import spring.Dao.BoardDao;
import spring.Dto.Numbers;
import spring.Dto.WriteFormCommand;

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
		
	    int pageSize = 10;//한 페이지의 글의 개수
        
        
        int startRow = (pageNum - 1) * pageSize + 1;//한 페이지의 시작글 번호
        
        int endRow = pageNum * pageSize;//한 페이지의 마지막 글번호
        
        int count = 0;
        
        int number=0;

        
        //글 갯수 구해오기
        if(!searchValue.equals("")){	
        	//count = dbPro.getArticleCount(request.getParameter("selectName"),searchValue);
        } else{
        count = dao.getArticleCount();//전체 글의 수
      
        model.addAttribute("count", count);
        }
       
        
        //글 갯수가 존재하면 리스트 불러오기
        if(count>0){
        	if(!searchValue.equals("")){
           	 
          	   model.addAttribute(searchValue);
          	   model.addAttribute(selectName);
          	  System.out.println("searchValue가 있을 때 구현할 공간");
             
             }else{
             	Numbers numbers = new Numbers();
             	numbers.setStartRow(startRow);
             	numbers.setEndRow(endRow);
             	List<WriteFormCommand> writeFormCommands = dao.getList(numbers);		
     			model.addAttribute("articleList", writeFormCommands);
     		
             }
	
        }else{
        	
        	return "list";
        }
      
        //해당 뷰에서 사용할 속성,글목록에 표시할 글번호
        number=count-(pageNum-1)*pageSize;
        
        model.addAttribute("number", number);
        
		model.addAttribute("pageNum", pageNum);
		
		
		paging(model,count,pageSize,pageNum);
		return "list";
	}
	
	//페이징 처리 ,(전체 글수,한 페이지에 보여줄 글 갯수, 현재 보고있는 페이징번호)
	public void paging(Model model,int count,int pageSize,int pageNum){
		
		//전체 페이지 블럭 수
		int pageCount= count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		model.addAttribute(pageCount);
		
		//내가 설정해서 페이지에 보여줄 페이징블럭 갯수
		int pageBlock=10;
		
		int result= pageNum/pageBlock;
		int startPage = result * pageBlock +1 ;
		int endPage = startPage + pageBlock -1 ; 
		
		if(endPage>pageCount){
			//계산된 값이 실제 값보다 많은 경우
			endPage = pageCount;
		}
		
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		
	}
	
}
