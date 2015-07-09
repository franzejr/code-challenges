package com.franzejr.wallethubchallenge.frequentphrases;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

/*
 * Frequent Phrases
 */
public class FrequentPhrases {

	/*
	 * This function reads from a file. The file needs to follow the pattern:
	 * 
	 * <WORD> | <WORD> | <WORD>
	 * 
	 * The file has 50 phrases per line separated by a pipe (|). Assume that the
	 * phrases do not contain pipe. Each of <WORD> will be ranked and as return,
	 * we will have a hashmap with each phrase and the number of times it
	 * appears in the entire file.
	 * 
	 * @param String file name
	 * 
	 * @param int memory Size - how much our memory can fit
	 * 
	 * @return @HashMap which contains the phrases ranked
	 */
	public static Map<String, Integer> execute(String textFileName, int memorySize) {
		PhraseHashMap frequents = new PhraseHashMap(memorySize);
		FileInputStream fstream;
		try {
			fstream = new FileInputStream(textFileName);
			BufferedReader br = new BufferedReader(new InputStreamReader(
					fstream));

			String strLine;

			while ((strLine = br.readLine()) != null) {
				String[] phrases = strLine.split("\\|");
				for (int i = 0; i < phrases.length; i++) {
					frequents.add(phrases[i]);
				}
			}

			br.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return sortByValues(frequents);
	}

	public static <K extends Comparable, V extends Comparable> Map<K, V> sortByValues(
			Map<K, V> map) {
		List<Map.Entry<K, V>> entries = new LinkedList<Map.Entry<K, V>>(
				map.entrySet());

		Collections.sort(entries, new Comparator<Map.Entry<K, V>>() {

			public int compare(Entry<K, V> o1, Entry<K, V> o2) {
				return o1.getValue().compareTo(o2.getValue());
			}

		});

		Map<K, V> sortedMap = new LinkedHashMap<K, V>();

		for (Map.Entry<K, V> entry : entries) {
			sortedMap.put(entry.getKey(), entry.getValue());
		}

		return sortedMap;

	}

}
