package rm.contorller;

import java.io.File;
import java.security.Principal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import rm.entity.Komentarai;
import rm.entity.NewUser;
import rm.entity.Patiekalai;
import rm.repository.AppRoleImpl;
import rm.repository.AppUserImpl;
import rm.repository.KomentaraiImpl;
import rm.repository.PatiekalaiImpl;
import rm.repository.UserRoleImpl;
import rm.security.entity.AppRole;
import rm.security.entity.AppUser;
import rm.security.entity.UserRole;



@Controller
public class IndexController {

	@Autowired 
	PatiekalaiImpl patiekalai;
	
	
	@Autowired 
	KomentaraiImpl komentaraiImpl;
	@Autowired
	AppRoleImpl appRoleImpl;
	@Autowired
	AppUserImpl newUserImpl;
	@Autowired
	UserRoleImpl userRoleImpl;




		@RequestMapping(method = RequestMethod.GET)
		public String indexList(Model model, Principal principal) {

			if(newUserImpl.findListWithName("admin").size() < 1) {
				AppRole appRole = new AppRole();
				appRole.setRoleId((long)1);
				appRole.setRoleName("ROLE_ADMIN");
				appRoleImpl.save(appRole);
				appRole = new AppRole();
				appRole.setRoleId((long)2);
				appRole.setRoleName("ROLE_USER");
				appRoleImpl.save(appRole);
				AppUser appUser = new AppUser();
				appUser.setEnabled(1);
				appUser.setRole((long)1);
				appUser.setUserName("admin");
				appUser.setEncrytedPassword("$2a$10$PrI5Gk9L.tSZiW9FXhTS8O8Mz9E97k2FZbFvGFFaSsiTUIl.TCrFu");
				newUserImpl.save(appUser);
				UserRole userRole = new UserRole();
				userRole.setAppUser(appUser);				
				userRole.setAppRole(appRoleImpl.getOne((long) 1));
				userRoleImpl.save(userRole);
				userRole = new UserRole();
				userRole.setAppUser(appUser);
				userRole.setAppRole(appRoleImpl.getOne((long) 2));
				userRoleImpl.save(userRole);
			}

			model.addAttribute("index", patiekalai.findAll());
	

			return "jsp/index";
		}
		
		@RequestMapping("/patiekalas")
		public String getProductById(@RequestParam("id") int id, Model model, HttpServletRequest request) {


		
			Patiekalai patiekalas = patiekalai.findById(id).get();
			float ivertinimas = 0;
			for (Komentarai a : patiekalas.getKomentarai()) {
				ivertinimas = ivertinimas+ a.getIvertinimas();
				
			}
			ivertinimas = ivertinimas/patiekalas.getKomentarai().size();
//			System.out.println(patiekalai.findById(id).);
			model.addAttribute("ivertinimas", ivertinimas);
			model.addAttribute("patiekalas", patiekalai.findById(id).get());
			model.addAttribute("newComment", new Komentarai());
			return "jsp/patiekalas";
			
		}
		@RequestMapping(value = "/patiekalas", method = RequestMethod.POST)
		public String addComment(@RequestParam("id") int id, @ModelAttribute("newComment") Komentarai comment, Model model, Principal principal) {

			Patiekalai patiekalas = patiekalai.findById(id).get() ;
			comment.setPatiekalas(patiekalas);
			comment.setUserName(principal.getName());
			comment.setDate(timeNow());
			komentaraiImpl.save(comment);

	
			return "redirect:/patiekalas?id=" + String.valueOf(id);
		}
		
		
		
		@RequestMapping(value = "/user", method = RequestMethod.GET)
		public String userInfo(@RequestParam("id") String userName, @ModelAttribute("newUser") NewUser vartotojas, Model model, Principal principal) {
			List<Komentarai> allUserComments = komentaraiImpl.findAllUserComments(userName);
			model.addAttribute("userName", userName);
			model.addAttribute("comments", allUserComments);
			model.addAttribute("NewUser", vartotojas);
			System.out.println(allUserComments.size());
	
			return "jsp/userinfo";
		}
		@RequestMapping(value = "/user", method = RequestMethod.POST)
		public String editDishPost(@RequestParam("id") String userName,@ModelAttribute("newUser") NewUser vartotojas, HttpServletRequest request) {
			MultipartFile image = vartotojas.getUserImage();
			String rootDirectory = request.getSession().getServletContext().getRealPath("/");
			if (image != null && !image.isEmpty()) {
				try {

					image.transferTo(new File(rootDirectory + "userimg\\" + userName + ".jpg"));
				} catch (Exception e) {
					throw new RuntimeException("Profile Image saving failed", e);
				}
			}
		return "redirect:/user?id=" + userName;
			}
		
		@RequestMapping("/trintikomentara")
		public String getDeleteComment(@RequestParam("id") int id,@RequestParam("username") String username, Model model, HttpServletRequest request, Principal principal) {
			if ((principal.getName().equals(username)) || (principal.getName().equals("admin"))) {
			komentaraiImpl.deleteComment(id);;
			return "redirect:user?id=" + username;
			}
			else { return "redirect:403"; }
		}
		
		@RequestMapping("/changepassword")
		public String changePassword(Model model, @RequestParam(value = "netinka", defaultValue = "false") boolean netinka, @ModelAttribute("changePass") NewUser changePass, HttpServletRequest request) {
			if (netinka) {
				model.addAttribute("message", "Neteisingas slaptažodis");
			}
			return "jsp/changepassword";
			
		}

		
		@RequestMapping(value = "/changepassword", method = RequestMethod.POST)
		public String registerUser(Model model, @ModelAttribute("changePass") NewUser newPass, HttpServletRequest request, Principal principal) {
		AppUser vartotojas = newUserImpl.findListWithName(principal.getName()).get(0);
		  BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if (encoder.matches(newPass.getOldPassword(), vartotojas.getEncrytedPassword())) {
			vartotojas.setEncrytedPassword(encoder.encode(newPass.getPassword()));
			newUserImpl.save(vartotojas);
			return "redirect:user?id=" + principal.getName();
		}
		else {
				return "redirect:changepassword?netinka=true";
			
		}
		}
		
		
		
		public String timeNow() {     
		        LocalDateTime now = LocalDateTime.now();

		        System.out.println("Before : " + now);

		        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

		        String formatDateTime = now.format(formatter);

		       return formatDateTime;
		      
		}
		
}
