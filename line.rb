require './pattern'

class Line
  attr_accessor :string, :pattern

  def initialize(line)
    @string = line
    @pattern = Pattern.new(line)
  end

  def valid?
    @pattern.valid?
  end

end
