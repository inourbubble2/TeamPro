package come.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import come.team.domain.CartVO;
import come.team.mapper.CartMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CartServiceImpl implements CartService {
	
	private CartMapper mapper;


	@Override
	public void addCart(CartVO cart) { //카트 담기
		mapper.addCart(cart);
	}



	@Override
	public List<CartVO> getCartList(String id) { //한 계정의 카트 리스트 불러오기
		return mapper.getCartList(id);
	}



	@Override
	public void deleteCart(CartVO cart) { //카트 리스트에서 삭제
		mapper.deleteCart(cart);
		
	}

	// 주문 정보 입력 후 카트 비우기
	@Override
	public void deleteCartAfterOrder(String id) {
		mapper.deleteCartAfterOrder(id);
		
	}

}
