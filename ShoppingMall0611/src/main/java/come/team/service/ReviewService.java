package come.team.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import come.team.domain.Criteria;
import come.team.domain.PaymentVO;
import come.team.domain.ReviewPageDTO;
import come.team.domain.ReviewVO;

public interface ReviewService {
	
	// 리뷰 글 리스트
	public List<ReviewVO> getReviewList(@Param("criteria") Criteria criteria, @Param("productCode") String productCode);
	
	// 페이징 처리를 위한 전체 리뷰 수 count
	public int countAllReview(String productCode);
	
	// 리뷰 리스트 페이징
	public ReviewPageDTO getReviewListPage(Criteria criteria, String productCode);

	// 리뷰 글 작성
	public void registerReview(ReviewVO reviewVO);
	
	// 리뷰 글 보기
	public ReviewVO getReview(int reviewNo);
	
	// 리뷰 글 수정
	public void modifyReview(ReviewVO reviewVO);
	
	// 리뷰 글 삭제
	public void deleteReview(@Param("reviewNo") int reviewNo, @Param("id") String id);
	
	// 결제 확인, 결제를 해야 리뷰를 작성할 수 있기 때문에
	public PaymentVO checkPayment(@Param("id") String id, @Param("productCode") String productCode);

}
