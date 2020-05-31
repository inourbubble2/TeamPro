package come.team.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Criteria cri;
	
	public PageDTO(Criteria criteria, int total) { //Criteria 객체와 총 값을 전달 받는다.
		
		this.cri = criteria;
		this.total = total;
		
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10; //Math.ceil = 소수점이하를 올림한다
		this.startPage = this.endPage - 9;
		
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		
		if (realEnd <= this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1; //startPage 가 1 이상이면 true
		this.next = this.endPage < realEnd; //realEnd가 endPage보다 크다면 true
		
	}
	
}
