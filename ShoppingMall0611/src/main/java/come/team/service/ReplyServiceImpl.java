package come.team.service;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import come.team.domain.ReplyVO;
import come.team.mapper.InquiryMapper;
import come.team.mapper.ReplyMapper;
import lombok.Setter;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper replyMapper;
	
	@Setter(onMethod_ = @Autowired)
	private InquiryMapper inquiryMapper;
	
	@Override
	public List<ReplyVO> getReplyList() {
		return replyMapper.getReplyList();
	}
	
	@Override
	public int getReplyNum() {
		return replyMapper.getReplyNum();
	}
	
	@Override
	public void registerReplyInquiry(ReplyVO replyVO) {
		replyMapper.registerReplyInquiry(replyVO);
		
	}

	@Override
	public ReplyVO getReplyView(int replyNo) {
		return replyMapper.getReplyView(replyNo);
	}

	@Override
	public List<ReplyVO> getReplyListByInquiryNo(int inquiryNo) {
		return replyMapper.getReplyListByInquiryNo(inquiryNo);
	}
	
}
