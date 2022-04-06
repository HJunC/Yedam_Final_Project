package co.yd.deval.project;

import javax.mail.internet.MimeMessage;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class StudyMailTest {
	
	 @Autowired
	    JavaMailSenderImpl mailSender;
	    
	    // MimeMessage 객체를 직접 생성하여 메일을 발송하는 방법
	    @Test
	    public void mailSendTest() throws Exception{
	        
	        /* 구현자: 김도연
	         * 계정 정보 
	         * -gmail
				아이디 : DevalKims@gmail.com
				비번 : dPekachlwhd!@
	         * */
	        String subject = "스터디 메일 전송 테스트";
	        String content = "메일내용을 테스트 합니다. 테스트 성공 기원";
	        String from = "devalkims@gmail.com";
	        String to = "impact9604@naver.com";
	        
	        try {
	            MimeMessage mail = mailSender.createMimeMessage();
	            MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");
	            
	            mailHelper.setFrom(from);
	            mailHelper.setTo(to);
	            mailHelper.setSubject(subject);
	            mailHelper.setText(content, true);
	                  
	            
	            mailSender.send(mail);
	            
	        } catch(Exception e) {
	            e.printStackTrace();
	        }
	        
	    }

}
