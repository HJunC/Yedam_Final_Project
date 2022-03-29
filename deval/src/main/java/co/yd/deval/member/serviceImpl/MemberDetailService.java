package co.yd.deval.member.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import co.yd.deval.member.service.MemberService;
import co.yd.deval.member.vo.MemberVO;

public class MemberDetailService implements UserDetailsService {

	@Autowired
	private MemberService memberDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberVO vo = new MemberVO();
		vo.setMemberId(username);
		vo = memberDao.memberSelect(vo);
		if(vo == null) {
			throw new UsernameNotFoundException("user not found");
		}
		return vo;
	}

}
