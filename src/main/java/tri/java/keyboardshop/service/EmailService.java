package tri.java.keyboardshop.service;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class EmailService {

    private final JavaMailSender mailSender;

    public EmailService(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    public void sendVerificationEmail(String to, String verificationCode, String purpose) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true);

        helper.setTo(to);
        if ("registration".equals(purpose)) {
            helper.setSubject("Xác nhận đăng ký tài khoản - Keyboardshop");
            helper.setText(
                    "<h3>Xác nhận đăng ký tài khoản</h3>" +
                            "<p>Vui lòng nhập mã xác nhận sau để hoàn tất đăng ký:</p>" +
                            "<h2>" + verificationCode + "</h2>" +
                            "<p>Nếu bạn không yêu cầu đăng ký, vui lòng bỏ qua email này.</p>",
                    true
            );
        } else if ("forgot-password".equals(purpose)) {
            helper.setSubject("Password Reset Verification - Keyboardshop");
            helper.setText(
                    "<h3>Password Reset Verification</h3>" +
                            "<p>Please use the following verification code to reset your password:</p>" +
                            "<h2>" + verificationCode + "</h2>" +
                            "<p>If you did not request this, please ignore this email.</p>",
                    true
            );
        }

        mailSender.send(message);
    }
}