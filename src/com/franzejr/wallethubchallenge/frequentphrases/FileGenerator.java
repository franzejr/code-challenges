package com.franzejr.wallethubchallenge.frequentphrases;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

/*
 * It generates a file to be used on the third question
 * Just to test
 * 
 */
public class FileGenerator {

	/*
	 * 
	 * @return phrase following the pattern <WORD> | <WORD>
	 */
	public String generatePhrase() {
		String[] PHRASES = { "FOOBAR", "FOOBAR2", "FOOBAR3", "FOOBAR4" };
		String phrase = "";
		for (int i = 0; i < 50; i++) {
			int index = (int) (Math.random() * (PHRASES.length));
			if (i == 49) {
				phrase += PHRASES[index];
			} else {
				phrase += PHRASES[index] + "|";
			}
		}
		return phrase;
	}

	/*
	 * It generates a file with a specific line number
	 * 
	 * @param int file lines quantity
	 * 
	 * @return File
	 */
	public File generateFile(int linesNumber) throws IOException {
		String text = "Hello world";
		BufferedWriter output = null;
		File file = null;
		try {
			file = new File("sample.txt");
			output = new BufferedWriter(new FileWriter(file));

			for (int i = 0; i < linesNumber; i++) {
				output.write(generatePhrase() + "\n");
			}

		} finally {
			if (output != null)
				output.close();
		}

		return file;
	}
}
