package come.team.mapper;

import java.util.List;

import come.team.domain.CartVO;

public interface CartMapper {
	public void addCart(CartVO cart);//카트에 담기
	
	public List<CartVO> getCartList(String id); //한 계정의 장바구니 목록 불러오기
	
	public void deleteCart(CartVO cart);//카트삭제	
	
	public void deleteCartAfterOrder(String id); // 주문 정보 입력 후 카트 비우기
	
}
