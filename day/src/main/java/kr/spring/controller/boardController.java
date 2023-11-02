package kr.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.spring.entity.Board;
import kr.spring.entity.Criteria;
import kr.spring.entity.PageMaker;
import kr.spring.service.BoardService;

@Controller //어노테이션
@RequestMapping("/board/*")
public class boardController {

	@Autowired
	private BoardService service;
	// BoardService는 interface : BoardServiceImpl에서 업캐스팅이 자동으로됨
	
	
	
	
	
	@PostMapping("/reply")
	public String reply(Board vo, Criteria cri, RedirectAttributes rttr) {
		service.reply(vo);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/list";
	}
	
	@GetMapping("/reply")
	public String reply(@RequestParam("idx") int idx, Model model, @ModelAttribute("cri") Criteria cri) {
		Board vo = service.get(idx);
		model.addAttribute("vo",vo);
		return "board/reply";
	}
	
	
	@GetMapping("/remove")
	public String remove(@RequestParam("idx") int idx, Criteria cri, RedirectAttributes rttr) {
		service.remove(idx);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list";
	}
	
	@PostMapping("/modify")
	public String modify(Board vo, Criteria cri, RedirectAttributes rttr) {
		service.modify(vo);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list";
	}
	
	
	
	@GetMapping("/modify")
	public String modify(@RequestParam("idx") int idx, Model model, @ModelAttribute("cri") Criteria cri) {
		Board vo = service.get(idx);
		model.addAttribute("vo",vo);
		return "board/modify";
	}
	
	
	@GetMapping("/get")												//model.addAttribute(cri)와 같은 역할
	public String get (@RequestParam("idx") int idx, Model model, @ModelAttribute("cri") Criteria cri) {
		
		Board vo = service.get(idx);
		model.addAttribute("vo",vo);
		return "board/get";		
	}
	
	
	@PostMapping("register")
	public String insertSelectKey(Board board, RedirectAttributes rttr) {
		
		service.insertSelectKey(board);
		rttr.addFlashAttribute("result",board.getIdx());
		return "redirect:/board/list";
	}
	
	
	
	@GetMapping("register")
	public String register() {
		
		return "board/register";
	}
	
	
	@RequestMapping("/list")
	public String boardList(Model model, Criteria cri) {
		// 페이지 정보를 알고있는 Criteria 객체를 Service에게 전달
		List<Board> list = service.getList(cri);
		// 페이징 처리에 필요한 PageMaker 객체도 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri); // pageMaker가 페이징 기법을 하기위하 cri객체 전달
		pageMaker.setTotalCount(service.totalCount(cri));
		
		model.addAttribute("list",list);
		model.addAttribute("pageMaker",pageMaker); //페이징 정보를 알고있는 객체 전달
		return "board/list";
	}
	
}
