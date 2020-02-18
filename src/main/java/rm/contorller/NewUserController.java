package rm.contorller;

import java.io.File;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import rm.entity.NewUser;
import rm.repository.AppRoleImpl;
import rm.repository.AppUserImpl;
import rm.repository.UserRoleImpl;
import rm.security.entity.AppUser;
import rm.security.entity.UserRole;

@Controller
@RequestMapping("/newuser")
public class NewUserController {
	@Autowired
	private AppUserImpl newUserImpl;
	@Autowired
	private UserRoleImpl userRoleImpl;
	@Autowired
	private AppRoleImpl appRoleImpl;

	@RequestMapping(method = RequestMethod.GET)
	public String newUserGet(Model model, @ModelAttribute("newUser") NewUser vartotojas) {
		boolean username = true;
		model.addAttribute("username", username);
		model.addAttribute("newUser", vartotojas);

		return "jsp/newuser";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String registerUser(Model model, @ModelAttribute("newUser") NewUser vartotojas, HttpServletRequest request) {
		if (newUserImpl.findListWithName(vartotojas.getUsername()).size() < 1) {
			String rootDirectory = request.getSession().getServletContext().getRealPath("/");
			MultipartFile userImage = vartotojas.getUserImage();
			System.out.println(vartotojas.getUserImage());
			AppUser appUser = new AppUser();
			appUser.setUserName(vartotojas.getUsername());
			appUser.setEnabled(1);
			appUser.setRole((long) 2);
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			appUser.setEncrytedPassword(encoder.encode(vartotojas.getPassword()));
			newUserImpl.save(appUser);
			UserRole userRole = new UserRole();
			userRole.setAppUser(appUser);

			userRole.setAppRole(appRoleImpl.getOne((long) 2));
			userRoleImpl.save(userRole);

			if (userImage != null && !userImage.isEmpty()) {
				try {

					userImage.transferTo(new File(rootDirectory + "userimg\\" + vartotojas.getUsername() + ".jpg"));
				} catch (Exception e) {
					throw new RuntimeException("User Image saving failed", e);
				}
			} else {
				try {
					FileUtils.copyFile(new File(rootDirectory + "userimg\\default\\1.jpg"),
							new File(rootDirectory + "userimg\\" + vartotojas.getUsername() + ".jpg"));
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
			return "redirect:/login";
		} else {

			model.addAttribute("username", true);
			return "jsp/newuser";
		}

	}

}
