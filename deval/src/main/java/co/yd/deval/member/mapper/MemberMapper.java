package co.yd.deval.member.mapper;

import java.util.HashMap;

import co.yd.deval.member.service.MemberVO;

public interface MemberMapper {
	MemberVO memberSelect(MemberVO vo);
	int memberInsert(MemberVO vo);
	int memberUpdate(MemberVO vo);
	int memberDelete(MemberVO vo);
	
	MemberVO memberLogin(String id);
	int memberExpUp(HashMap<String, Object> exp);
	int memberCashUpdate(HashMap<String, Object> cash);
	
	String memberMailGet(String id);
}
