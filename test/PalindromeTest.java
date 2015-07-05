import static org.junit.Assert.assertEquals;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.franzejr.wallethubchallenge.palindrome.Palindrome;

public class PalindromeTest {

	private String word;
	private String wordNotPalindrome;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		word = "1221";
		wordNotPalindrome = "12212";
	}

	@Test
	public void test() {
		
		// Iterative
		assertEquals(Palindrome.isPalindrome(word), true);
		assertEquals(Palindrome.isPalindrome(wordNotPalindrome), false);
		
		//Recursive
		assertEquals(Palindrome.isPalindromeRecursive(word), true);
		assertEquals(Palindrome.isPalindromeRecursive(wordNotPalindrome), false);
	}
}
