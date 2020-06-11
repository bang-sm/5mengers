package common.mail;

public class mail {
	
	public static void main(String[] args) {
		
		String email = "atcgsp912@kakao.com";
		
		// @ 앞 3글자 뺴고 모두 *** 표시 @부터는 그대로 표시
		
		
		int num = email.indexOf("@");
		String star="";
		for(int i =0;i<num/2;i++) {
			star +="*";
		}
		String newemail=email.substring(0,num/2)+star+email.substring(num,email.length());
			
		System.out.println(newemail);
	}
	
	


	
}
