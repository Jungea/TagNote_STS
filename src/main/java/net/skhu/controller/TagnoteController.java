package net.skhu.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
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
import net.skhu.dto.TM;
import net.skhu.dto.Tag;
import net.skhu.dto.User;
import net.skhu.mapper.MemoMapper;
import net.skhu.mapper.TMMapper;
import net.skhu.mapper.TagMapper;
import net.skhu.mapper.UserMapper;

@Controller
public class TagnoteController {

	@Autowired
	UserMapper userMapper;
	@Autowired
	MemoMapper memoMapper;
	@Autowired
	TagMapper tagMapper;
	@Autowired
	TMMapper tmMapper;

	@RequestMapping(value = "test")
	public String test(Model model) {
		return "parent";
	}

	/**
	 * 사이트로 이동한 후 로그인 화면, 빈 유저 객체 생성
	 * 
	 * @param model
	 * @return login view 이름
	 */
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "login/login";
	}

	// 로그인 화면에서 로그인버튼 클릭
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
			return "login/login";
	}

	// 페이지 내의 로그아웃 버튼을 클릭
	@RequestMapping(value = "logout")
	public String logout(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		return "redirect:login";
	}

	// 로그인 화면의 회원가입 버튼을 클릭
	@RequestMapping(value = "membership", method = RequestMethod.GET)
	public String membership(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "login/membership";
	}

	// 회원가입 화면에서 아이디 중복 확인 버튼 클릭
	@RequestMapping(value = "userIdCheck", method = RequestMethod.GET)
	public String child(Model model) {
		return "login/userId_check";
	}

	// 아이디 중복 확인 화면에서 확인 버튼 클릭
	@RequestMapping(value = "userIdCheck", method = RequestMethod.POST)
	public String idCheck(Model model, @RequestParam("userId") String userId) {
		int result = userMapper.idCheck(userId);
		if (result == 1) { // 이미 사용중인 아이디
			model.addAttribute("userId", "");
			model.addAttribute("refresh", "refresh"); // submit 되었음을 표시하는 input hidden
		} else
			model.addAttribute("userId", userId);

		return "login/userId_check"; // 이후 처리를 자바스크립트로 구현
	}

	// 회원가입 화면 내의 가입 버튼 클릭
	@RequestMapping(value = "membership", method = RequestMethod.POST)
	public String membership(Model model, User user) {
//		 userMapper.insert(user);
		return "login/membership";

		// return "redirect:login";

	}

	// 로그인 화면 내의 비밀번호 찾기 글자 클릭
	@RequestMapping(value = "findPassword", method = RequestMethod.GET)
	public String findPassword(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "login/find_password";
	}

	// 비밀번호 찾기 화면 내의 확인 버튼 클릭
	@RequestMapping(value = "findPassword", method = RequestMethod.POST)
	public String findPassword(Model model, User user, HttpServletRequest request) {
		User u = userMapper.findPassword(user);

		if (u != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", u);
			return "redirect:changePassword";
		}

		model.addAttribute("user", new User());
		return "login/find_password";

	}

	// 비밀번호 찾기 화면에서 확인버튼 클릭(입력이 맞을 경우)
	@RequestMapping(value = "changePassword", method = RequestMethod.GET)
	public String changePassword(Model model) {
		return "login/change_password";
	}

	// 비밀번호 변경 화면에서 확인 버튼 클릭
	@RequestMapping(value = "changePassword", method = RequestMethod.POST)
	public String changePassword(Model model, HttpServletRequest request, @RequestParam("userPass") String userPass) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user"); // 비밀번호 변경 화면에서 추가한 user 정보
		user.setUserPass(userPass); // user 정보에 비밀번호 변경
		userMapper.update(user); // 비밀번호 업데이트

		return "redirect:login";

	}

	/**
	 * @param model
	 * @param request
	 * @return
	 */
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

	@RequestMapping(value = "memo", method = RequestMethod.GET)
	public String memo(Model model) {
		Memo memo = new Memo();
		model.addAttribute("memo", memo);
		return "memo";
	}

	// 메모 작성화면에서 저장 클릭
	@RequestMapping(value = "memo", method = RequestMethod.POST)
	public String memo(Model model, HttpServletRequest request, Memo memo) {

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		memo.setUserNum(user.getUserNum());
		List<Tag> userTag = tagMapper.findByUserNum(memo.getUserNum());

		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date time = new Date();
		String memoDate = format1.format(time);
		memo.setMemoDate(memoDate);

		System.out.println(memo);

		memoMapper.insert(memo); // 1. 메모 insert (userNum, memoText, memoDate)

		// 2. 없는 태그 추가 (userNum, tagName)
		List<String> tagStringList = new ArrayList<>(Arrays.asList(memo.getTagString().split(" ")));

		List<Tag> existTags = new ArrayList<>();
		for (Tag t : userTag) {
			if (tagStringList.contains(t.getTagName())) {
				existTags.add(t);
				tagStringList.remove(t.getTagName());
			}
		}

		System.out.println(tagStringList); // 추가할 태그(tag insert, tm insert)
		System.out.println(existTags); // 존재하는 태그(tm만 insert)

		for (String s : tagStringList) {
			Tag t = new Tag(memo.getUserNum(), s);
			tagMapper.insert(t);
			tmMapper.insert(new TM(memo.getMemoNum(), t.getTagNum())); // 3. 태그 만들어서 tm 추가 (tagNum, memoNum)
		}

		for (Tag t : existTags)
			tmMapper.insert(new TM(memo.getMemoNum(), t.getTagNum()));
		// 3. 이미 만들어진 태그 tm 추가 (tagNum, memoNum)

		return "redirect:edit?memoNum=" + memo.getMemoNum();
	}

	@RequestMapping(value = "edit", method = RequestMethod.GET)
	public String edit(Model model, @RequestParam("memoNum") int memoNum) {
		Memo memo = memoMapper.findOneWithTags(memoNum);
		model.addAttribute("memo", memo);
		System.out.println(memo);
		System.out.println(memo.getTags());
		return "memo";
	}

	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String edit(Model model, Memo memo) {
		System.out.println(memo);

		List<Tag> userTag = tagMapper.findByUserNum(memo.getUserNum());

		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date time = new Date();
		String memoDate = format1.format(time);
		memo.setMemoDate(memoDate);

		memoMapper.update(memo); // 1. 메모 insert (userNum, memoText, memoDate)

		// 2. 없는 태그 추가 (userNum, tagName)
		List<String> tagStringList = new ArrayList<>(Arrays.asList(memo.getTagString().split(" ")));

		List<Tag> existTags = new ArrayList<>();
		for (Tag t : userTag) {
			if (tagStringList.contains(t.getTagName())) {
				existTags.add(t);
				tagStringList.remove(t.getTagName());
			}
		}

		System.out.println(tagStringList); // 추가할 태그(tag insert, tm insert)
		System.out.println(existTags); // 존재하는 태그(tm만 insert)

		List<TM> beforeMemoTags = tmMapper.findByMemoNum(memo.getMemoNum()); // 업데이트 전 메모의 태그들
		// 1.beforeMemoTags 복사 리스트
		// 2.before - exist ==> tm에서 제거(tagNum으로 delete)
		// 3.exist - 복사 리스트 ==> tm에 추가 (insert)
		// 4.update한 메모 다시 불러오기

		for (String s : tagStringList) {
			Tag t = new Tag(memo.getUserNum(), s);
			tagMapper.insert(t);
			tmMapper.insert(new TM(memo.getMemoNum(), t.getTagNum())); // 3. 태그 만들어서 tm 추가 (tagNum, memoNum)
		}

		for (Tag t : existTags)
			tmMapper.insert(new TM(memo.getMemoNum(), t.getTagNum()));
		// 3. 이미 만들어진 태그 tm 추가 (tagNum, memoNum)

		return "memo";

	}

	@RequestMapping("delete")
	public String delete(Model model, @RequestParam("memoNum") int memoNum) {
		memoMapper.delete(memoNum);
		return "redirect:list";
	}

}