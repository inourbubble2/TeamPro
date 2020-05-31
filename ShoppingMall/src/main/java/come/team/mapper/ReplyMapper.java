package come.team.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import come.team.domain.ReplyVO;

public interface ReplyMapper {
	
	public List<ReplyVO> getReplyList(); // 답변 글 리스트
	public int getReplyNum(); // 답변 글 번호 얻기
	public ReplyVO getReplyView(int replyNo); // 답변 글 상세 조회
	public List<ReplyVO> getReplyListByInquiryNo(int inquiryNo); // 답변 글 리스트 불러오기
		
	public void registerReplyInquiry(ReplyVO replyVO); // 답변 글 작성

}
