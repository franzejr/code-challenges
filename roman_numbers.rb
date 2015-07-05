
class RomanNumbers
  class << self
    NUMBERS = {
      I: 1,
      IV: 4,
      V: 5,
      IX: 9,
      X: 10,
      XL: 40,
      L: 50,
      XC: 90,
      C: 100,
      CD: 400,
      D: 500,
      CM: 900,
      M: 1000
    }

    ROMAN_REGEX = /M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})/

    def roman_to_arabic(roman)
      result = ""
      if valid?(roman)
        result = convert(roman)
      else
        result = "Invalid Roman String"
      end
      result
    end

    private
    def valid?(roman)
      !ROMAN_REGEX.match(roman).to_s.empty?
    end

    def convert(roman)
      sum_decimal = 0

      i = 0
      while i < roman.chars.length do
        current_roman = roman.chars[i] unless roman.chars[i].nil?
        next_roman = roman.chars[i+1] unless roman.chars[i+1].nil?

        if check_next_number(current_roman, next_roman)
          i = i + 2
        else
          i = i + 1
        end
        sum_decimal += check_roman(current_roman,next_roman)
      end

      sum_decimal
    end

    def check_roman current_roman, next_roman

      if check_next_number(current_roman, next_roman)
        number = current_roman + next_roman
        return NUMBERS[number.to_sym]
      else
        return NUMBERS[current_roman.to_sym]
      end

    end

    def check_next_number(current_number, next_number)
      return true if current_number == "I" && next_number == "V"
      return true if current_number == "I" && next_number == "X"
      return true if current_number == "X" && next_number == "L"
      return true if current_number == "X" && next_number == "C"
      return true if current_number == "C" && next_number == "D"
      return true if current_number == "C" && next_number == "M"
      return false
    end

  end
end
