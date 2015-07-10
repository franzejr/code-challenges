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
		
		System.out.println("WalletHub Code Challenge");
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
		KComplementary kComplementary = new KComplementary(10, firstSet);
		int result = kComplementary.howMany();
		System.out.println("It has "+ result + " pairs");
		System.out.println("====================================");
		
		/*
		 * 
		 * Frequent Phrases in a file
		 * 
		 */
		System.out.println("The File sample.txt has the following phrases");
		FrequentPhrases frequents = new FrequentPhrases("textfile.txt", 10000);
		Map<String, Integer> topRankedPhrases = frequents.execute();
		System.out.println(frequents.toString());


	}
}
