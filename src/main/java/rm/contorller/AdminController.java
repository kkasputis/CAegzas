package rm.contorller;

import java.io.File;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import rm.entity.Patiekalai;
import rm.repository.KomentaraiImpl;
import rm.repository.PatiekalaiImpl;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	PatiekalaiImpl patiekalai;

	@Autowired
	KomentaraiImpl komentaraiImpl;

	@RequestMapping(method = RequestMethod.GET)
	public String AdminList(Model model) {

		model.addAttribute("index", patiekalai.findAll());

		return "jsp/admin";
	}

	@RequestMapping("/trinti")
	public String getProductById(@RequestParam("id") int id, Model model, HttpServletRequest request) {
		patiekalai.deleteById(id);
		model.addAttribute("index", patiekalai.findAll());

		return "redirect:";

	}

	@RequestMapping("/add")
	public String getProductById(Model model, HttpServletRequest request) {
		System.out.println("iki cia ateinu.");
		model.addAttribute("newDish", new Patiekalai());
		return "jsp/add";

	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addCatPost(@ModelAttribute("newDish") Patiekalai newDish, HttpServletRequest request) {
		MultipartFile image = newDish.getImage();
		patiekalai.save(newDish);
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		if (image != null && !image.isEmpty()) {
			try {

				image.transferTo(new File(rootDirectory + "images\\" + newDish.getId() + ".jpg"));
			} catch (Exception e) {
				throw new RuntimeException("Dish Image saving failed", e);
			}
		}
		return "redirect:";
	}

	@RequestMapping("/edit")
	public String editDish(@RequestParam("id") int id, Model model, HttpServletRequest request) {
		model.addAttribute("patiekalas", patiekalai.findById(id).get());
		return "jsp/edit";

	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String editDishPost(@ModelAttribute("patiekalas") Patiekalai newDish, HttpServletRequest request) {
		MultipartFile image = newDish.getImage();
		patiekalai.save(newDish);
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		if (image != null && !image.isEmpty()) {
			try {

				image.transferTo(new File(rootDirectory + "images\\" + newDish.getId() + ".jpg"));
			} catch (Exception e) {
				throw new RuntimeException("Dish Image saving failed", e);
			}
		}
		return "redirect:";
	}

	@RequestMapping("/deltecomment")
	public String getDeleteComment(@RequestParam("id") int id, @RequestParam("patid") int patid, Model model,
			HttpServletRequest request) {
		komentaraiImpl.deleteComment(id);
		;
		return "redirect:edit?id=" + patid;

	}
}
