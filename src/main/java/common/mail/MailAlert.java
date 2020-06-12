package common.mail;

public class MailAlert {
		
	public String mailAlert (String email) {
		
		int num = email.indexOf("@");
		String star="";
		for(int i =0;i<num/2;i++) {
			star +="*";
		}
		String newemail=email.substring(0,num/2)+star+email.substring(num,email.length());
		
		return newemail;
	}
		
}
