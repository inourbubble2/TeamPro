package come.team.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import come.team.domain.MemberVO;
import come.team.domain.PaymentDetailVO;
import come.team.domain.PaymentListVO;
import come.team.domain.PaymentVO;
import come.team.mapper.OrderMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class OrderServiceImpl implements OrderService {
	
	private OrderMapper mapper;
	
	@Override
	public void orderInput(PaymentVO payment) { //주문 정보에 넣기
		mapper.orderInput(payment);		
	}

	@Override
	public void orderDetailInput(PaymentDetailVO paymentDetail) { // 주문 상세 정보에 넣기
		mapper.orderDetailInput(paymentDetail);
		
	}

	@Override
	public List<PaymentVO> paymentList(PaymentVO payment) { // 주문 목록
		return mapper.paymentList(payment);
	}

	@Override
	public List<PaymentListVO> paymentView(PaymentVO payment) { //주문 상세 목록
		return mapper.paymentView(payment);
	}

	@Override
	public void updatePoint(MemberVO member) { // 주문 후 포인트 차감
		mapper.updatePoint(member);		
	}

	@Override
	public List<PaymentVO> adminPaymentList(PaymentVO payment) { // 주문 목록(관리자)
		return mapper.adminPaymentList(payment);
		
	}
	
	

}
