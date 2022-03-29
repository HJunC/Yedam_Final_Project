package co.yd.deval.member.serviceImpl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yd.deval.member.service.MemberMapper;
import co.yd.deval.member.service.MemberService;
import co.yd.deval.member.vo.MemberVO;


@Repository("memberDao")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper map;
	
	@Override
	public MemberVO memberSelect(MemberVO vo) {
		// TODO Auto-generated method stub
		return map.memberSelect(vo);
	}

	@Override
	public int memberInsert(MemberVO vo) {
		// TODO Auto-generated method stub
		return map.memberInsert(vo);
	}

	@Override
	public int memberUpdate(MemberVO vo) {
		// TODO Auto-generated method stub
		return map.memberUpdate(vo);
	}

	@Override
	public int memberDelete(MemberVO vo) {
		// TODO Auto-generated method stub
		return map.memberDelete(vo);
	}

	@Override
	public int memberExpUp(HashMap<String, Object> exp) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int memberCashUpdate(HashMap<String, Object> cash) {
		// TODO Auto-generated method stub
		return 0;
	}

}
