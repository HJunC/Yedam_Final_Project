package co.yd.deval.member.serviceImpl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yd.deval.member.mapper.MemberMapper;
import co.yd.deval.member.service.MemberService;
import co.yd.deval.member.service.MemberVO;


@Repository("memberDao")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper map;
	
	@Override
	public MemberVO memberSelect(MemberVO vo) {
		return map.memberSelect(vo);
	}

	@Override
	public int memberInsert(MemberVO vo) {
		return map.memberInsert(vo);
	}

	@Override
	public int memberUpdate(MemberVO vo) {
		return map.memberUpdate(vo);
	}

	@Override
	public int memberDelete(MemberVO vo) {
		return map.memberDelete(vo);
	}
	
	@Override
	public MemberVO memberLogin(String id) {
		System.out.println(id+"======================");
		return map.memberLogin(id);
	}
	
	@Override
	public int memberExpUp(HashMap<String, Object> exp) {
		return 0;
	}

	@Override
	public int memberCashUpdate(Map<String, Object> cash) {
		return map.memberCashUpdate(cash);
	}

	@Override
	public int refund(Map<String, Object> cash) {
		return map.refund(cash);
  
  @Override
	public String memberMailGet(String id) {
		return map.memberMailGet(id);
	}

}
