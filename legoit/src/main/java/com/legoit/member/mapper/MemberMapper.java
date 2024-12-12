package com.legoit.member.mapper;

import com.legoit.member.vo.MemberVO;

public interface MemberMapper {
	
	// 회원가입
	public Integer write(MemberVO vo);

}
