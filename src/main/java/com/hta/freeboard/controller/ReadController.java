package com.hta.freeboard.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hta.freeboard.repository.BoardDto;
import com.hta.freeboard.service.BoardService;

@Controller
public class ReadController {
	private BoardService boardService;
	
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}

	@RequestMapping("/read.board1")
	public ModelAndView PageMove(@RequestParam int b_seq) throws SQLException{//int b_seq는 @requestParameter를 이용한것
		ModelAndView mav = new ModelAndView("/freeboard/read");
		BoardDto dto = boardService.findBySeq(b_seq);
		System.out.println("1. 카운터증가 실행되니??");
		boardService.increaseCount(dto);
		mav.addObject("dto",dto);
		return mav;
	}
}