package net.skhu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.skhu.dto.Department;
import net.skhu.dto.User;
import net.skhu.mapper.DepartmentMapper;

@Controller
public class TagnoteController {

	@Autowired
	DepartmentMapper departmentMapper;

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
	public String login(Model model, User user) {
		System.out.println(user.getUserId() + " " + user.getPassword());
		return "login";
	}

	@RequestMapping(value = "membership", method = RequestMethod.GET)
	public String membership(Model model) {
		User user = new User();
		List<Department> departments = departmentMapper.findAll();
		model.addAttribute("user", user);
		model.addAttribute("departments", departments);
		return "membership";
	}

	@RequestMapping(value = "membership", method = RequestMethod.POST)
	public String membership(Model model, User user) {
		System.out.println(user);
		return "redirect:login";
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