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
	        String content = "<!DOCTYPE html>\r\n"
	        		+ "<html lang=\"en\" xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\r\n"
	        		+ "<head>\r\n"
	        		+ "  <meta charset=\"utf-8\">\r\n"
	        		+ "  <meta name=\"viewport\" content=\"width=device-width,initial-scale=1\">\r\n"
	        		+ "  <meta name=\"x-apple-disable-message-reformatting\">\r\n"
	        		+ "  <title></title>\r\n"
	        		+ "  <!--[if mso]>\r\n"
	        		+ "  <style>\r\n"
	        		+ "    table {border-collapse:collapse;border-spacing:0;border:none;margin:0;}\r\n"
	        		+ "    div, td {padding:0;}\r\n"
	        		+ "    div {margin:0 !important;}\r\n"
	        		+ "  </style>\r\n"
	        		+ "  <noscript>\r\n"
	        		+ "    <xml>\r\n"
	        		+ "      <o:OfficeDocumentSettings>\r\n"
	        		+ "        <o:PixelsPerInch>96</o:PixelsPerInch>\r\n"
	        		+ "      </o:OfficeDocumentSettings>\r\n"
	        		+ "    </xml>\r\n"
	        		+ "  </noscript>\r\n"
	        		+ "  <![endif]-->\r\n"
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
	        		+ "        background-color: #555555;\r\n"
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
	        		+ "<body style=\"margin:0;padding:0;word-spacing:normal;background-color:#939297;\">\r\n"
	        		+ "  <div role=\"article\" aria-roledescription=\"email\" lang=\"en\" style=\"text-size-adjust:100%;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;background-color:#939297;\">\r\n"
	        		+ "    <table role=\"presentation\" style=\"width:100%;border:none;border-spacing:0;\">\r\n"
	        		+ "      <tr>\r\n"
	        		+ "        <td align=\"center\" style=\"padding:0;\">\r\n"
	        		+ "          <!--[if mso]>\r\n"
	        		+ "          <table role=\"presentation\" align=\"center\" style=\"width:600px;\">\r\n"
	        		+ "          <tr>\r\n"
	        		+ "          <td>\r\n"
	        		+ "          <![endif]-->\r\n"
	        		+ "          <table role=\"presentation\" style=\"width:94%;max-width:600px;border:none;border-spacing:0;text-align:left;font-family:Arial,sans-serif;font-size:16px;line-height:22px;color:#363636;\">\r\n"
	        		+ "            <tr>\r\n"
	        		+ "              <td style=\"padding:40px 30px 30px 30px;text-align:center;font-size:24px;font-weight:bold;\">\r\n"
	        		+ "                <a href=\"http://www.example.com/\" style=\"text-decoration:none;\"><img src=\"https://assets.codepen.io/210284/logo.png\" width=\"165\" alt=\"Logo\" style=\"width:165px;max-width:80%;height:auto;border:none;text-decoration:none;color:#ffffff;\"></a>\r\n"
	        		+ "              </td>\r\n"
	        		+ "            </tr>\r\n"
	        		+ "            <tr>\r\n"
	        		+ "              <td style=\"padding:30px;background-color:#ffffff;\">\r\n"
	        		+ "                <h1 style=\"margin-top:0;margin-bottom:16px;font-size:26px;line-height:32px;font-weight:bold;letter-spacing:-0.02em;\">Welcome to our responsive email!</h1>\r\n"
	        		+ "                <p style=\"margin:0;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tempus adipiscing felis, sit amet blandit ipsum volutpat sed. Morbi porttitor, <a href=\"http://www.example.com/\" style=\"color:#e50d70;text-decoration:underline;\">eget accumsan dictum</a>, nisi libero ultricies ipsum, in posuere mauris neque at erat.</p>\r\n"
	        		+ "              </td>\r\n"
	        		+ "            </tr>\r\n"
	        		+ "            <tr>\r\n"
	        		+ "              <td style=\"padding:0;font-size:24px;line-height:28px;font-weight:bold;\">\r\n"
	        		+ "                <a href=\"http://www.example.com/\" style=\"text-decoration:none;\"><img src=\"https://assets.codepen.io/210284/1200x800-2.png\" width=\"600\" alt=\"\" style=\"width:100%;height:auto;display:block;border:none;text-decoration:none;color:#363636;\"></a>\r\n"
	        		+ "              </td>\r\n"
	        		+ "            </tr>\r\n"
	        		+ "            <tr>\r\n"
	        		+ "              <td style=\"padding:35px 30px 11px 30px;font-size:0;background-color:#ffffff;border-bottom:1px solid #f0f0f5;border-color:rgba(201,201,207,.35);\">\r\n"
	        		+ "                <!--[if mso]>\r\n"
	        		+ "                <table role=\"presentation\" width=\"100%\">\r\n"
	        		+ "                <tr>\r\n"
	        		+ "                <td style=\"width:145px;\" align=\"left\" valign=\"top\">\r\n"
	        		+ "                <![endif]-->\r\n"
	        		+ "                <div class=\"col-sml\" style=\"display:inline-block;width:100%;max-width:145px;vertical-align:top;text-align:left;font-family:Arial,sans-serif;font-size:14px;color:#363636;\">\r\n"
	        		+ "                  <img src=\"https://assets.codepen.io/210284/icon.png\" width=\"115\" alt=\"\" style=\"width:115px;max-width:80%;margin-bottom:20px;\">\r\n"
	        		+ "                </div>\r\n"
	        		+ "                <!--[if mso]>\r\n"
	        		+ "                </td>\r\n"
	        		+ "                <td style=\"width:395px;padding-bottom:20px;\" valign=\"top\">\r\n"
	        		+ "                <![endif]-->\r\n"
	        		+ "                <div class=\"col-lge\" style=\"display:inline-block;width:100%;max-width:395px;vertical-align:top;padding-bottom:20px;font-family:Arial,sans-serif;font-size:16px;line-height:22px;color:#363636;\">\r\n"
	        		+ "                  <p style=\"margin-top:0;margin-bottom:12px;\">Nullam mollis sapien vel cursus fermentum. Integer porttitor augue id ligula facilisis pharetra. In eu ex et elit ultricies ornare nec ac ex. Mauris sapien massa, placerat non venenatis et, tincidunt eget leo.</p>\r\n"
	        		+ "                  <p style=\"margin-top:0;margin-bottom:18px;\">Nam non ante risus. Vestibulum vitae eleifend nisl, quis vehicula justo. Integer viverra efficitur pharetra. Nullam eget erat nibh.</p>\r\n"
	        		+ "                  <p style=\"margin:0;\"><a href=\"https://example.com/\" style=\"background: #ff3884; text-decoration: none; padding: 10px 25px; color: #ffffff; border-radius: 4px; display:inline-block; mso-padding-alt:0;text-underline-color:#ff3884\"><!--[if mso]><i style=\"letter-spacing: 25px;mso-font-width:-100%;mso-text-raise:20pt\">&nbsp;</i><![endif]--><span style=\"mso-text-raise:10pt;font-weight:bold;\">Claim yours now</span><!--[if mso]><i style=\"letter-spacing: 25px;mso-font-width:-100%\">&nbsp;</i><![endif]--></a></p>\r\n"
	        		+ "                </div>\r\n"
	        		+ "                <!--[if mso]>\r\n"
	        		+ "                </td>\r\n"
	        		+ "                </tr>\r\n"
	        		+ "                </table>\r\n"
	        		+ "                <![endif]-->\r\n"
	        		+ "              </td>\r\n"
	        		+ "            </tr>\r\n"
	        		+ "            <tr>\r\n"
	        		+ "              <td style=\"padding:30px;font-size:24px;line-height:28px;font-weight:bold;background-color:#ffffff;border-bottom:1px solid #f0f0f5;border-color:rgba(201,201,207,.35);\">\r\n"
	        		+ "                <a href=\"http://www.example.com/\" style=\"text-decoration:none;\"><img src=\"https://assets.codepen.io/210284/1200x800-1.png\" width=\"540\" alt=\"\" style=\"width:100%;height:auto;border:none;text-decoration:none;color:#363636;\"></a>\r\n"
	        		+ "              </td>\r\n"
	        		+ "            </tr>\r\n"
	        		+ "            <tr>\r\n"
	        		+ "              <td style=\"padding:30px;background-color:#ffffff;\">\r\n"
	        		+ "                <p style=\"margin:0;\">Duis sit amet accumsan nibh, varius tincidunt lectus. Quisque commodo, nulla ac feugiat cursus, arcu orci condimentum tellus, vel placerat libero sapien et libero. Suspendisse auctor vel orci nec finibus.</p>\r\n"
	        		+ "              </td>\r\n"
	        		+ "            </tr>\r\n"
	        		+ "            <tr>\r\n"
	        		+ "              <td style=\"padding:30px;text-align:center;font-size:12px;background-color:#404040;color:#cccccc;\">\r\n"
	        		+ "                <p style=\"margin:0 0 8px 0;\"><a href=\"http://www.facebook.com/\" style=\"text-decoration:none;\"><img src=\"https://assets.codepen.io/210284/facebook_1.png\" width=\"40\" height=\"40\" alt=\"f\" style=\"display:inline-block;color:#cccccc;\"></a> <a href=\"http://www.twitter.com/\" style=\"text-decoration:none;\"><img src=\"https://assets.codepen.io/210284/twitter_1.png\" width=\"40\" height=\"40\" alt=\"t\" style=\"display:inline-block;color:#cccccc;\"></a></p>\r\n"
	        		+ "                <p style=\"margin:0;font-size:14px;line-height:20px;\">&reg; Someone, Somewhere 2021<br><a class=\"unsub\" href=\"http://www.example.com/\" style=\"color:#cccccc;text-decoration:underline;\">Unsubscribe instantly</a></p>\r\n"
	        		+ "              </td>\r\n"
	        		+ "            </tr>\r\n"
	        		+ "          </table>\r\n"
	        		+ "          <!--[if mso]>\r\n"
	        		+ "          </td>\r\n"
	        		+ "          </tr>\r\n"
	        		+ "          </table>\r\n"
	        		+ "          <![endif]-->\r\n"
	        		+ "        </td>\r\n"
	        		+ "      </tr>\r\n"
	        		+ "    </table>\r\n"
	        		+ "  </div>\r\n"
	        		+ "</body>\r\n"
	        		+ "</html>";
	        String from = "devalkims@gmail.com";
	        String to = "kimyedamdeval01@gmail.com";
	        
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
