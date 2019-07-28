package come.team.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import come.team.domain.Criteria;
import come.team.domain.InquiryVO;
import come.team.domain.ReplyVO;

public interface InquiryService {

	public List<InquiryVO> getInquiryList(Criteria criteria); // 문의사항 글 리스트
	
	public int getInquiryNum(); // 문의사항 글 번호 
	
	public InquiryVO getInquiryView(int inquiryNo); // 문의사항 글 상세 조회
	
	public void registerInquiry(InquiryVO inquiryVO);	//게시물 작성
	
	public void deleteInquiry(int inquiryNo); //게시물 삭제
	
	public void modifyInquiry(InquiryVO inquiryVO); //게시글 수정
	
}
