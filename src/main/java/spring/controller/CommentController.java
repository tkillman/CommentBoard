package spring.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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

	@RequestMapping(method = RequestMethod.GET)
	public String replyRequet(HttpServletResponse response,
			@RequestParam(value = "commentPageNum", defaultValue = "1") int commentPageNum, Model model) {

		response.setContentType("text/html;charset=UTF-8");
		
		model.addAttribute("commentPageNum", commentPageNum);
		// 코멘트 갯수 파악
		int commentCount = cDao.counting();
		
		model.addAttribute("commentCount", commentCount);

		// 보여줄 댓글 수
		int commentPageSize = 5;

		// 요청 페이지 번호 commentPageNum

		// 한페이지의시작글번호
		int commentStartRow = (commentPageNum - 1) * commentPageSize + 1;
																			
		int commentEndRow = commentPageNum * commentPageSize;// 한 페이지의 마지막 글번호

		// 코멘트 리스트 보내주기

		if (commentCount > 0) {
			List<CommentCommand> list = cDao.selectList(commentStartRow, commentEndRow);

			model.addAttribute("list", list);

		} else {
			return "comments";
		}

		pageing(model, commentCount, commentPageSize, commentPageNum);
		return "comments";
	}

	
	@RequestMapping(method = RequestMethod.POST)
	public String insertReplyRequet(HttpServletRequest request, HttpServletResponse response,
			CommentCommand commentCommand, Model model) {

		response.setContentType("text/html;charset=UTF-8");

		// 코멘트 db 저장
		commentCommand.setIp(request.getRemoteAddr());
		commentCommand.setReg_date(new Timestamp(System.currentTimeMillis()));

		cDao.insertComment(commentCommand);

		return "comments";

	}

	public void pageing(Model model, int commentCount, int commentPageSize, int commentPageNum) {
		
		
		int commentPageCount = commentCount / commentPageSize + (commentCount % commentPageSize == 0 ? 0 : 1);
		
		model.addAttribute("commentPageCount",commentPageCount);

		int commentPageBlock = 3;

		
		int result = (commentPageNum -1) / commentPageBlock;
		int commentStartPage = result * commentPageBlock + 1;
		int commentEndPage = commentStartPage + commentPageBlock - 1;

		
		if (commentEndPage > commentPageCount) {
			// 계산된 값이 실제 값보다 많은 경우
			commentEndPage = commentPageCount;
			
		}
		
		
		model.addAttribute("commentPageCount", commentPageCount);
		
		
		model.addAttribute("commentPageBlock", commentPageBlock);
		
		model.addAttribute("commentStartPage", commentStartPage);
		model.addAttribute("commentEndPage", commentEndPage);

	}

}
