package com.franzejr.wallethubchallenge.frequentphrases;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/*
 * There are some important aspects to pay attention
 * The HashMap size needs to be >= number of distinct phrases
 */
public class FrequentPhrases implements Map<String, Integer>, Comparable<FrequentPhrases> {

	private int MAX = 10000;
	private Map<String, Integer> map;

	public FrequentPhrases() {
		map = new HashMap<String, Integer>();
	}

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
		}else{
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

	public int compareTo(FrequentPhrases o) {
		if(this.map.get(o) < o.get(o)){
			return -1;
		}
		if(this.map.get(o) > o.get(o)){
			return 1;
		}
		return 0;
	}

}
