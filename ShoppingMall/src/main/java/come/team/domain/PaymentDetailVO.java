package come.team.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentDetailVO {
	
	int detailNo; //주문 상세 정보 번호
	String payCode; // 주문(결제) 코드
	String id; // 아이디
	String productCode; // 상품 코드
	int amount; // 수량
	Date payDate; // 주문 날짜
	
	

}
