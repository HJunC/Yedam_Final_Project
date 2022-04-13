package co.yd.deval.study.web;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.yd.deval.member.service.MemberVO;

/* 구현자: 김도연
 * 계정 정보 
 * - gmail
	아이디 : DevalKims@gmail.com
	비번 : dPekachlwhd!@
 * */

@Controller
public class StudyMailSender {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value = "/sendMail", method = RequestMethod.GET)
    public void sendMailTest(String email) throws Exception{
        
        String subject = "[Devaloper Vally] 스터디 신청";
        
        String content = "<div align='center' style='border:1px solid black; font-family:verdana'>";
        content += "<h3 style='color: blue;'>";
        content += "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
        content += "<p>임시 비밀번호 : ";
        content += "</p></div>";
        	  	  
        String from = "devalkims@gmail.com";
       
        String to = email; 
        
        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8"); //단순히 텍스트만
           
           
            
            /*
             * 이미지 등 멀티로 사용시엔 아래의 코드 사용 
             * MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
             *true는 멀티파트 메세지를 사용하겠다는 의미
             */
            
            mailHelper.setFrom(from);
            // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
            // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
            //mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(content, true);
            // true는 html을 사용하겠다는 의미입니다.
             
            /*
             * 단순한 텍스트만 사용하신다면 다음의 코드를 사용하셔도 됩니다. mailHelper.setText(content);
             */
            
            mailSender.send(mail);
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
    }

	
	

}
