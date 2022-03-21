package co.yd.deval.member.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {
	private String memberId;       // 회원아이디
	private String memberPassword; // 회원 비밀번호
	private String memberPhone;    // 회원 전화번호
	private String memberMail;     // 회원 이메일
	private String memberName;     // 회원 이름
	private int memberExp;         // 회원의 등급 포인트
	private int memberCash;        // 회원이 충전한 캐쉬포인트
	private String memberResume;   // 회원의 이력서 파일
	private String memberPhoto;    // 회원의 프로필 사진
}
