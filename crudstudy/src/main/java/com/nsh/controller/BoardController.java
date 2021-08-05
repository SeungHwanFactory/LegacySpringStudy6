package com.nsh.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nsh.domain.BoardVO;
import com.nsh.domain.PageDTO;
import com.nsh.domain.Paging;
import com.nsh.service.BoardService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
public class BoardController {
	
	private BoardService service;
	
	@Autowired
	public BoardController (BoardService service) {
		this.service = service;
	}
	
	/*
	 * 게시글 목록
	 * */
//	@GetMapping("/list")
//	public void list(Model model) {
//		log.info("목록");
//		model.addAttribute("list", service.getList());
//	}
	
	/*
	 * 페이징 처리한 게시글 목록(+추가: 전체 데이터의 개수 처리)
	 * */
	@GetMapping("/list")
	public void list(Paging page, Model model) {
		log.info("컨트롤러:" + page);
		model.addAttribute("list", service.getList(page));
		//model.addAttribute("pageMaker", new PageDTO(page, 123));
		model.addAttribute("pageMaker", new PageDTO(page, service.getTotal(page)));
	}
	
	/*
	 * 게시글 작성(화면에서 버튼 클릭)
	 * */
	@GetMapping("/register")
	public void register() {
		
	}
	
	/*
	 * 게시글 작성
	 * */
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("게시글 작성: " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/list";
	}
	
	/*
	 * 게시글 조회
	 * */
	/*
	 * @GetMapping("/get") public void get(@RequestParam("bno") Long bno, Model
	 * model) { log.info("/get"); model.addAttribute("board", service.get(bno)); }
	 */
	
	/*
	 * 게시글 조회 메서드 수정
	 * */
	/*
	 * @GetMapping({"/get", "/modify"}) public void get(@RequestParam("bno") Long
	 * bno, Model model) { log.info("/get or modify"); model.addAttribute("board",
	 * service.get(bno)); }
	 */
	
	/*
	 * 게시글 조회 메서드 수정(페이징 처리)
	 * */
	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("page") Paging page, Model model) {
		log.info("/get, /modify");
		model.addAttribute("board", service.get(bno));
	}
	
	/*
	 * 게시글 수정
	 * */
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("page") Paging page, RedirectAttributes rttr) {
		log.info("수정: " + board);
		
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", page.getPageNum());
		rttr.addAttribute("amount", page.getAmount());
		
		return "redirect:/board/list";
	}
	
	/*
	 * 게시글 삭제
	 * */
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("page") Paging page, RedirectAttributes rttr) {
		log.info("삭제: " + bno);
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", page.getPageNum());
		rttr.addAttribute("amount", page.getAmount());
		
		return "redirect:/board/list";
	}
	
}
