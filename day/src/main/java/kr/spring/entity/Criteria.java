package kr.spring.entity;

import lombok.Data;

@Data
public class Criteria { //기준이라는 뜻
	
	private String type; //이름, 제목, 내용 
	
	private String keyword; // 검색 내용
	
	private int page; // 현재 페이지 번호 저장 변수
	
	private int perPageNum; // 한페이지 보여줄 게시글의 개수
	
	// Criteria 기본 셋팅 생성자를 통해서 하기
	public Criteria() {
		this.page = 1;
		this.perPageNum = 5;
	}
	
	
	// 현재 페이지의 게시글의 시작번호를 구하는 메소드
	// mysql에서는 시작값을 0으로 인식
	public int getPageStart() {
		return (page - 1)*perPageNum;
	}

}
