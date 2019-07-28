package come.team.service;

import java.util.List;

import come.team.domain.NoticeVO;

public interface NoticeService {
	
	public List<NoticeVO> list(); //공지사항 글 리스트
	
	public NoticeVO view(int noticeNo); //공지사항 글 상세 조회
	
	public void insert(NoticeVO vo); //공지사항 글 작성
	
	public void update(NoticeVO vo); // 공지사항 글 수정
	
	public void delete(int noticeNo); // 공지사항 글 삭제

}
