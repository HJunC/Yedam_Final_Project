package co.yd.deval.member.service;

import java.util.HashMap;

import co.yd.deval.member.vo.MemberVO;

public interface MemberService {
	MemberVO memberSelect(MemberVO vo);
	int memberInsert(MemberVO vo);
	int memberUpdate(MemberVO vo);
	int memberDelete(MemberVO vo);
	
	int memberExpUp(HashMap<String, Object> exp);
	int memberCashUpdate(HashMap<String, Object> cash);
}
