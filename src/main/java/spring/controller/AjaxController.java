package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AjaxController {

	
	
	
	
	@RequestMapping("/test/ajax.do")
	public void form(Model model){
		
		System.out.println("doform");
		String str="hello";
		
		model.addAttribute("data", str);
		
	}
	
	
}
