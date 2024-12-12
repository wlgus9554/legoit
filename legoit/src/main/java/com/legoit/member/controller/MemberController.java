package com.legoit.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.legoit.member.service.MemberService;
import com.legoit.member.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class MemberController {

	@Autowired
	@Qualifier("memberServiceImpl")
	private MemberService service;
	
	@GetMapping("/writeForm.do")
	public String writeForm() {
		log.info("writeForm.do");
		return "member/writeForm";
	}
	@GetMapping("/write.do")
	public String write(MemberVO vo, RedirectAttributes rttr) {
		// Controller에 write 부분을 알리기 위한 로그
		log.info("write.do");
		// vo를 찍어보는 로그
		log.info(vo);
		// service -> write -> mapper
		service.write(vo);
		
		rttr.addFlashAttribute("msg, 회원가입에 성공하였습니다.");
		return "redirect:list.do";
	}
}
