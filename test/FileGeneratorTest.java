import static org.junit.Assert.*;

import java.io.IOException;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.franzejr.wallethubchallenge.frequentphrases.FileGenerator;


public class FileGeneratorTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test() {
		FileGenerator fileGenerator = new FileGenerator();
		System.out.println(fileGenerator.generatePhrase());
		
		try {
			fileGenerator.generateFile(20);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
