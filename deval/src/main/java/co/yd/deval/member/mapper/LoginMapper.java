package co.yd.deval.member.mapper;

import co.yd.deval.member.service.LoginVO;

public interface LoginMapper {
	LoginVO login(String id);
	boolean idCheck(String id);
}
