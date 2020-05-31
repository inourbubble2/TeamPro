package come.team.controller;


import java.security.Principal;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import come.team.domain.Criteria;
import come.team.domain.PageDTO;
import come.team.domain.ProductVO;
import come.team.service.ProductService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/product")
public class UserProductController {
	
	private ProductService productService;
	/*private CartService cartservice;*/
//	private ReviewService reviewService;
	
	// 상품 리스트 보여주기
	@GetMapping("/list")
	public void list(Criteria criteria, Model model) {
		
		criteria.setAmount(10);
		
		log.info("list: " + criteria);
		
		model.addAttribute("list", productService.findPagingList(criteria));
		
		int total = productService.countAll(criteria);
		
		model.addAttribute("pageMaker", new PageDTO(criteria, total));
		
	}
	
	// 상품 상세 정보 조회
	@GetMapping("/view")
	public void view(String productCode, Model model) throws Exception {
		ProductVO productVO = productService.productView(productCode);
		model.addAttribute("board", productVO);
		
	}
	
}
