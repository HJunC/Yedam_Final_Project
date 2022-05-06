package co.yd.deval.member.service;

public interface LoginService {
	LoginVO login(String id);
	boolean idCheck(String id);
}
