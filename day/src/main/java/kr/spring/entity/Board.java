package kr.spring.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Board {
	
			private int idx;
			private String memid; 
			private String title;
			private String content; 
			private String writer;
			private Date indate;
			private int count;
			private int boardgroup; 
			private int boardsequence; 
			private int boardlevel; 
			private int boardavailable;	

}
