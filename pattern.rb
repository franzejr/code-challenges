
class Pattern
  attr_accessor :string, :pattern,:name

  def initialize(string)
    @string = string
    @name, @pattern = PATTERNS.find { |name, regex| regex.match(string) }
  end

  PATTERNS = {
    assigned: /([A-Za-z]+) is ([I|V|X|L|C|D|M])/,
    credits: /([A-Za-z]+)([A-Za-z]*) is ([0-9]+) ([cC]redits)/,
    how_much: /how much is (([A-Za-z])+) \\?/,
    how_many: /how many [cC]redits is (([A-Za-z])+) \\?/
  }

  def valid?
    if @pattern.nil? || @name.nil?
      return false
    end
    true
  end

end
