package co.yd.deval.member.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import co.yd.deval.member.mapper.MemberMapper;
import co.yd.deval.member.service.MemberVO;



public class LoginDetailService implements UserDetailsService {

	@Autowired
	private MemberMapper map;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberVO mvo = map.memberLogin(username);
		if(mvo == null) {
			throw new UsernameNotFoundException("user not found");
		}
		return mvo;
	}

}
