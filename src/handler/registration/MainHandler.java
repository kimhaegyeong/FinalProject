package handler.registration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
 
@Controller
public class MainHandler implements CommandHandler {

	@RequestMapping("/main")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int check = (int)request.getSession().getAttribute("check");
		
		String move = "";
		if(check==1){
			move = "/delivery/main";
		}else if(check==2){
			move = "/store/main";
		}
		
		return new ModelAndView(move);
	}

}
