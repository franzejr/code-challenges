import static org.junit.Assert.*;

import org.junit.Test;

import com.franzejr.wallethubchallenge.kcomplementary.KComplementary;

public class KComplementaryTest {

	@Test
	public void test() {

		int[] firstSet = { 1, 5, 9, 4 };
		int result;

		KComplementary kComplementary = new KComplementary(10, firstSet);
		result = kComplementary.howMany();
		assertEquals(result, 3);

		int[] secondSet = { 1, 2, 9 };

		kComplementary = new KComplementary(10, secondSet);
		result = kComplementary.howMany();
		assertEquals(result, 2);

		int[] thirdSet = { 1, 2, 1 };

		kComplementary = new KComplementary(10, thirdSet);
		result = kComplementary.howMany();
		assertEquals(result, 0);
	}

}
