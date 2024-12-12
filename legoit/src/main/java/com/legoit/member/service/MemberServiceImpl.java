package com.legoit.member.service;

import org.apache.catalina.mapper.Mapper;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.legoit.member.mapper.MemberMapper;
import com.legoit.member.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
@Qualifier("memberServiceImpl")
public class MemberServiceImpl implements MemberService{
	
	private MemberMapper mapper;
	
	// 회원가입
	@Override
	public Integer write(MemberVO vo) {
		// TODO Auto-generated method stub
		Integer result = mapper.write(vo);
		return result;
	}

}
