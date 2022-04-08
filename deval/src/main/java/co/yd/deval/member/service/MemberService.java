package co.yd.deval.member.service;

import java.util.HashMap;
import java.util.Map;

public interface MemberService {
	MemberVO memberSelect(MemberVO vo);
	int memberInsert(MemberVO vo);
	int memberUpdate(MemberVO vo);
	int memberDelete(MemberVO vo);
	
	MemberVO memberLogin(String id);	
	int memberExpUp(HashMap<String, Object> exp);
	int memberCashUpdate(Map<String, Object> cash);
}
