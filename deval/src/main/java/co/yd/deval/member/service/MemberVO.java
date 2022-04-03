package co.yd.deval.member.service;

import lombok.Getter;

@Getter
public class MemberVO {
	private String memberId;   // 회원아이디
	private String password;   // 회원 비밀번호
	private String mail;       // 회원 이메일
	private String name;       // 회원 이름
	private int exp;           // 회원의 등급 포인트
	private int cashPt;        // 회원이 충전한 캐쉬포인트
	private String resume;     // 회원의 이력서 파일
	private String profileImg; // 회원의 프로필 사진
	private String role;       //유저의 권한
	private String tier;
	
	
	public String tierUp(int exp){
		String tier;
		if(exp >= 10000) {
			tier = "principal";
		} else if(exp >= 5000) {
			tier = "senior";
		} else if(exp >= 1000) {
			tier = "middle";
		} else if(exp >= 100) {
			tier = "junior";
		} else {
			tier = "beginner";
		}
		return tier;
	}
	
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public void setMail(String mail) {
		this.mail = mail;
	}



	public void setName(String name) {
		this.name = name;
	}



	public void setExp(int exp) {
		this.exp = exp;
		this.tier = tierUp(exp);
	}



	public void setCashPt(int cashPt) {
		this.cashPt = cashPt;
	}



	public void setResume(String resume) {
		this.resume = resume;
	}



	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}



	public void setRole(String role) {
		this.role = role;
	}



	public void setTier(String tier) {
		this.tier = tier;
	}
}
