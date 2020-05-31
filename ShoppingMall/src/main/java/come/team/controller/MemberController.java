package come.team.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import come.team.domain.MemberVO;
import come.team.service.MemberService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {
	
	private MemberService service;
	
	@GetMapping("/index")
	public void index(Principal principal) {
		log.info("id: " + principal.getName());
	}
	
	@GetMapping("/getMember") //내 계정 정보 확인
	public ModelAndView myAccount(Principal principal) {
		String id = principal.getName();
		MemberVO vo = service.getMember(id);
		return new ModelAndView("/member/getMember", "member", vo);
	}
	
	@PostMapping("/modify") //내 계정 정보 수정
	public String modify(MemberVO memberVO, SessionStatus status) {
		log.info("post modify");
		BCryptPasswordEncoder passEncoder = new BCryptPasswordEncoder();
		memberVO.setPassword(passEncoder.encode(memberVO.getPassword()));
		memberVO.setPoint(memberVO.getPoint());
		service.update(memberVO);
		//
		status.setComplete();
		return "redirect:/member/index";
	}
	
	// 회원 탈퇴 페이지 매핑
	@GetMapping("/deleteForm") 
	public void delete() {
		log.info("get deleteForm");
	}
	
	// 회원 탈퇴
	@PostMapping("/deletePro") 
	public String deleteProcess(Principal principal, HttpSession session) {
		log.info("delete start");
		String id = principal.getName();
		service.delete(id);
		
		session.invalidate();
		log.info("delete finish");
		return "redirect:/";
	}
	
}
