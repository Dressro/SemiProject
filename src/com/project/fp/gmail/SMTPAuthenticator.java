package com.project.fp.gmail;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator {
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("ejsdnlcl@gmail.com", "!1qaz@2wsx");
	}
}