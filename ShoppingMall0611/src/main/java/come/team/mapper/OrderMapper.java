package come.team.mapper;

import java.util.List;

import come.team.domain.MemberVO;
import come.team.domain.PaymentDetailVO;
import come.team.domain.PaymentListVO;
import come.team.domain.PaymentVO;

public interface OrderMapper {
	
	// 주문 정보에 넣기
	public void orderInput(PaymentVO payment);
	
	// 주문 상세 정보에 넣기
	public void orderDetailInput(PaymentDetailVO paymentDetail);
	
	// 주문 목록
	public List<PaymentVO> paymentList(PaymentVO payment);
		
	// 주문 상세 목록
	public List<PaymentListVO> paymentView(PaymentVO payment);
	
	// 주문 후 포인트 차감
	public void updatePoint(MemberVO member);
	
	// 주문 목록(관리자)
	public List<PaymentVO> adminPaymentList(PaymentVO payment);
}
