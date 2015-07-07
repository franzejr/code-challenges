import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.franzejr.wallethubchallenge.frequentphrases.FrequentPhrases;
import com.franzejr.wallethubchallenge.frequentphrases.MapSort;

public class FrequentPhrasesTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test() {
		try {
			algorithm();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void algorithm() throws IOException {
		FrequentPhrases frequents = new FrequentPhrases();
		FileInputStream fstream = new FileInputStream("textfile.txt");
		BufferedReader br = new BufferedReader(new InputStreamReader(fstream));

		String strLine;

		while ((strLine = br.readLine()) != null) {
			// Splitting all the words
			String[] phrases = strLine.split("\\|");

			// Iterates over each phrase
			for (int i = 0; i < phrases.length; i++) {
				// Adding the hashcode of a string in the hashmap
				frequents.add(phrases[i]);
			}
		}

		br.close();
		
//		Map<String, Integer> s = sortHashMapAndReverseOrder(frequents.map);
		
		
		System.out.println(frequents.map.toString());
	}
	
	private static Map<String, Integer> sortHashMapAndReverseOrder(Map<String, Integer> unsortMap) {
		 
		//	Sorting by value
//		Map sortedMap = MapSort.sortByValue((HashMap<String, Integer>) unsortMap);
		
		//TODO
		// Reverse

		return null;
	}
 

}
