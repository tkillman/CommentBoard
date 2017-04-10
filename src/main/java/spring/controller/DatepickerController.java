package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DatepickerController {

	
	
	
	@RequestMapping("/arr.do")
	public String form(@RequestParam("arrDays") String[] arr){
		
	
		for(int i=0;i<arr.length;i++){
			System.out.println(arr[i]);
		}
		
		
		
		
		return "redirect:/datePicLogic.jsp";
		
	}
	
	
	
}
