package com.project.fp.sms;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.net.http.HttpHeaders;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
//import java.util.Base64;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.apache.tomcat.util.codec.binary.Base64;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;


public class SMS {

	public static void sendSMS(String phonenumber, String content) throws UnsupportedEncodingException {
		String hostNameUrl = "https://sens.apigw.ntruss.com";
		String requestUrl = "/sms/v2/services/";
		String requestUrlType = "/messages";
		String accessKey = "MgnNQBLZWYDmVIWB9A86";
		String secretKey = "bukxizrgBdgLY4Gs6qIynKtLnqOeLjfCrNoS9Lh5";
		String serviceId = "ncp:sms:kr:266284043003:semiproject";
		String timestamp = Long.toString(System.currentTimeMillis());
		requestUrl += serviceId + requestUrlType;
		String apiUrl = hostNameUrl + requestUrl;
		
		JsonObject bodyJson = new JsonObject();
		JsonObject toJson = new JsonObject();
		JsonArray Jsarr = new JsonArray();
			    
		toJson.addProperty("subject", "test");			// 메시지 제목 (적용안됨/lms만 적용)
		toJson.addProperty("content", content);  		// 메시지 내용	(실제내용)
		toJson.addProperty("to", phonenumber);			// 수신번호
		Jsarr.add(toJson);	
		
		bodyJson.addProperty("type", "SMS");			// 메시지 type sms/lms
		bodyJson.addProperty("countryCode", "82");		// 국가 전화번호
		bodyJson.addProperty("contentType", "COMM");	// 메시지 내용 type ad/comm
		bodyJson.addProperty("from", "01064244977");	// 발신번호 (사전에 인증/등록된 번호만 사용가능)
		bodyJson.addProperty("subject", "test");		// 메시지 제목(적용안됨/lms만 적용)
		bodyJson.addProperty("content", "test2");		// 메시지 내용
		bodyJson.add("messages", Jsarr);
		
		String body = bodyJson.toString();
		
		System.out.println(body);
		System.out.println(requestUrl);
		System.out.println(apiUrl);
		
		try {	
			URL url = new URL(apiUrl);
			HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
			
			urlConnection.setRequestMethod("POST");	

			urlConnection.setRequestProperty("Content-Type", "application/json");
			urlConnection.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
			urlConnection.setRequestProperty("x-ncp-iam-access-key", accessKey);
			urlConnection.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl, timestamp, accessKey, secretKey));
			urlConnection.setDoInput(true);
			urlConnection.setUseCaches(false);
			urlConnection.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(urlConnection.getOutputStream());
			
			wr.write(body.getBytes());
			wr.flush();
			wr.close();
			
			int responseCode = urlConnection.getResponseCode();
			BufferedReader br;
			System.out.println("responseCode" + " " + responseCode);
			System.out.println("responsemessage : " + urlConnection.getResponseMessage());
			if(responseCode==202) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));	
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			}
			
			String inputLine;
			StringBuffer response = new StringBuffer();
			while((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			
			System.out.println(response.toString());
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
	
	public static String makeSignature(String url, String timestamp, String accessKey, String secretKey) throws UnsupportedEncodingException, NoSuchAlgorithmException, InvalidKeyException {
		String space = " ";					// one space
		String newLine = "\n";				// new line
		String method = "POST";
		
		String message = new StringBuilder()
			.append(method)
			.append(space)
			.append(url)
			.append(newLine)
			.append(timestamp)
			.append(newLine)
			.append(accessKey)
			.toString();

		SecretKeySpec signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256"); 
		Mac mac = Mac.getInstance("HmacSHA256"); 
		mac.init(signingKey); 
		
		byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8")); 
		String encodeBase64String = Base64.encodeBase64String(rawHmac);
		
	  return encodeBase64String;
	}
	
}
