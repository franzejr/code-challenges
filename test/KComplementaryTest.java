import static org.junit.Assert.*;

import org.junit.Test;

import com.franzejr.wallethubchallenge.palindrome.KComplementary;

public class KComplementaryTest {

	@Test
	public void test() {

		int[] firstSet = { 1, 5, 9, 4 };

		int result = KComplementary.howMany(10, firstSet);
		assertEquals(result, 3);

		int[] secondSet = { 1, 2, 9 };

		result = KComplementary.howMany(10, secondSet);
		assertEquals(result, 2);

		int[] thirdSet = { 1, 2, 1 };

		result = KComplementary.howMany(10, thirdSet);
		assertEquals(result, 0);

	}

}
