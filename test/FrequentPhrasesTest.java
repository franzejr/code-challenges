
import static org.junit.Assert.assertEquals;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.franzejr.wallethubchallenge.frequentphrases.FrequentPhrases;

public class FrequentPhrasesTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test() {
			FrequentPhrases frequentPhrases = new FrequentPhrases("sample.txt", 9);
			Map<String, Integer> result = frequentPhrases.execute();
			System.out.println(result.toString());
			System.out.println(frequentPhrases.toString());
	}
	
	
	@Test
	public void testSortByValue(){
		HashMap<String, Integer> hashMap = new HashMap<String, Integer>();
		hashMap.put("A", 4);
		hashMap.put("B", 3);
		hashMap.put("C", 2);
		
		
		HashMap<String, Integer> sorted = (HashMap<String, Integer>) FrequentPhrases.sortByValues(hashMap, 9);
		
		System.out.println(sorted.toString());
		
		Entry<String, Integer> entry = sorted.entrySet().iterator().next();
		assertEquals((int)entry.getValue(), 2);
	}

}
