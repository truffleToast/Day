package kr.spring.entity;

import lombok.Data;

@Data
public class PageMaker {// 페이징처리 클래스
	
	private Criteria cri; // 현재 페이지 정보, 게시글을 몇개씩 볼것인지, 몇번 글 부터 시작하는 객체
	
	private int totalCount; //총 게시글의 수
	
	private int startPage; //시작페이지 번호
	
	private int endPage; //끝페이지 번호
	
	private boolean prev; //이전버튼
	 
	private boolean next; //다음버튼
	
	private int displayPageNum = 3; // 하단에 몇개의 페이지를 보여줄 것인지
	
	// 총 게시글의 수를 구하는 메소드
	public void setTotalCount(int totalCount) {
			this.totalCount = totalCount;
			makePagein();
	}
	
	public void makePagein() {
		// 1. 화면에 보여질 마지막 페이지 번호
		// 현재 하단에 보여줄 페이지 개수는 10개.
		
		endPage = (int)(Math.ceil(cri.getPage() / (double)displayPageNum) * displayPageNum);
		
		// 2. 화면에 보여질 시작페이지 번호
		
		startPage = endPage - displayPageNum +1 ;
		
		if(startPage <= 0) {
			startPage = 1;
		}
		// 3. 최종페이지가 맞는지 유효성 검사
		int tempEndPage =(int)Math.ceil(totalCount / (double)cri.getPerPageNum());
		
		// 4. 화면에 보여질 마지막 페이지 유효성 체크
		if(tempEndPage < endPage) {
			endPage = tempEndPage;
			
		}
		// 5. 이전, 다음 페이지 버튼 존재여부
		prev = (startPage == 1) ? false : true ;
		next = (endPage < tempEndPage) ? true : false;
		
		
		
		
	}
	
	
	
	
	
	
}
