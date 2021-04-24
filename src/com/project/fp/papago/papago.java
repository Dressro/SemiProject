package com.project.fp.papago;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class papago {

	public static String getTransSentence(String s, String source, String target){
		 
        String clientId = "6dne8tmfd0QioPsBLYja";//애플리케이션 클라이언트 아이디값
        String clientSecret = "SDJSF7eurA";//애플리케이션 클라이언트 시크릿값
        String transresult = null;
        try {
           String text = URLEncoder.encode(s, "UTF-8");
           String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
           URL url = new URL(apiURL);
           HttpURLConnection con = (HttpURLConnection)url.openConnection();
           con.setRequestMethod("POST");
           con.setRequestProperty("X-Naver-Client-Id", clientId);
           con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
           
           // post request
           String postParams = transmenu(source, target) + text;
           con.setDoOutput(true);
           DataOutputStream wr = new DataOutputStream(con.getOutputStream());
           wr.writeBytes(postParams);
           wr.flush();
           wr.close();
           int responseCode = con.getResponseCode();
           BufferedReader br;
           if(responseCode==200) { // 정상 호출
               br = new BufferedReader(new InputStreamReader(con.getInputStream()));
           } else {  // 에러 발생
               br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
           }
           String inputLine;
           StringBuffer response = new StringBuffer();
           while ((inputLine = br.readLine()) != null) {
               response.append(inputLine);
           }
           br.close(); 
           
           int start = response.indexOf("translatedText") + 17;
           int end = response.indexOf("engineType") - 3;
           transresult = response.substring(start, end);
       } catch (Exception e) {
           System.out.println(e);
       }
        return transresult;
    }
	
	public static String transmenu(String source, String target) {
		String result = "source=" + source + "&target=" + target + "&text=";
		return result;
	}
	
}
