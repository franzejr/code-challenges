require 'minitest/autorun'
require './roman_numbers'

class TestRomanNumbers < MiniTest::Unit::TestCase

  describe "Roman to Arabic Conversion" do

    it "contains only I, V, X, L, C, D and M in the string" do
      assert_equal RomanNumbers.roman_to_arabic("X"), 10
      assert_equal RomanNumbers.roman_to_arabic("a"), "Invalid Roman String"
      assert_equal RomanNumbers.roman_to_arabic("aaaaaXXXA"), "Invalid Roman String"
      assert_equal RomanNumbers.roman_to_arabic("xl"), "Invalid Roman String"
      assert_equal RomanNumbers.roman_to_arabic("QWERTYUIP"), "Invalid Roman String"
     end

    it "should convert a roman number to arabic" do
      assert_equal RomanNumbers.roman_to_arabic("XX"), 20
      assert_equal RomanNumbers.roman_to_arabic("XXX"), 30
      assert_equal RomanNumbers.roman_to_arabic("XL"), 40
      assert_equal RomanNumbers.roman_to_arabic("XLII"), 42
      assert_equal RomanNumbers.roman_to_arabic("XLI"), 41
      assert_equal RomanNumbers.roman_to_arabic("LX"), 60
      assert_equal RomanNumbers.roman_to_arabic("CM"), 900
    end


  end
end
