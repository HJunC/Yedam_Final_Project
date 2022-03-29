package co.yd.deval.member.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
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
}
