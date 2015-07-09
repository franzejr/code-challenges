package com.franzejr.wallethubchallenge.frequentphrases;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/*
 * There are some important aspects to pay attention
 * The HashMap size needs to be >= number of distinct phrases.
 * 
 * IF HASHMAP_SIZE >= NUMBER OF DISTINCT PHRASES
 * 		we can count that.
 * ELSE
 * 		we cannot count that.
 * 
 */
public class PhraseHashMap implements Map<String, Integer>,
		Comparable<PhraseHashMap> {

	/*
	 * This variable represent the length of my HashMap. In the question it says
	 * the memory is fixed
	 */
	private int MAX = 10000;
	private Map<String, Integer> map;

	public PhraseHashMap() {
		map = new HashMap<String, Integer>();
	}

	/*
	 * In this method we're checking the hashmap size
	 * 
	 * @see java.util.Map#put(java.lang.Object, java.lang.Object)
	 */
	public Integer put(String key, Integer value) {
		if (map.size() >= MAX && !map.containsKey(key)) {
			return -1;
		}
		map.put(key, value);
		return value;
	}

	public void add(String phrase) {
		if (this.containsKey(phrase)) {
			put(phrase, this.get(phrase) + 1);
		} else {
			put(phrase, 1);
		}
	}

	public int size() {
		return map.size();
	}

	public boolean isEmpty() {
		return map.isEmpty();
	}

	public boolean containsKey(Object key) {
		return map.containsKey(key);
	}

	public boolean containsValue(Object value) {
		return map.containsValue(value);
	}

	public Integer get(Object key) {
		return map.get(key);
	}

	public Integer remove(Object key) {
		return map.remove(key);
	}

	public void putAll(Map<? extends String, ? extends Integer> m) {
		map.putAll(m);
	}

	public void clear() {
		map.clear();
	}

	public Set<String> keySet() {
		return map.keySet();
	}

	public Collection<Integer> values() {
		return map.values();
	}

	public Set<java.util.Map.Entry<String, Integer>> entrySet() {
		return map.entrySet();
	}

	@Override
	public String toString() {
		String s = "";

		Iterator it = map.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry pair = (Map.Entry) it.next();
			s += pair.getKey() + " = " + pair.getValue() + "\n";
		}

		return s;
	}

	/*
	 * The comparisons are made by the value
	 * 
	 * @see java.lang.Comparable#compareTo(java.lang.Object)
	 */
	public int compareTo(PhraseHashMap o) {
		if (this.map.get(o) < o.get(o)) {
			return -1;
		}
		if (this.map.get(o) > o.get(o)) {
			return 1;
		}
		return 0;
	}

}
