package com.project.fp.sms;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;
import org.json.simple.JSONObject;

public class SMS {

	public static void sendSMS(String phonenumber) {
		String hostNameUrl = "https://sens.apigw.ntruss.com";
		String requestUrl = "/sms/v2/services/";
		String requestUrlType = "/messages";
		String accessKey = "MgnNQBLZWYDmVIWB9A86";
		String secretKey = "bukxizrgBdgLY4Gs6qIynKtLnqOeLjfCrNoS9Lh5";
		String serviceId = "ncp:sms:kr:266284043003:semiproject";
		String method = "GET";
		String timestamp = Long.toString(System.currentTimeMillis());
		requestUrl += serviceId + requestUrlType;
		String apiUrl = hostNameUrl + requestUrl;
		
		JSONObject bodyJson = new JSONObject();
		JSONObject toJson = new JSONObject();
		
		toJson.put("to", phonenumber);		    // 수신번호
		toJson.put("content", "test1234");		// 메시지 내용
		
		bodyJson.put("type", "sms");			// 메시지 type sms/lms
		bodyJson.put("contentType", "COMM"); 	// 메시지 내용 type ad/comm
		bodyJson.put("countryCode", "82");  	// 국가 전화번호
		bodyJson.put("from", "01064244977");	// 발신번호 (사전에 인증/등록된 번호만 사용가능)
		bodyJson.put("content", "test123");		// 메시지 내용(실제내용)
		bodyJson.put("messages", toJson);
		
		String body = bodyJson.toJSONString();
		
		System.out.println("body");
		String auth = "rhkgkrwk1002@naver.com:951002";
		
		try {
			
			URL url = new URL(apiUrl);
			
			HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();

			byte[] authEncBytes = Base64.encodeBase64(auth.getBytes());
			String authStringEnc = new String(authEncBytes);
				 
			urlConnection.setUseCaches(false);
			urlConnection.setDoOutput(true);
			urlConnection.setDoInput(true);
			urlConnection.setRequestProperty("Authorization", "Basic " + authStringEnc);
			urlConnection.setRequestProperty("content-type", "application/json");
			urlConnection.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
			urlConnection.setRequestProperty("x-ncp-iam-access-key", accessKey);
			urlConnection.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
			urlConnection.setRequestMethod(method);
			urlConnection.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(urlConnection.getOutputStream());
			
			wr.write(body.getBytes());
			wr.flush();
			wr.close();
			
			int responseCode = urlConnection.getResponseCode();
			BufferedReader br;
			System.out.println("responseCode" + " " + responseCode);
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
	
	public static String makeSignature(String url, String timestamp, String method, String accessKey, String secretKey) throws NoSuchAlgorithmException, InvalidKeyException, UnsupportedEncodingException {
		String space = " ";					// one space
		String newLine = "\n";				// new line

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
