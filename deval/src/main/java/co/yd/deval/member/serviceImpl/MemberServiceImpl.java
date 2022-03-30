package co.yd.deval.member.serviceImpl;

import java.util.HashMap;

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
	public int memberExpUp(HashMap<String, Object> exp) {
		return 0;
	}

	@Override
	public int memberCashUpdate(HashMap<String, Object> cash) {
		return 0;
	}

}
