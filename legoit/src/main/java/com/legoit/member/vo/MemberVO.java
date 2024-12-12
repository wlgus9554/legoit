package com.legoit.member.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {

	private String email; // 아이디 (이메일 형식)
	private String pw; // 비밀번호
	private String name; // 이름
	private String birth; // 생년월일
	private String tel; // 전화번호
	private Date regDate; // 가입일
	private Date conDate; // 최근접속일
	private String status; // 상태
	private String photo; // 회원사진
	private Integer gradeNo; // 등급번호
	private String gradeName; // 등급명 - grade 테이블에 존재
	private String nickName; // 닉네임
	private String gender; // 성별
}
