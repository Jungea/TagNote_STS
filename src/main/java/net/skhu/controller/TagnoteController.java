package net.skhu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.skhu.dto.Memo;
import net.skhu.dto.User;
import net.skhu.mapper.MemoMapper;
import net.skhu.mapper.UserMapper;

@Controller
public class TagnoteController {

	@Autowired
	UserMapper userMapper;
	@Autowired
	MemoMapper memoMapper;

	@RequestMapping(value = "test")
	public String test(Model model) {
		return "parent";
	}

	@RequestMapping(value = "child")
	public String child(Model model) {
		return "child";
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "login";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(Model model, User user, HttpServletRequest request) {
		System.out.println(user.getUserId() + " " + user.getUserPass());
		User u = userMapper.login(user);
		if (u != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", u);
			System.out.println(u);
			return "redirect:list";
		} else
			return "login";
	}

	@RequestMapping(value = "membership", method = RequestMethod.GET)
	public String membership(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "membership";
	}

//	@RequestMapping(value = "idCheck", method = RequestMethod.POST)
//	public int idCheck(Model model) {
//		int result = userMapper.idCheck(userId);
//		return "membership";
//	}

	@RequestMapping(value = "membership", method = RequestMethod.POST)
	public String membership(Model model, User user) {
		// userMapper.insert(user);
		return "membership";

		// return "redirect:login";

	}

	@RequestMapping(value = "list")
	public String list(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		List<Memo> memos = memoMapper.findByUserNumWithTags(user.getUserNum());
		model.addAttribute("memos", memos);
		return "list";
	}

	@RequestMapping(value = "star")
	public String star(Model model) {
		return "list";
	}

	@RequestMapping(value = "recent")
	public String recent(Model model) {
		return "list";
	}

	@RequestMapping(value = "trashCan")
	public String trashCan(Model model) {
		return "list";
	}

	@RequestMapping(value = "memo")
	public String memo1(Model model) {
		return "memo";
	}

	@RequestMapping(value = "edit", method = RequestMethod.GET)
	public String edit(Model model, @RequestParam("memoNum") int memoNum) {
//		Student student = studentMapper.findOne(id);
//		List<Department> departments = departmentMapper.findAll();
//		model.addAttribute("student", student);
//		model.addAttribute("departments", departments);
		System.out.println("memo " + memoNum + "번");
		//return "student/edit";
		return "list";

	}

	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String edit(Model model, Memo memo) {
//		studentMapper.update(student);
		return "redirect:list";

	}
	
	@RequestMapping("delete")
    public String delete(Model model, @RequestParam("memoNum") int memoNum) {
        memoMapper.delete(memoNum);
        return "redirect:list";
    }


}