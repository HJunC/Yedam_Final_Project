package co.yd.deval.member.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yd.deval.member.mapper.LoginMapper;
import co.yd.deval.member.service.LoginService;
import co.yd.deval.member.service.LoginVO;

@Repository("loginDAO")
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private LoginMapper map;
	
	@Override
	public LoginVO login(String id) {
		return map.login(id);
	}

	@Override
	public boolean idCheck(String id) {
		return map.idCheck(id);
	}

}
