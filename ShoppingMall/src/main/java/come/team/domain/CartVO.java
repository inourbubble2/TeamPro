package come.team.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CartVO {
	private int cartNo; //장바구니 번호
	private String productCode; //상품 코드
	private String id; //아이디
	private int amount; //수량
	private String productName; //상품 이름
	
	//added
	private	int price; //상품 가격
	private	Date addDate; //장바구니에 추가한 날짜
}
