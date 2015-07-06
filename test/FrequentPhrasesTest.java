import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

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
		try {
			algorithm();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public static void algorithm() throws IOException{
		FrequentPhrases frequents = new FrequentPhrases();
		FileInputStream fstream = new FileInputStream("textfile.txt");
		BufferedReader br = new BufferedReader(new InputStreamReader(fstream));
		
		String strLine;

		while ((strLine = br.readLine()) != null)   {
		  String[] phrases = strLine.split("|");
		  for(int i = 0; i <phrases.length; i++){
			  frequents.add(phrases[i]);  
		  }
				  
		}

		br.close();
		System.out.println(frequents.toString());
	}


}
