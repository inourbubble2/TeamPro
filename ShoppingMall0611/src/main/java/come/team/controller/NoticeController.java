package come.team.controller;

import java.text.DateFormat;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import come.team.domain.NoticeVO;
import come.team.service.NoticeService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/notice")
@AllArgsConstructor
public class NoticeController {
	
	//notice 관련 매핑이 많아져서 따로 분리
	private NoticeService service;
	

	//notice list jsp를 보여준다
	@GetMapping("/list")
	public void noticeList(Model model) {
		log.info("notice list");
		DateFormat format = DateFormat.getDateInstance(DateFormat.FULL);
		model.addAttribute("list", service.list());
		model.addAttribute("format", format);
	}
	
	//notice view jsp를 보여준다
	@GetMapping("/view")
	public void noticeView(Model model, int num) {
		log.info("notice view");
		DateFormat format = DateFormat.getDateInstance(DateFormat.FULL);
		model.addAttribute("no", service.view(num));
		model.addAttribute("format", format);
	}
	
	//notice register jsp를 보여준다
	@GetMapping("/register")
	public void noticeRegister() {
		log.info("get register");
	}
	
	
	//notice register jsp form에서 받은 정보를 notice에 insert하고 list.jsp 로 보낸다
	@PostMapping("/register")
	public String noticeRegisterCheck(NoticeVO vo) {
		log.info("noticeRegisterCheck");
		service.insert(vo);
		return "redirect:/notice/list";
	}
	
	//notice update jsp를 보여준다
	@GetMapping("/updateForm")
	public void noticeUpdate(Model model, int noticeNo) {
		log.info("notice update view");
		model.addAttribute("no", service.view(noticeNo));
	}
	
	//notice update jsp form에서 받은 정보를 notice에 update하고 list.jsp 로 보낸다
	@PostMapping("/update")
	public String noticeUpdateCheck(NoticeVO vo) {
		log.info("noticeUpdateCheck");
		service.update(vo);
		return "redirect:/notice/list";
	}
	
	//noticeNo를 받아 그 notice를 delete하고 list.jsp로 보낸다
	@GetMapping("/delete")
	public void noticeDelete(int noticeNo) {
		service.delete(noticeNo);
	}
	

}
