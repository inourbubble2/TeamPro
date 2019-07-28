package come.team.service;

import java.util.List;    

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import come.team.domain.Criteria;
import come.team.domain.InquiryVO;
import come.team.mapper.InquiryMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class InquiryServiceImpl implements InquiryService {
	
	@Setter(onMethod_ = @Autowired)
	private InquiryMapper mapper;

	@Override
	public List<InquiryVO> getInquiryList(Criteria criteria) {
		return mapper.getInquiryList(criteria);
	}
	
	@Override
	public int getInquiryNum() {
		return mapper.getInquiryNum();
	}

	@Override
	public InquiryVO getInquiryView(int inquiryNo) {
		return mapper.getInquiryView(inquiryNo);
	}
	
	//게시물 작성
	@Override
	public void registerInquiry(InquiryVO inquiryVO) {
		mapper.registerInquiry(inquiryVO);
	}

	// 게시물 수정
	@Override
	public void modifyInquiry(InquiryVO inquiryVO) {
		mapper.modifyInquiry(inquiryVO);
		
	}

	//게시글 삭제
	@Override
	public void deleteInquiry(int inquiryNo) {
		mapper.deleteInquiry(inquiryNo);

	}


}

