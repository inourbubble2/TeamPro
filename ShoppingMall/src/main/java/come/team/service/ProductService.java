package come.team.service;

import java.util.List;

import come.team.domain.Criteria;
import come.team.domain.ProductVO;

public interface ProductService {
	
	List<ProductVO> findPagingList(Criteria criteria); //페이징해서 제품 찾기
	int countAll(Criteria criteria); //전체 상품 개수 구하기
	ProductVO productView(String productCode);// 상품 정보보기
	
	void register(ProductVO vo); //제품 등록
	void delete(String productCode); //제품 삭제
	void update(ProductVO vo); //제품 정보 수정

}
