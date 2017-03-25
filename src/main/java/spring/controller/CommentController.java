package spring.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONObject;
import spring.Dao.CommentDao;
import spring.Dto.CommentCommand;

@Controller
@RequestMapping("/comment.do")
public class CommentController {

	@Autowired
	private CommentDao cDao;
	
	
	public void setcDao(CommentDao cDao) {
		this.cDao = cDao;
	}

	@RequestMapping(method = RequestMethod.POST)
	@ResponseBody
	public String jsonAct(HttpServletRequest request,CommentCommand commentCommand){
		
		//코멘트 db 저장
		commentCommand.setIp(request.getRemoteAddr());
		commentCommand.setReg_date(new Timestamp(System.currentTimeMillis()));
		
		cDao.insertComment(commentCommand);
		
		//코멘트 결과 보내주기
		

		JSONObject jso = new JSONObject();
		
		
		List<CommentCommand> list = cDao.selectList();
		
		jso.put("list", list);
		
		
		
		return jso.toString();
	}
	
	
	
	
	
	
	
}
