package com.franzejr.wallethubchallenge.frequentphrases;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class FrequentPhrases implements Map<String, Integer> {

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
		// TODO Auto-generated method stub
		return false;
	}

	public Integer get(Object key) {
		// TODO Auto-generated method stub
		return null;
	}

	public Integer remove(Object key) {
		// TODO Auto-generated method stub
		return null;
	}

	public void putAll(Map<? extends String, ? extends Integer> m) {
		// TODO Auto-generated method stub

	}

	public void clear() {
		map.clear();
	}

	public Set<String> keySet() {
		// TODO Auto-generated method stub
		return null;
	}

	public Collection<Integer> values() {
		// TODO Auto-generated method stub
		return null;
	}

	public Set<java.util.Map.Entry<String, Integer>> entrySet() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public String toString() {
		String s = "";
		
		 Iterator it = map.entrySet().iterator();
		    while (it.hasNext()) {
		        Map.Entry pair = (Map.Entry)it.next();
		        s += pair.getKey() + " = " + pair.getValue();
		    }
		
		return s;
	}

}
