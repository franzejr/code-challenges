package com.franzejr.wallethubchallenge.palindrome;

public class Palindrome {

	/*
	 * Recursive function to check if a word is palindrome.
	 * 
	 * Complexity: O(n)
	 * 
	 * @param word String - any String
	 * 
	 * @return boolean saying if the word is palindrome or not
	 */
	public static boolean isPalindromeRecursive(String word) {
		if (word.length() == 0 || word.length() == 1)
			return true;
		if (word.charAt(0) == word.charAt(word.length() - 1))
			return isPalindromeRecursive(word.substring(1, word.length() - 1));
		return false;
	}

	/*
	 * Iterative function to check if a word is palindrome.
	 * 
	 * Complexity: O(n)
	 * 
	 * @param word String - any string
	 * 
	 * @return boolean saying if the word is palindrome or not
	 */
	public static boolean isPalindrome(String word) {
		int length = word.length();

		for (int i = 0; i < length / 2; i++) {
			if (word.charAt(i) != word.charAt(length - 1 - i)) {
				return false;
			}
		}

		return true;
	}
}
