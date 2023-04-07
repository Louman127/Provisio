package ehotel;

import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Hash {
	public static byte[] getSHA(String input) throws NoSuchAlgorithmException {

		MessageDigest md = MessageDigest.getInstance("SHA-256");

		return md.digest(input.getBytes(StandardCharsets.UTF_8));
	}

	public static String toHexString(byte[] hash) {

		BigInteger number = new BigInteger(1, hash);

		StringBuilder hexString = new StringBuilder(number.toString(16));

		while (hexString.length() < 64) {
			hexString.insert(0, '0');
		}

		return hexString.toString();
	}

	public static String generate(String input) {
		try {
			input = toHexString(getSHA(input));
		} catch (NoSuchAlgorithmException e) {
			System.out.println("Exception thrown for incorrect algorithm: " + e);
		}

		return input;
	}

	// test
	public static void main(String args[]) {

		String s1 = "Barbarosa";
		System.out.println(generate(s1));
	}
}