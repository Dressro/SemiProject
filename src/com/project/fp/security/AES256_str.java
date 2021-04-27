package com.project.fp.security;

import javax.crypto.*;
import javax.crypto.spec.*;
import Decoder.BASE64Decoder;
import Decoder.BASE64Encoder;

public class AES256_str {
	
	private static String key = "key"; // 대칭키

	// 복호화
	
	public static String Decrypt(String text) throws Exception {

		Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");

		byte[] keyBytes= new byte[16];
	    byte[] b= key.getBytes("UTF-8");
	    int len= b.length;

	    if (len > keyBytes.length) {
	    	len = keyBytes.length;
	    }

	    System.arraycopy(b, 0, keyBytes, 0, len);

	    SecretKeySpec keySpec = new SecretKeySpec(keyBytes, "AES");

	    IvParameterSpec ivSpec = new IvParameterSpec(keyBytes);

	    cipher.init(Cipher.DECRYPT_MODE,keySpec,ivSpec);

	    BASE64Decoder decoder = new BASE64Decoder();
	    byte [] results = cipher.doFinal(decoder.decodeBuffer(text));

	    return new String(results,"UTF-8");
	}

	// 암호화

	public static String Encrypt(String text) throws Exception {

		Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");

		byte[] keyBytes= new byte[16];
	    byte[] b= key.getBytes("UTF-8");
	    int len= b.length;

	    if (len > keyBytes.length) {
	    	len = keyBytes.length;
	    }

	    System.arraycopy(b, 0, keyBytes, 0, len);

	    SecretKeySpec keySpec = new SecretKeySpec(keyBytes, "AES");

	    IvParameterSpec ivSpec = new IvParameterSpec(keyBytes);

	    cipher.init(Cipher.ENCRYPT_MODE,keySpec,ivSpec);

	    byte[] results = cipher.doFinal(text.getBytes("UTF-8"));
	    BASE64Encoder encoder = new BASE64Encoder();

	    return encoder.encode(results);
	   }
}
