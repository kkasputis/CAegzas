package rm.contorller;



import java.security.Principal;
 
import rm.security.utils.WebUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 
@Controller
public class MainController {
 
//    @RequestMapping(value = { "/", "/welcome" }, method = RequestMethod.GET)
//    public String welcomePage(Model model) {
//        model.addAttribute("title", "Welcome");
//        model.addAttribute("message", "This is welcome page!");
//        return "jsp/index";
//    }
// 
//    @RequestMapping(value = "/admin", method = RequestMethod.GET)
//    public String adminPage(Model model, Principal principal) {
//         
//        User loginedUser = (User) ((Authentication) principal).getPrincipal();
// 
//        String userInfo = WebUtils.toString(loginedUser);
//        model.addAttribute("userInfo", userInfo);
//         
//        return "thymeleaf/adminPage";
//    }
// 
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage(Model model) {
 
        return "thymeleaf/loginPage";
    }
 

 

 
    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public String accessDenied(Model model, Principal principal) {
 
        if (principal != null) {
            User loginedUser = (User) ((Authentication) principal).getPrincipal();
 
            String userInfo = WebUtils.toString(loginedUser);
 
            model.addAttribute("userInfo", userInfo);
 
            String message =  principal.getName() +", "//
                    + "neturite teisės patekti į šį puslapį! Prisijunkite kaip administratorius.";
            model.addAttribute("message", message);
 
        }
 
        return "jsp/403Page";
    }
 
}
