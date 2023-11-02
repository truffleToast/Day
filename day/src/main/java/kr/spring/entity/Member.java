package kr.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Member {

	private String memid;
	private String mempw;
	private String memname;
	private String memphone;
	private String memaddr;
	private String latitude;	
	private String longitude;
	
	
}
