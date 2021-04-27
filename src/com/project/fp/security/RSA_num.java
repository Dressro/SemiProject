package com.project.fp.security;

import java.math.BigInteger;

public class RSA_num {

	private static int p = 107;
	private static int q = 109;
	private static int n = p*q;
	private static int oil_n = (p-1)*(q-1);
	private static int e = primarykey();
	private static int d = publickey();
	
	// 암호화
	
	public static int encryption(int plain) {
		BigInteger result = pow(plain, e);
		result = result.remainder(BigInteger.valueOf(n));
		int res = result.intValue();
		return res;
	}
	
	// 복호화
	
	public static int decryption(int encryption) {
		BigInteger result = pow(encryption, d);
		result = result.remainder(BigInteger.valueOf(n));
		int res = result.intValue();
		return res;
	}
	
	// 개인키 생성
	
	private static int primarykey() {
		int result = 1;
		for (int i = 2; i < n; i++) {
			if (gcd(i, oil_n) == 1) {
				result = i;
				return result;
			}
		}
		return 0;
	}
	
	// 공개키 생성
	
	private static int publickey() {
		int result = 1;
		for (int i = 1; i < oil_n; i++) {
			if(((e*i) % oil_n) == 1) {
				result = i;
				return result;
			}
		}
		return 0;
	}
	
	private static int gcd(int a, int b) {
		while (b != 0) {
			int temp = a % b;
			a = b;
			b = temp;
	    }
	    return Math.abs(a);
	}
	private static BigInteger pow(int a, int b) {
		BigInteger x = BigInteger.valueOf(a);
		BigInteger res = BigInteger.valueOf(1);
		for (int i = 0; i < b; i++) {
			res = res.multiply(x);
		}
		return res;
	}
	
	public static boolean isPrime(int num){
        if(num < 2) return false;
        for(int i=2; i*i<=num; i++){
            if(num % i == 0) return false;            
        }
        return true;
    }
	
}
