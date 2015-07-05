require './roman_numbers'

class LineProcessor
  attr_accessor :variables, :lines, :result

  def initialize
    @variables = Hash.new
    @lines = []
    @result = []
  end

  def add_line(line)
    @lines << line
  end

  def process_line(line)
    case line.pattern.name
    when :assigned then process_assigned(line.string)
    when :how_much then process_how_much_question(line.string)
    when :credits  then process_credits(line.string)
    when :how_many then process_how_many_question(line.string)
    end
  end

  def process_assigned(line)
    splitted = line.split("\sis\s")
    key,value = splitted[0].strip,splitted[1].strip
    @variables[key] = value
  end

  def process_how_much_question(line)
    variables = how_much_variables(line)
    roman_result = concatenate_roman_numbers(variables)
    complete_result = generate_formatted_output(roman_result, variables) unless roman_result.nil?

    @result << complete_result
  end

  def process_credits(line)
    value = credit_value(line)
    variables, credit_name = process_credits_variables(line)

    roman_result = concatenate_roman_numbers(variables)
    arabic_number = RomanNumbers.roman_to_arabic(roman_result)
    credit_value = (value/arabic_number)
    @variables[credit_name] = credit_value
  end

  def process_how_many_question(line)
    variables = how_many_variables(line)
    arabic_number,generated_roman_number = roman_and_arabic_number_for_how_many_question(variables)
    roman_number_converted = RomanNumbers.roman_to_arabic(generated_roman_number)
    total = roman_number_converted.to_i * arabic_number

    @result << variables.join(" ") + " is " + total.to_s
  end

  def print_result
    puts "I have no idea what you are talking about"
    @result.each do |r|
      puts r
    end
  end

  def process
    @lines.each do |line|
      process_line line
    end
    self
  end

  private
  def how_much_variables(line)
    variables = line.split("\sis\s")[1].gsub("?","").strip
    variables.split(" ")
  end

  def process_credits_variables(line)
    variables = line.gsub!(/is\s+[0-9]+\s+[cC]redits\s*/," ").strip
    variables = variables.split(/\s/)
    credit_name = variables[variables.length - 1]
    variables.delete_at(variables.length - 1)
    return variables,credit_name
  end

  def credit_value(line)
    line.match(/[0-9]+/).to_s.to_i
  end

  def how_many_variables(line)
    line.split("\sis\s")[1].gsub("?","").strip.split("\s")
  end

  def roman_and_arabic_number_for_how_many_question(variables)
    generated_roman_number = ""
    arabic_number = 0

    for key in variables
      if @variables[key].is_a? String
        generated_roman_number <<  @variables[key]
      else
        arabic_number = @variables[key]
      end
    end
    return arabic_number,generated_roman_number
  end

  def concatenate_roman_numbers(variables)
    roman_result = ""
    for key in variables
      roman_value = @variables[key]
      if roman_value.nil?
        return nil
      else
        roman_result << roman_value
      end
    end
    roman_result
  end

  def generate_formatted_output(roman_result, variables)
    arabic_value = RomanNumbers.roman_to_arabic(roman_result)
    formatted_variables = variables.join(" ")
    "#{formatted_variables} is #{arabic_value}"
  end
end
