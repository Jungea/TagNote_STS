package net.skhu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.skhu.dto.User;
import net.skhu.mapper.UserMapper;

@Controller
public class TagnoteController {

	@Autowired
	UserMapper userMapper;

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
	public String login(Model model, User user, HttpSession httpSession) {
		System.out.println(user.getUserId() + " " + user.getUserPass());

		if (userMapper.login(user) == 1) {
			httpSession.setAttribute("user", user);
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
		//userMapper.insert(user);
		return "membership";

		//return "redirect:login";

	}

	@RequestMapping(value = "list")
	public String list(Model model) {
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

}