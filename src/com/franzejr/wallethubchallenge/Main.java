package com.franzejr.wallethubchallenge;

import java.util.Map;

import com.franzejr.wallethubchallenge.frequentphrases.FrequentPhrases;
import com.franzejr.wallethubchallenge.kcomplementary.KComplementary;
import com.franzejr.wallethubchallenge.palindrome.Palindrome;

public class Main {

	/*
	 * In this main function I will show how to use and test all the three
	 * questions
	 */
	public static void main(String[] args) {
		/*
		 * 
		 * Palindrome Algorithm
		 * 
		 */
        
		String word = "123321";
		System.out.println("====================================");
		System.out.println("Does the "+word+" is palindrome?");
		System.out.println(Palindrome.isPalindrome(word));
		
		
		word = "12332221";
		System.out.println("Does the "+word+" is palindrome?");
		System.out.println(Palindrome.isPalindrome(word));
		System.out.println("====================================");
		
		
		/*
		 * 
		 * K-Complementary Algorithm
		 * 
		 */
		int[] firstSet = { 1, 5, 9, 4 };
		System.out.println("The following array [ 1, 5, 9, 4 ] has how many 10-complementary pairs?");
		int result = KComplementary.howMany(10, firstSet);
		System.out.println("It has "+ result + " pairs");
		System.out.println("====================================");
		
		/*
		 * 
		 * Frequent Phrases in a file
		 * 
		 */
		System.out.println("The File sample.txt");
		Map<String, Integer> frequents = FrequentPhrases.execute("sample.txt", 10000);
		System.out.println(frequents.toString());
		
		
		

	}
}
