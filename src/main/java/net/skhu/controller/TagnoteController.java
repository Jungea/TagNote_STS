package net.skhu.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import net.skhu.dto.Memo;
import net.skhu.dto.Path;
import net.skhu.dto.TM;
import net.skhu.dto.Tag;
import net.skhu.dto.User;
import net.skhu.mapper.MemoMapper;
import net.skhu.mapper.PathMapper;
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
	@Autowired
	PathMapper pathMapper;

	// 테스트를 위한 액션 메소드
	@RequestMapping(value = "test")
	public String test(Model model) {
		List<Tag> tags = tagMapper.findLiving(2);
		model.addAttribute("tags", tags);
		return "test";
	}

	@RequestMapping(value = "child")
	public String reculsion(Model model) {
		return "child";
	}

	// 검색어 자동완성(autocomplete)를 위한 액션메소드, json형식의 리턴타입
	@ResponseBody
	@RequestMapping(value = "/testa")
	public List<String> testa(Model model,
			@RequestParam(value = "term", required = false, defaultValue = "") String term,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		List<String> suggestions = tagMapper.findAutocomplete(user.getUserNum(), term);
		return suggestions;
	}

// 화면전체에 공통적으로 들어가는 메뉴에 대한 list를 model에 add
	public void navMaker(Model model, User user) {

		List<Tag> tags = tagMapper.findLiving(user.getUserNum());
		model.addAttribute("tags", tags);

		List<Path> paths = pathMapper.findByUserNum(user.getUserNum());
		model.addAttribute("paths", paths);
	}

	/////////////////////////////////////////////////////////////////////////
	// 리스트
	/////////////////////////////////////////////////////////////////////////

	// 메모 리스트화면
	@RequestMapping(value = "list")
	public String list(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		List<Memo> memos = memoMapper.findByUserNumWithTags(user.getUserNum());
		model.addAttribute("memos", memos);

		navMaker(model, user);
		
		String referer = request.getHeader("Referer");
		referer = referer.substring(22, referer.length());
		System.out.println(referer);

		session.setAttribute("lastPage", "list");
		return "list";
	}

	// 즐겨찾기 리스트 화면
	@RequestMapping(value = "listByBookmark")
	public String listByBookmark(Model model, HttpServletRequest request, @RequestParam("path") String path) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		List<String> searchStringList = new ArrayList<>(Arrays.asList(path.split("/")));
		searchStringList.remove(0);
		List<Integer> list = memoMapper.findByUserNumAndListWithPath(user.getUserNum(), searchStringList,
				searchStringList.size());
		List<Memo> memos = new ArrayList<>();
		for (Integer i : list)
			memos.add(memoMapper.findOneWithTags(i));

		model.addAttribute("memos", memos);

		navMaker(model, user);

		session.setAttribute("lastPage", "listByBookmark?path=" + path);

		return "list";
	}

	@RequestMapping(value = "bookmarkDelete")
	public String bookmarkDelete(Model model, HttpServletRequest request, @RequestParam("path") String path) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		System.out.println("bookmarkDelete " + path);
		pathMapper.deleteByPath(path);
		model.addAttribute("msg", "태그 북마크 삭제 성공");

		return "bookmarkMessage";
	}

	@RequestMapping(value = "bookmarkInsert")
	public String bookmarkInsert(Model model, HttpServletRequest request, @RequestParam("path") String path,
			@RequestParam("name") String name) throws UnsupportedEncodingException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		String nameDecoding = URLDecoder.decode(name, "utf-8");
		System.out.println("bookmarkInsert " + path + " " + nameDecoding);

		Tag t = tagMapper.findOneByTagName(user.getUserNum(), nameDecoding);

		String[] split = path.split("/");
		System.out.println(Arrays.stream(split).anyMatch(Integer.toString(t.getTagNum())::equals));
		if (Arrays.stream(split).anyMatch(Integer.toString(t.getTagNum())::equals)) { // 수직층 중복
			model.addAttribute("msg", "태그 북마크 추가 실패[수직중복]");
			System.out.println("실패[수직중복]");
		} else {
			int result = 1;
			if (path.equals("0")) {
				result = pathMapper.pathCheck(user.getUserNum(), "/" + t.getTagNum());
				if (result == 0)
					pathMapper.insert(new Path(t.getTagNum(), "/" + t.getTagNum()));
			} else {
				result = pathMapper.pathCheck(user.getUserNum(), path + "/" + t.getTagNum());
				if (result == 0)
					pathMapper.insert(new Path(t.getTagNum(), path + "/" + t.getTagNum()));
			}
			System.out.println(t.getTagNum() + " " + (path + "/" + t.getTagNum()));

			if (result == 1) { // 수평층 중복
				model.addAttribute("msg", "태그 북마크 추가 실패[수평중복]");
				System.out.println("실패[수평중복]");
			} else {
				model.addAttribute("msg", "태그 북마크 추가 성공");
				System.out.println("성공");
			}

		}

		return "bookmarkMessage";

	}

	//
	@RequestMapping(value = "listByTag")
	public String listByTag(Model model, HttpServletRequest request, @RequestParam("tagNum") int tagNum) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		session.setAttribute("pageTag", tagMapper.findOne(tagNum));

		List<Integer> list = memoMapper.findByTagNumWithTags(tagNum);

		List<Memo> memos = new ArrayList<>();
		for (Integer i : list)
			memos.add(memoMapper.findOneWithTags(i));

		model.addAttribute("memos", memos);

		navMaker(model, user);

		session.setAttribute("lastPage", "listByTag?tagNum=" + tagNum);
		return "list";
	}

	// 검색창에 입력 후 검색 아이콘 클릭
	@RequestMapping(value = "search")
	public String search(Model model, HttpServletRequest request, @RequestParam("searchString") String searchString)
			throws UnsupportedEncodingException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		System.out.println("하하핳ㅎㅎ하하하하하");

		String s = URLDecoder.decode(searchString, "utf-8");
		// get방식 url에는 '#'을 보낼 수 없어 인코딩하여 전송

		if (s.charAt(0) == '#') { // 태그 검색
			List<String> serachStringList = new ArrayList<>(Arrays.asList(s.split(" ")));
			// '+'가 인코딩 후 디코딩 되면 ' '공백으로 바뀜.
			System.out.println(serachStringList);

			List<Integer> list = memoMapper.findByUserNumAndListWithTags(user.getUserNum(), serachStringList,
					serachStringList.size());
			System.out.println(list);
			// 해당 태그를 모두 갖고있는 메모들 번호

			List<Memo> memos = new ArrayList<>();
			for (Integer i : list)
				memos.add(memoMapper.findOneWithTags(i));

			model.addAttribute("memos", memos);

		} else { // 내용으로 검색
			List<Memo> memos = memoMapper.findByUserNumAndMemoTextWithTags(user.getUserNum(), s);
			model.addAttribute("memos", memos);
		}

		navMaker(model, user);

		session.setAttribute("lastPage", "search?searchString=" + searchString);
		return "list";
	}

	// 중요한 메모 리스트
	@RequestMapping(value = "imptList")
	public String imptList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		List<Memo> memos = memoMapper.findImptByUserNumWithTags(user.getUserNum());
		model.addAttribute("memos", memos);

		navMaker(model, user);

		session.setAttribute("lastPage", "imptList");
		return "list";
	}

	// 별표 체크(리스트, 메모 둘다)
	@RequestMapping("impt")
	public String impt(Model model, @RequestParam("memoNum") int memoNum, HttpServletRequest request) {
		memoMapper.impt(memoNum); // impt_memo update

		HttpSession session = request.getSession();
		String page = (String) session.getAttribute("lastPage");
		return "redirect:" + page;
	}

	// 별표 해제
	@RequestMapping("notImpt")
	public String notImpt(Model model, @RequestParam("memoNum") int memoNum, HttpServletRequest request) {
		memoMapper.notImpt(memoNum); // impt_memo update

		HttpSession session = request.getSession();
		String page = (String) session.getAttribute("lastPage");
		return "redirect:" + page;
	}

	@RequestMapping(value = "recentList")
	public String recentList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		List<Memo> memos = memoMapper.findRecentByUserNumWithTags(user.getUserNum());
		model.addAttribute("memos", memos);

		navMaker(model, user);

		session.setAttribute("lastPage", "recentList");
		return "list";
	}

	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String create(Model model, HttpServletRequest request) {
		Memo memo = new Memo();
		memo.setDelMemo(1);
		model.addAttribute("memo", memo);

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		navMaker(model, user);

		session.setAttribute("lastPage", "create");
		return "memo";
	}

	// 회원가입 화면에서 아이디 중복 확인 버튼 클릭
	@RequestMapping(value = "addTags", method = RequestMethod.GET)
	public String addTags(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		navMaker(model, user);
		model.addAttribute("userTags", new ArrayList<Tag>());

		return "add_tags";
	}

	// 중요한 메모 리스트
	@RequestMapping(value = "addTagsSearch")
	public String addTagsSearch(Model model, HttpServletRequest request,
			@RequestParam("searchString") String searchString, @RequestParam("tagNumString") String tagNumString)
			throws UnsupportedEncodingException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		String s = URLDecoder.decode(searchString, "utf-8");

		List<Tag> tags = tagMapper.findByStartTagName(user.getUserNum(), searchString);

		model.addAttribute("tags", tags);

		List<Path> paths = pathMapper.findByUserNum(user.getUserNum());
		model.addAttribute("paths", paths);

		model.addAttribute("tagNumString", tagNumString);

		return "add_tags";
	}

	// 아이디 중복 확인 화면에서 확인 버튼 클릭
	@RequestMapping(value = "addTagsRefresh")
	public String addTagsRefresh(Model model, @RequestParam("tagNumString") String tagNumString,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		System.out.println(tagNumString);
		String[] splitString = tagNumString.split(" ");

		List<Tag> userTags = new ArrayList<>();
		for (int i = 0; i < splitString.length; i++)
			userTags.add(tagMapper.findOne(Integer.parseInt(splitString[i])));

		navMaker(model, user);
		model.addAttribute("userTags", userTags);
		model.addAttribute("tagNumString", tagNumString);

		return "add_tags"; // 이후 처리를 자바스크립트로 구현
	}

	// 아이디 중복 확인 화면에서 확인 버튼 클릭
	@RequestMapping(value = "addTags", method = RequestMethod.POST)
	public String addTags(Model model, @RequestParam("tagNumString") String tagNumString, HttpServletRequest request) {

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		System.out.println(tagNumString);
		String[] splitString = tagNumString.split(" ");

		List<Tag> userTags = new ArrayList<>();
		StringBuilder tagNameString = new StringBuilder();
		for (int i = 0; i < splitString.length; i++) {
			if (i != 0)
				tagNameString.append(" ");
			Tag t = tagMapper.findOne(Integer.parseInt(splitString[i]));
			userTags.add(t);
			tagNameString.append(t.getTagName());
		}

		navMaker(model, user);

		model.addAttribute("userTags", userTags);
		model.addAttribute("tagNumString", tagNumString);
		model.addAttribute("tagNameString", tagNameString.toString());

		return "add_tags"; // 이후 처리를 자바스크립트로 구현
	}

	// 메모 작성화면에서 저장 클릭
	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String create(Model model, HttpServletRequest request, Memo memo) {

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		memo.setUserNum(user.getUserNum());
		List<Tag> userTag = tagMapper.findByUserNum(memo.getUserNum());

		SimpleDateFormat format1 = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		Date time = new Date();
		String memoDate = format1.format(time);
		memo.setMemoDate(memoDate);

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
	public String edit(Model model, @RequestParam("memoNum") int memoNum, HttpServletRequest request) {
		Memo memo = memoMapper.findOneWithTags(memoNum);
		model.addAttribute("memo", memo);

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		navMaker(model, user);

		session.setAttribute("lastPage", "edit?memoNum=" + memoNum);
		return "memo";
	}

	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String edit(Model model, HttpServletRequest request, Memo memo) throws CloneNotSupportedException {
		System.out.println("form 입력값 memo ------ " + memo);

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		memo.setUserNum(user.getUserNum());

		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		Date time = new Date();
		String memoDate = format.format(time);
		memo.setMemoDate(memoDate);

		// 1. 메모 insert (userNum, memoText, memoDate)
		memoMapper.update(memo);

		// 2. 태그 확인 (userNum, tagName)
		List<String> tagStringSplitList = new ArrayList<>(Arrays.asList(memo.getTagString().split(" ")));
		// 띄어쓰기로 구분된 태그문자열을 split한 리스트

		List<Tag> allUserTagList = tagMapper.findByUserNum(memo.getUserNum());
		// 해당 사용자의 모든 태그 리스트

		List<Tag> alreadyExistTagList = new ArrayList<>();
		// 이미 존재하는 태그 리스트
		for (Tag t : allUserTagList) { // 이미 만들어져 있는 태그 인지 확인
			if (tagStringSplitList.contains(t.getTagName())) {
				alreadyExistTagList.add(t);
				tagStringSplitList.remove(t.getTagName());
			}
		}

		// 3. 태그, TM 관리

		// [[[이미 만들어져 있는 태그]]] - tm insert 필요
		// 유지, 추가(tm insert), 삭제(tm delete) 태그 구별
		List<Tag> pastMemoTagList = tagMapper.findByMemoNum(memo.getMemoNum()); // 업데이트 전 메모 태그 리스트
		System.out.println("past - " + pastMemoTagList);
		List<Tag> pastMemoTagListCopy = cloneList(pastMemoTagList); // pastMemoTagList 복사 리스트

		// past - exist ==> tm에서 제거(tagNum, memoNum으로 delete)
		pastMemoTagList.removeAll(alreadyExistTagList);
		for (Tag t : pastMemoTagList)
			tmMapper.delete(new TM(memo.getMemoNum(), t.getTagNum()));

		// exist - past 복사 리스트 ==> tm에 추가 (insert)
		alreadyExistTagList.removeAll(pastMemoTagListCopy);
		for (Tag t : alreadyExistTagList)
			tmMapper.insert(new TM(memo.getMemoNum(), t.getTagNum()));

		System.out.println("past - " + pastMemoTagList);
		System.out.println("already - " + alreadyExistTagList);

		// [[[[추가할 태그]]]] - tag insert/ tm insert 필요
		// 태그 만들어서 tm 추가 (tagNum, memoNum)
		for (String s : tagStringSplitList) {
			Tag t = new Tag(memo.getUserNum(), s);
			tagMapper.insert(t);
			tmMapper.insert(new TM(memo.getMemoNum(), t.getTagNum()));
		}

		tagTableCleanup(); // 태그제거

//		// 4.update한 메모 다시 불러오기
//		Memo m = memoMapper.findOneWithTags(memo.getMemoNum());
//		model.addAttribute("memo", m);

		return "redirect:edit?memoNum=" + memo.getMemoNum();
	}

	public List<Tag> cloneList(List<Tag> list) throws CloneNotSupportedException {
		List<Tag> clone = new ArrayList<Tag>(list.size());
		for (Tag item : list)
			clone.add(item.clone());
		return clone;
	}

	/**
	 * 휴지통 처리
	 * 
	 * @param model
	 * @param request
	 * @return
	 */

	// 쓰레기통 화면
	@RequestMapping("trashList")
	public String trash(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		List<Memo> memos = memoMapper.findTrashByUserNumWithTags(user.getUserNum());
		model.addAttribute("memos", memos);

		navMaker(model, user);

		session.setAttribute("lastPage", "trashList");

		return "list";
	}

	// 메모 작성 화면에서 삭제 버튼 클릭 (휴지통으로)
	@RequestMapping("trashFromMemo")
	public String trashFromMemo(Model model, @RequestParam("memoNum") int memoNum, HttpServletRequest request) {
		memoMapper.trash(memoNum); // del_memo update

		HttpSession session = request.getSession();
		String page = (String) session.getAttribute("lastPage");
		return "redirect:" + page;
	}

	// 리스트 화면에서 체크해서 삭제 버튼 클릭(휴지통으로)
	@RequestMapping("trashChecked")
	public String trashChecked(Model model, @RequestParam("memoNumString") String memoNumString,
			HttpServletRequest request) {
		String[] memmoNumStringSplit = memoNumString.split(" ");

		System.out.println("memmoNumStringSplit ---- " + Arrays.toString(memmoNumStringSplit));
		for (String memoNum : memmoNumStringSplit)
			memoMapper.trash(Integer.parseInt(memoNum));

		HttpSession session = request.getSession();
		String page = (String) session.getAttribute("lastPage");
		return "redirect:" + page;
	}

	// 메모 작성 화면에서 복원 버튼 클릭 (리스트로)
	@RequestMapping("restoreFromMemo")
	public String restoreFromMemo(Model model, @RequestParam("memoNum") int memoNum, HttpServletRequest request) {
		memoMapper.restore(memoNum); // del_memo update

		HttpSession session = request.getSession();
		String page = (String) session.getAttribute("lastPage");
		return "redirect:" + page;
	}

	// 휴지통 화면에서 체크해서 복원 버튼 클릭(리스트로)
	@RequestMapping("restoreFromTrash")
	public String restoreFromTrash(Model model, @RequestParam("memoNumString") String memoNumString) {
		String[] memmoNumStringSplit = memoNumString.split(" ");

		System.out.println("memmoNumStringSplit ---- " + Arrays.toString(memmoNumStringSplit));
		for (String memoNum : memmoNumStringSplit)
			memoMapper.restore(Integer.parseInt(memoNum));

		return "redirect:trashList";
	}

	// 쓰레기통에서 영구삭제
	// tm제거, delete 메모, tag 제거
	@RequestMapping("delete")
	public String delete(Model model, @RequestParam("memoNumString") String memoNumString) {

		String[] memmoNumStringSplit = memoNumString.split(" ");

		System.out.println("memmoNumStringSplit ---- " + Arrays.toString(memmoNumStringSplit));
		for (String memoNum : memmoNumStringSplit) {

			tmMapper.deleteByMemoNum(Integer.parseInt(memoNum)); // 해당 메모의 tm다 제거
			memoMapper.delete(Integer.parseInt(memoNum)); // 해당 메모 제거
		}

		tagTableCleanup(); // 태그제거
		return "redirect:trashList";
	}

	// 휴지통 비우기
	@RequestMapping("deleteAll")
	public String deleteAll(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		List<Memo> memos = memoMapper.findTrashByUserNumWithTags(user.getUserNum());

		for (Memo memo : memos) {
			tmMapper.deleteByMemoNum(memo.getMemoNum()); // 해당 메모의 tm다 제거
			memoMapper.delete(memo.getMemoNum()); // 해당 메모 제거
		}

		tagTableCleanup(); // 태그제거

		String page = (String) session.getAttribute("lastPage");
		return "redirect:" + page;
	}

	// 연결된 메모가 없는 태그들 제거(delete)
	public void tagTableCleanup() {
		List<Tag> withoutReferenceTagList = tagMapper.findWithoutReference(); // 연결된 메모가 없는 태그 리스트
		System.out.println("withoutReferenceTagList --- " + withoutReferenceTagList);
		for (Tag t : withoutReferenceTagList)
			tagMapper.delete(t.getTagNum()); // 태그 삭제
	}

}