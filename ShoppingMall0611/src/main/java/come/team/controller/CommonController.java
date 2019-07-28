package come.team.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import come.team.domain.MemberVO;
import come.team.service.MemberService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class CommonController {
	
private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder passEncoder;
	
	//회원가입 페이지 매핑
	@GetMapping("/join")
	public void join() throws Exception{
		log.info("get join");
	}
	
	//post방식 회원가입 페이지 구현
	@PostMapping("/join") 
	public String join(MemberVO vo) throws Exception{
		log.info("post join");
		
		String inputPass = vo.getPassword();
		String pass = passEncoder.encode(inputPass);
		vo.setPassword(pass);
		
		service.join(vo);
		
		log.info("UserVO: " + vo);
		
		return "redirect:/";	
	}
	
	// 접속 실패시의 매핑
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access denied: " + auth);
		
		model.addAttribute("msg", "access denied");
	}
	// 로그인 페이지의 매핑
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		log.info("error: " + error);
		log.info("logout: " + logout);
		
		if(error != null) {
			model.addAttribute("error", "login error check your account");
		}
		if(logout != null) {
			model.addAttribute("logout", "logout!!");
		}
	
	}
	// 로그아웃 페이지의 매핑
	@GetMapping("/customLogout")
	public void logoutGet() {
		log.info("logout");
	}
	// 포스트 방식의 로그아웃 페이지의 매핑
	@PostMapping("customLogout")
	public void logoutPost() {
		log.info("post logout");
	}
}
