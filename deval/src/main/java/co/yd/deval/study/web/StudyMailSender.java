package co.yd.deval.study.web;

import java.sql.Date;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
    public void sendMailTest(String email,int i,String id, int no,Date sdt, Date edt) throws Exception{
        
        String subject = "[Devaloper Vally] 스터디 신청";
        
        String content = "";
        
        if(i == 0) {
        	content += "<!DOCTYPE html>\r\n"
        			+ "<html lang=\"ko\" xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\r\n"
        			+ "<head>\r\n"
        			+ "  <meta charset=\"utf-8\">\r\n"
        			+ "  <meta name=\"viewport\" content=\"width=device-width,initial-scale=1\">\r\n"
        			+ "  <meta name=\"x-apple-disable-message-reformatting\">\r\n"
        			+ "  <title></title>\r\n"
        			+ "\r\n"
        			+ "  <style>\r\n"
        			+ "    table, td, div, h1, p {\r\n"
        			+ "      font-family: Arial, sans-serif;\r\n"
        			+ "    }\r\n"
        			+ "    @media screen and (max-width: 530px) {\r\n"
        			+ "      .unsub {\r\n"
        			+ "        display: block;\r\n"
        			+ "        padding: 8px;\r\n"
        			+ "        margin-top: 14px;\r\n"
        			+ "        border-radius: 6px;\r\n"
        			+ "        background-color: black;\r\n"
        			+ "        text-decoration: none !important;\r\n"
        			+ "        font-weight: bold;\r\n"
        			+ "      }\r\n"
        			+ "      .col-lge {\r\n"
        			+ "        max-width: 100% !important;\r\n"
        			+ "      }\r\n"
        			+ "    }\r\n"
        			+ "    @media screen and (min-width: 531px) {\r\n"
        			+ "      .col-sml {\r\n"
        			+ "        max-width: 27% !important;\r\n"
        			+ "      }\r\n"
        			+ "      .col-lge {\r\n"
        			+ "        max-width: 73% !important;\r\n"
        			+ "      }\r\n"
        			+ "    }\r\n"
        			+ "  </style>\r\n"
        			+ "</head>\r\n"
        			+ "<body style=\"margin:0;padding:0;word-spacing:normal;background-color:#202125;\">\r\n"
        			+ "  <div role=\"article\" aria-roledescription=\"email\" lang=\"en\" style=\"text-size-adjust:100%;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;background-color:#202125;\">\r\n"
        			+ "    <table role=\"presentation\" style=\"width:100%;border:none;border-spacing:0;\">\r\n"
        			+ "      <tr>\r\n"
        			+ "        <td align=\"center\" style=\"padding:0;\">\r\n"
        			+ "          <table role=\"presentation\" style=\"width:94%;max-width:600px;border:none;border-spacing:0;text-align:left;font-family:Arial,sans-serif;font-size:16px;line-height:22px;color:#363636;\">\r\n"
        			+ "            <tr>\r\n"
        			+ "              <td style=\"padding:40px 30px 30px 30px;text-align:center;font-size:24px;font-weight:bold;\">\r\n"
        			+ "                <a href=\"#\" style=\"text-decoration:none;\"></a>\r\n"
        			+ "              </td>\r\n"
        			+ "            </tr>\r\n"
        			+ "            <tr>\r\n"
        			+ "              <td style=\"padding:30px;background-color:#ffffff;\">\r\n"
        			+ "                <h1 style=\"margin-top:0;margin-bottom:16px;font-size:26px;line-height:32px;font-weight:bold;letter-spacing:-0.02em;\">죄송합니다! </h1>\r\n"
        			+ "                <h1 style=\"margin-top:0;margin-bottom:16px;font-size:26px;line-height:32px;font-weight:bold;letter-spacing:-0.02em;\">신청하신 스터디에 <span style=\"color: #ca000a\">'거절'</span> 되었습니다!</h1>\r\n"
        			+ "                <p style=\"margin:0; border: 1px solid #202125; margin: 10px 0px 20px 0px;\"></p>\r\n"
        			+ "                <p style=\"margin:0;\">안녕하세요 <strong><span style=\"color: #1565C0;\">" 
        			+ id 
        			+ "</span></strong>님 개발자들의 공간 'Developer Vally' 입니다.<br><br> <strong>"+ no +"</strong>번 스터디 신청이 거절되었습니다.<br><br> 지역, 언어, 난이도에 따라서 원하는 스터디를 찾아보세요!<br> 저희 'Developer Vally' 에서는 항상 "+id+" 님을 응원 합니다.</p>\r\n"
        			+ "                \r\n"
        			+ "            </td>\r\n"
        			+ "            </tr>\r\n"
        			+ "            <tr>\r\n"
        			+ "              <td style=\"padding:0;font-size:24px;line-height:28px;font-weight:bold;\">\r\n"
        			+ "                <a href=\"http://www.example.com/\" style=\"text-decoration:none;\"></a>\r\n"
        			+ "              </td>\r\n"
        			+ "            </tr>\r\n"
        			+ "            <tr>\r\n"
        			+ "              <td align=\"center\" style=\"padding:35px 30px 11px 30px;font-size:0;background-color:#ffffff;border-bottom:1px solid #f0f0f5;border-color:rgba(201,201,207,.35);\">\r\n"
        			+ "                <div align=\"center\"class=\"col-lge\" style=\"display:inline-block;width:100%;max-width:395px;vertical-align:top;padding-bottom:20px;font-family:Arial,sans-serif;font-size:16px;line-height:22px;color:#363636;\">\r\n"
        			+ "                  <p style=\"margin:0;\"><a href=\"http://3.35.117.72:8080/deval/\" style=\"background: black; text-decoration: none; padding: 10px 25px; color: #ffffff; border-radius: 2px; display:inline-block;\"><span style=\"font-weight:bold;\">Developer Vally</span></a></p>\r\n"
        			+ "                </div>\r\n"
        			+ "              </td>\r\n"
        			+ "            </tr>\r\n"
        			+ "            \r\n"
        			+ "            <tr>\r\n"
        			+ "              <td style=\"padding:30px;text-align:center;font-size:12px;background-color:#363636; color:#cccccc;\">\r\n"
        			+ "                <p style=\"margin:0 0 8px 0;\"><a href=\"http://www.facebook.com/\" style=\"text-decoration:none;\"><img src=\"https://assets.codepen.io/210284/facebook_1.png\" width=\"40\" height=\"40\" alt=\"f\" style=\"display:inline-block;color:#cccccc;\"></a> <a href=\"http://www.twitter.com/\" style=\"text-decoration:none;\"><img src=\"https://assets.codepen.io/210284/twitter_1.png\" width=\"40\" height=\"40\" alt=\"t\" style=\"display:inline-block;color:#cccccc;\"></a></p>\r\n"
        			+ "                <p style=\"margin:0;font-size:14px;line-height:20px;\">&reg; Developer Vally 2022<br></p>\r\n"
        			+ "              </td>\r\n"
        			+ "            </tr>\r\n"
        			+ "          </table>\r\n"
        			+ "        </td>\r\n"
        			+ "      </tr>\r\n"
        			+ "    </table>\r\n"
        			+ "  </div>\r\n"
        			+ "</body>\r\n"
        			+ "</html>";
        } else {
        	content += "<!DOCTYPE html>\r\n"
        			+ "<html lang=\"ko\" xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\r\n"
        			+ "<head>\r\n"
        			+ "  <meta charset=\"utf-8\">\r\n"
        			+ "  <meta name=\"viewport\" content=\"width=device-width,initial-scale=1\">\r\n"
        			+ "  <meta name=\"x-apple-disable-message-reformatting\">\r\n"
        			+ "  <title></title>\r\n"
        			+ "\r\n"
        			+ "  <style>\r\n"
        			+ "    table, td, div, h1, p {\r\n"
        			+ "      font-family: Arial, sans-serif;\r\n"
        			+ "    }\r\n"
        			+ "    @media screen and (max-width: 530px) {\r\n"
        			+ "      .unsub {\r\n"
        			+ "        display: block;\r\n"
        			+ "        padding: 8px;\r\n"
        			+ "        margin-top: 14px;\r\n"
        			+ "        border-radius: 6px;\r\n"
        			+ "        background-color: black;\r\n"
        			+ "        text-decoration: none !important;\r\n"
        			+ "        font-weight: bold;\r\n"
        			+ "      }\r\n"
        			+ "      .col-lge {\r\n"
        			+ "        max-width: 100% !important;\r\n"
        			+ "      }\r\n"
        			+ "    }\r\n"
        			+ "    @media screen and (min-width: 531px) {\r\n"
        			+ "      .col-sml {\r\n"
        			+ "        max-width: 27% !important;\r\n"
        			+ "      }\r\n"
        			+ "      .col-lge {\r\n"
        			+ "        max-width: 73% !important;\r\n"
        			+ "      }\r\n"
        			+ "    }\r\n"
        			+ "  </style>\r\n"
        			+ "</head>\r\n"
        			+ "<body style=\"margin:0;padding:0;word-spacing:normal;background-color:#202125;\">\r\n"
        			+ "  <div role=\"article\" aria-roledescription=\"email\" lang=\"en\" style=\"text-size-adjust:100%;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;background-color:#202125;\">\r\n"
        			+ "    <table role=\"presentation\" style=\"width:100%;border:none;border-spacing:0;\">\r\n"
        			+ "      <tr>\r\n"
        			+ "        <td align=\"center\" style=\"padding:0;\">\r\n"
        			+ "          <table role=\"presentation\" style=\"width:94%;max-width:600px;border:none;border-spacing:0;text-align:left;font-family:Arial,sans-serif;font-size:16px;line-height:22px;color:#363636;\">\r\n"
        			+ "            <tr>\r\n"
        			+ "              <td style=\"padding:39px 30px 30px 30px;text-align:center;font-size:24px;font-weight:bold;\">\r\n"
        			+ "                <a href=\"#\" style=\"text-decoration:none;\"></a>\r\n"
        			+ "              </td>\r\n"
        			+ "            </tr>\r\n"
        			+ "            <tr>\r\n"
        			+ "              <td style=\"padding:30px;background-color:#ffffff;\">\r\n"
        			+ "                <h1 style=\"margin-top:0;margin-bottom:16px;font-size:26px;line-height:32px;font-weight:bold;letter-spacing:-0.02em;\">축하합니다! </h1>\r\n"
        			+ "                <h1 style=\"margin-top:0;margin-bottom:16px;font-size:26px;line-height:32px;font-weight:bold;letter-spacing:-0.02em;\">스터디에 <span style=\"color: #1565C0;\">'참가'</span> 하였습니다!</h1>\r\n"
        			+ "                <p style=\"margin:0; border: 1px solid #202125; margin: 10px 0px 20px 0px;\"></p>\r\n"
        			+ "                <p style=\"margin:0;\">안녕하세요 <strong><span style=\"color: #1565C0;\">" + id + "</span></strong>님 개발자들의 공간 'Developer Vally' 입니다.<br><br>\r\n"
        			+ "                  <strong>" + no + "</strong>번 스터디의 학습기간은 <strong>" + sdt + " ~ " + edt + "</strong> 입니다.<br><br>\r\n"
        			+ "                  \r\n"
        			+ "                  더 좋은 개발자가 되기 위한 첫 걸음을 내딛어주셔서 감사합니다.<br> 소통과 공유를 통해서 서로 성장할 수 있는 값진 시간이 되길 바랍니다.<br><br>\r\n"
        			+ "                  저희 'Developer Vally' 에서는 항상 "+ id + " 님을 응원 합니다.</p>\r\n"
        			+ "                \r\n"
        			+ "            </td>\r\n"
        			+ "            </tr>\r\n"
        			+ "            \r\n"
        			+ "            <tr>\r\n"
        			+ "              <td align=\"center\" style=\"padding:35px 30px 11px 30px;font-size:0;background-color:#ffffff;border-bottom:1px solid #f0f0f5;border-color:rgba(201,201,207,.35);\">\r\n"
        			+ "                <div align=\"center\"class=\"col-lge\" style=\"display:inline-block;width:100%;max-width:395px;vertical-align:top;padding-bottom:20px;font-family:Arial,sans-serif;font-size:16px;line-height:22px;color:#363636;\">\r\n"
        			+ "                  <p style=\"margin:0;\"><a href=\"http://3.35.117.72:8080/deval/\" style=\"background: black; text-decoration: none; padding: 10px 25px; color: #ffffff; border-radius: 2px; display:inline-block;\"><span style=\"font-weight:bold;\">Developer Vally</span></a></p>\r\n"
        			+ "                </div>\r\n"
        			+ "              </td>\r\n"
        			+ "            </tr>\r\n"
        			+ "            <tr>\r\n"
        			+ "              <td style=\"padding:30px;text-align:center;font-size:12px;background-color:#363636; color:#cccccc;\">\r\n"
        			+ "                <p style=\"margin:0 0 8px 0;\"><a href=\"http://www.facebook.com/\" style=\"text-decoration:none;\"><img src=\"https://assets.codepen.io/210284/facebook_1.png\" width=\"40\" height=\"40\" alt=\"f\" style=\"display:inline-block;color:#cccccc;\"></a> <a href=\"http://www.twitter.com/\" style=\"text-decoration:none;\"><img src=\"https://assets.codepen.io/210284/twitter_1.png\" width=\"40\" height=\"40\" alt=\"t\" style=\"display:inline-block;color:#cccccc;\"></a></p>\r\n"
        			+ "                <p style=\"margin:0;font-size:14px;line-height:20px;\">&reg; Developer Vally 2022<br></p>\r\n"
        			+ "              </td>\r\n"
        			+ "            </tr>\r\n"
        			+ "          </table>\r\n"
        			+ "        </td>\r\n"
        			+ "      </tr>\r\n"
        			+ "    </table>\r\n"
        			+ "  </div>\r\n"
        			+ "</body>\r\n"
        			+ "</html>";
        }
        
        String from = "devalkims@gmail.com";
       
        String to = email; 
        
        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
            //MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8"); //단순히 텍스트만
           
           
            
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
