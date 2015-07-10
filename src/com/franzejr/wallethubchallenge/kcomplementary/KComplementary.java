package com.franzejr.wallethubchallenge.kcomplementary;

import java.util.HashMap;
import java.util.Map;

public class KComplementary {

	private int k;
	private int[] A;

	public KComplementary(int k, int[] A){
		this.k = k;
		this.A = A;
	}

	/*
	 * An efficient algorithm to find K-complementary pairs in a given array of
	 * integers. Given Array A, pair (i, j) is K-complementary if K = A[i] +
	 * A[j]
	 * 
	 * I'm assuming that i could be equal to j.
	 * 
	 * Complexity: O(n)
	 * 
	 * @param k - sum to an array
	 * 
	 * @param int[] - Given Array
	 * 
	 * @result int number of pairs
	 */
	public int howMany() {
		Map<Long, Integer> complementedMap = new HashMap<Long, Integer>();
		for (int i = 0; i < A.length; i++) {
			final long complementedlValue = ((long) k) - A[i];
			final int tempValue = complementedMap
					.containsKey(complementedlValue) ? complementedMap
					.get(complementedlValue) : 0;
			complementedMap.put(complementedlValue, tempValue + 1);
		}

		int counter = 0;
		for (int i = 0; i < A.length; i++) {
			final long value = A[i];
			counter += complementedMap.containsKey(value) ? complementedMap
					.get(value) : 0;
		}

		return counter;
	}
}
