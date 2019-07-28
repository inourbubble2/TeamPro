package come.team.service;

import java.util.List;



import come.team.domain.ReplyVO;

public interface ReplyService {
	
	public List<ReplyVO> getReplyList(); // 답변 글 리스트
	public int getReplyNum(); // 답변 글 번호 얻어오기
	public ReplyVO getReplyView(int replyNo); // 답변 글 상세 조회
 	public List<ReplyVO> getReplyListByInquiryNo(int inquiryNo); // 답변 글 리스트를 보여주기(문의사항 글에 대한)
	public void registerReplyInquiry(ReplyVO replyVO); // 답변 글 작성
		
}
