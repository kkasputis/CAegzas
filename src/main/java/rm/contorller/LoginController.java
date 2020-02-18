package rm.contorller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

//	@RequestMapping(value = "/login")
//	public String login() {
//		return "login";
//	}
	@RequestMapping(value = "/newuser")
	public String login() {
		return "jsp/newuser";
	}
}
