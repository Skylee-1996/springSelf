package com.myweb.www.service;

import java.util.List;

import com.myweb.www.security.MemberVO;

public interface MemberService {

	int register(MemberVO mvo);

	boolean updateLastLogin(String authEmail);

	MemberVO detail(String email);

	List<MemberVO> getList();

	int update(MemberVO mvo);

	int updateWp(MemberVO mvo);

	void delete(String email);

	MemberVO emailCheck(String email);


}
