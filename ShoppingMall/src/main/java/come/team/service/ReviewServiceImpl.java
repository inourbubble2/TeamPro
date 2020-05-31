package come.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import come.team.domain.Criteria;
import come.team.domain.PaymentVO;
import come.team.domain.ReviewPageDTO;
import come.team.domain.ReviewVO;
import come.team.mapper.ReviewMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {

	
	@Setter(onMethod_ = @Autowired)
	private ReviewMapper mapper;
	
	@Override
	public List<ReviewVO> getReviewList(Criteria criteria, String productCode) {
		return mapper.getReviewList(criteria, productCode);
	}

	@Override
	public int countAllReview(String productCode) {
		return mapper.countAllReview(productCode);
	}

	public ReviewPageDTO getReviewListPage(Criteria criteria, String productCode) {
		return new ReviewPageDTO(mapper.countAllReview(productCode), mapper.getReviewList(criteria, productCode));
	}

	@Override
	public void registerReview(ReviewVO reviewVO) {
		mapper.registerReview(reviewVO);
	}

	@Override
	public PaymentVO checkPayment(String id, String productCode) {
		return mapper.checkPayment(id, productCode);
		
	}
	
	@Override
	public void modifyReview(ReviewVO reviewVO) {
		mapper.modifyReview(reviewVO);
		
	}

	@Override
	public void deleteReview(int reviewNo, String id) {
		mapper.deleteReview(reviewNo, id);
		
	}

	@Override
	public ReviewVO getReview(int reviewNo) {
		return mapper.getReview(reviewNo);
	}

}
